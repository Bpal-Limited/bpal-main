class WalletModel {
  final String id;
  final String alias;
  final String balance;
  final String currency;

  WalletModel({
    required this.id,
    required this.alias,
    required this.balance,
    required this.currency,
  });

  factory WalletModel.fromJson(Map<String, dynamic> json) {
    return WalletModel(
      id: json['id'] ?? '',
      alias: json['alias'] ?? '',
      balance: json['balance'] ?? '',
      currency: json['currency'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'alias': alias,
      'balance': balance,
      'currency': currency,
    };
  }
}
