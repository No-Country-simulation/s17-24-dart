class NoteModel {
  int? id;
  String text;
  String status;

  NoteModel({
    this.id,
    required this.text,
    required this.status,
  });

  // Convert a Note into a Map. The keys must correspond to the names of the columns in the database.
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'text': text,
      'status': status,
    };
  }

  // Extract a Note object from a Map.
  factory NoteModel.fromMap(Map<String, dynamic> map) {
    return NoteModel(
      id: map['id'],
      text: map['text'],
      status: map['status'],
    );
  }
}
