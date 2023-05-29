import 'package:flutter/material.dart';

class ShoppingListCard extends StatefulWidget {
  final dynamic element;
  
  const ShoppingListCard({Key? key, required this.element}) : super(key: key);

  @override
  State<ShoppingListCard> createState() => _ShoppingListCard();
}

class _ShoppingListCard extends State<ShoppingListCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8.0,
      margin:
      const EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
      child: SizedBox(
        child: ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          leading: const Icon(Icons.shopping_bag_outlined),
          title: Text(widget.element['name']),
          trailing: const Icon(Icons.arrow_forward),
        ),
      ),
    );
  }
}

class ShoppingListData {
  String name;
  String? group;

  ShoppingListData({
    required this.name,
    this.group = '',
  });
}
