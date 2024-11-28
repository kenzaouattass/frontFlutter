class PaymentInfo {
  final int amount;
  final String currency;
  final String receiptEmail;

  PaymentInfo({
    required this.amount,
    required this.currency,
    required this.receiptEmail,
  });

  factory PaymentInfo.fromJson(Map<String, dynamic> json) {
    return PaymentInfo(
      amount: json['amount'],
      currency: json['currency'],
      receiptEmail: json['receiptEmail'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'amount': amount,
      'currency': currency,
      'receiptEmail': receiptEmail,
    };
  }
}
