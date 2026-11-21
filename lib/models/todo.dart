import 'package:cloud_firestore/cloud_firestore.dart';

class Todo {
  final String id;
  final String task;
  final bool isDone;
  final Timestamp? createdAt;

  Todo({
    required this.id,
    required this.task,
    required this.isDone,
    this.createdAt,
  });

  // Ubah objek firestore ke bentuk model
  factory Todo.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return Todo(
      id: doc.id,
      task: data['task'] as String? ?? '',
      isDone: data['isDone'] as bool? ?? false,
      createdAt: data['createdAt'] as Timestamp?,
    );
  }

  // Ubah sebaliknya bentuk model ke bentuk objek firestore
  Map<String, dynamic> toFirestore() {
    return {
      'task': task,
      'isDone': isDone,
      'createdAt': createdAt ?? FieldValue.serverTimestamp(),
    };
  }
}