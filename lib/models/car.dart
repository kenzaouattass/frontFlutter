class Car {
  final dynamic id;
  final String manufacturer;
  final String model;
  final dynamic number_of_seats;
  final String color;
  final String licence_plate;
  final dynamic user;

  Car({
    required this.id,
    required this.manufacturer,
    required this.model,
    required this.number_of_seats,
    required this.color,
    required this.licence_plate,
    required this.user,
  });

  factory Car.fromJson(Map<String, dynamic> json) {
    return Car(
      id: json['id'],
      manufacturer: json['manufacturer'],
      model: json['model'],
      number_of_seats: json['number_of_seats'],
      color: json['color'],
      licence_plate: json['licence_plate'],
      user: json['user'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'manufacturer': manufacturer,
      'model': model,
      'number_of_seats': number_of_seats,
      'color': color,
      'licence_plate': licence_plate,
      'user': user,
    };
  }
}
