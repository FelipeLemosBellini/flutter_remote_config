class ServicesModel {
  bool buy;
  bool sell;
  bool deposit;
  bool convert;
  bool leverage;

  ServicesModel({
    required this.buy,
    required this.sell,
    required this.deposit,
    required this.convert,
    required this.leverage,
  });

  factory ServicesModel.defaultModel() {
    return ServicesModel(
      buy: false,
      sell: false,
      deposit: false,
      convert: false,
      leverage: false,
    );
  }

  factory ServicesModel.fromMap(Map<String, dynamic> map) {
    return ServicesModel(
      buy: map['buy'] ?? false,
      sell: map['sell'] ?? false,
      deposit: map['deposit'] ?? false,
      convert: map['convert'] ?? false,
      leverage: map['leverage'] ?? false,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'buy': buy,
      'sell': sell,
      'deposit': deposit,
      'convert': convert,
      'leverage': leverage,
    };
  }
}
