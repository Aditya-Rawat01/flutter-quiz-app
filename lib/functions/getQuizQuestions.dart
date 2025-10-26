import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_quiz_app/pages/quizPage.dart';

Future<List<Question>> getAllDocuments(String collectionPath) async {
  try {
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    QuerySnapshot querySnapshot = await firestore.collection(collectionPath).get();

    List<Question> questions = querySnapshot.docs.map((doc) {
      final data = doc.data() as Map<String, dynamic>?; // Safely get data as a map

      if (data == null) {
        print("Warning: Document ${doc.id} has no data. Skipping.");
        return null; // Will be filtered out later
      }

      // Explicitly convert the options list to List<String>
      // If 'options' is null or not a List, it defaults to an empty List<String>
      final List<String> parsedOptions =
          List<String>.from(data['options'] as List<dynamic>? ?? []);

      return Question(
        question: data['question'] as String? ?? '', // Cast to String, default to empty
        options: parsedOptions,
        ans: data['ans'] as String? ?? '', // Cast to String, default to empty
      );
    }).whereType<Question>().toList(); // Filter out any nulls that were returned

    return questions;
  } catch (e) {
    print("Error getting documents: $e");
    return []; // Return an empty list on error
  }
}
