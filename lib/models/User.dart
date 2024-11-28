class User {
  final dynamic id;
  final String password;
  final String name;
  final String firstName;
  final String email;
  final String phone;
  final String role;
  final dynamic documents;
  final dynamic reviews;
  final dynamic cars;
  final dynamic drives;
  final dynamic reservations;
  final dynamic sentMessages;
  final dynamic receivedMessages;

  User({
    required this.id,
    required this.password,
    required this.name,
    required this.firstName,
    required this.email,
    required this.phone,
    required this.role,
    required this.documents,
    required this.reviews,
    required this.cars,
    required this.drives,
    required this.reservations,
    required this.sentMessages,
    required this.receivedMessages,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      password: json['password'],
      name: json['name'],
      firstName: json['firstName'],
      email: json['email'],
      phone: json['phone'],
      role: json['role'],
      documents: json['documents'],
      reviews: json['reviews'],
      cars: json['cars'],
      drives: json['drives'],
      reservations: json['reservations'],
      sentMessages: json['sentMessages'],
      receivedMessages: json['receivedMessages'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'password': password,
      'name': name,
      'firstName': firstName,
      'email': email,
      'phone': phone,
      'role': role,
      'documents': documents,
      'reviews': reviews,
      'cars': cars,
      'drives': drives,
      'reservations': reservations,
      'sentMessages': sentMessages,
      'receivedMessages': receivedMessages,
    };
  }
}
