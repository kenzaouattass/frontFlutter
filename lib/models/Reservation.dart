class Reservation {
  final dynamic id;
  final int seats;
  final dynamic drive;
  final dynamic user;
  final dynamic status;
  final dynamic bill;

  Reservation({
    required this.id,
    required this.seats,
    required this.drive,
    required this.user,
    required this.status,
    required this.bill,
  });

  factory Reservation.fromJson(Map<String, dynamic> json) {
    return Reservation(
      id: json['id'],
      seats: json['seats'],
      drive: json['drive'],
      user: json['user'],
      status: json['status'],
      bill: json['bill'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'seats': seats,
      'drive': drive,
      'user': user,
      'status': status,
      'bill': bill,
    };
  }
}
