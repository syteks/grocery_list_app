class GroceryList {
  final int id;
  final String name;
  final String ?sharingCode;
  final String ?createdAt;
  final String ?updatedAt;

  const GroceryList({
    required this.id,
    required this.name,
    this.sharingCode,
    this.createdAt,
    this.updatedAt,
  });

  factory GroceryList.fromJson(Map<String, dynamic> json) {
    return GroceryList(
      id: json['id'],
      name: json['name'],
      sharingCode: json['sharing_code'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }
}