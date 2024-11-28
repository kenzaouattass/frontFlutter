class PaymentMethod {
  final dynamic id;
  final String type;
  final dynamic details;

  PaymentMethod({
    required this.id,
    required this.type,
    required this.details,
  });

  factory PaymentMethod.fromJson(Map<String, dynamic> json) {
    return PaymentMethod(
      id: json['id'],
      type: json['type'],
      details: json['details'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'type': type,
      'details': details,
    };
  }
}
