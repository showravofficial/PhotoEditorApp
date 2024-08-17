class EditedImage {
  final String id;
  final String path;

  EditedImage({required this.id, required this.path});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'path': path,
    };
  }

  factory EditedImage.fromMap(Map<String, dynamic> map) {
    return EditedImage(
      id: map['id'],
      path: map['path'],
    );
  }
}
