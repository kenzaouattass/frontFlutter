class Document {
  final dynamic id;
  final String title;
  final String url;
  final dynamic user;

  Document({
    required this.id,
    required this.title,
    required this.url,
    required this.user,
  });

  factory Document.fromJson(Map<String, dynamic> json) {
    return Document(
      id: json['id'],
      title: json['title'],
      url: json['url'],
      user: json['user'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'url': url,
      'user': user,
    };
  }
}
