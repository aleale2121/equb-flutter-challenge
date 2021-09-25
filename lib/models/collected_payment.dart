class CollectedPayment {
  CollectedPayment({
    required this.createdAt,
    required this.title,
    required this.frequency,
    required this.amount,
    required this.membersCount,
    required this.id,
  });
  late final String createdAt;
  late final String title;
  late final int frequency;
  late final String amount;
  late final int membersCount;
  late final String id;

  CollectedPayment.fromJson(Map<String, dynamic> json){
    createdAt = json['createdAt'];
    title = json['title'];
    frequency = json['frequency'];
    amount = json['amount'];
    membersCount = json['membersCount'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['createdAt'] = createdAt;
    _data['title'] = title;
    _data['frequency'] = frequency;
    _data['amount'] = amount;
    _data['membersCount'] = membersCount;
    _data['id'] = id;
    return _data;
  }
}