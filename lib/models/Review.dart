class Review {
  final dynamic id;
  final int note;
  final String message;
  final dynamic user;

  Review({
    required this.id,
    required this.note,
    required this.message,
    required this.user,
  });

  factory Review.fromJson(Map<String, dynamic> json) {
    return Review(
      id: json['id'],
      note: json['note'],
      message: json['message'],
      user: json['user'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'note': note,
      'message': message,
      'user': user,
    };
  }
}
