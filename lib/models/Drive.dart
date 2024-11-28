class Drive {
  final String pickup;
  final String destination;
  final DateTime deptime;
  final double price;
  final int disponibleSeats;
  final String description;
  final int idDriver;

  Drive({
    required this.pickup,
    required this.destination,
    required this.deptime,
    required this.price,
    required this.disponibleSeats,
    required this.description,
    required this.idDriver,
  });

  /// Factory pour créer une instance de `Drive` à partir d'un JSON
  factory Drive.fromJson(Map<String, dynamic> json) {
    return Drive(
      pickup: json['pickup'],
      destination: json['destination'],
      deptime: DateTime.parse(json['deptime']),
      price: json['price'],
      disponibleSeats: json['disponible_seats'],
      description: json['description'],
      idDriver: json['id_driver'],
    );
  }

  /// Méthode pour convertir une instance de `Drive` en JSON
  Map<String, dynamic> toJson() {
    return {
      'pickup': pickup,
      'destination': destination,
      'deptime': deptime.toIso8601String(),
      'price': price,
      'disponible_seats': disponibleSeats,
      'description': description,
      'id_driver': idDriver,
    };
  }
}
