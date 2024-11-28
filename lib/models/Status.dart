class Status {
  final dynamic id;
  final String name;
  final String description;

  Status({
    required this.id,
    required this.name,
    required this.description,
  });

  factory Status.fromJson(Map<String, dynamic> json) {
    return Status(
      id: json['id'],
      name: json['name'],
      description: json['description'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
    };
  }
}
