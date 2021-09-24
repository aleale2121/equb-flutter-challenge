class DuePayment {
  DuePayment(
      {required this.createdAt,
      required this.owedAmount,
      required this.dueDate,
      required this.name,
      required this.paidRounds,
      required this.totalRounds,
      required this.id,
      required this.imagePath});
  late final String createdAt;
  late final String owedAmount;
  late final String dueDate;
  late final String name;
  late final int paidRounds;
  late final int totalRounds;
  late final String id;
  late final String imagePath;

  DuePayment.fromJson(Map<String, dynamic> json) {
    imagePath = "";
    createdAt = json['createdAt'];
    owedAmount = json['owedAmount'];
    dueDate = json['dueDate'];
    name = json['name'];
    paidRounds = json['paidRounds'];
    totalRounds = json['totalRounds'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['createdAt'] = createdAt;
    _data['owedAmount'] = owedAmount;
    _data['dueDate'] = dueDate;
    _data['name'] = name;
    _data['paidRounds'] = paidRounds;
    _data['totalRounds'] = totalRounds;
    _data['id'] = id;
    return _data;
  }
}
