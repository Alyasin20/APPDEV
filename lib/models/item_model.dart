class Item {
  final int? id;
  final String name;
  final String expiryDate;

  Item({this.id, required this.name, required this.expiryDate});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'expiryDate': expiryDate,
    };
  }
}
