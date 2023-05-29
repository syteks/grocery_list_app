import 'package:flutter/material.dart';
import 'package:grocery_list_app/api/grocery_list_api.dart';
import 'package:grocery_list_app/models/grocery_list.dart';
import 'package:grocery_list_app/shopping_list/shopping_list_card.dart';
import 'package:grouped_list/grouped_list.dart';


class ShoppingList extends StatefulWidget {
  const ShoppingList({Key? key}) : super(key: key);

  @override
  State<ShoppingList> createState() => _ShoppingListState();
}

class _ShoppingListState extends State<ShoppingList> {
  late List<GroceryList> lists = List<GroceryList>.empty();

  @override void initState() {
    super.initState();
    final groceryListApi = GroceryListApi();

    groceryListApi.fetchLists().then((value) {
      setState(() {
        lists = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: GroupedListView<dynamic, String>(
            elements: List<dynamic>.from(
                lists.map((list) => {'name': list.name, 'group': ''})),
            groupBy: (element) => element['group'],
            groupComparator: (value1, value2) => value2.compareTo(value1),
            itemComparator: (item1, item2) =>
                item1['name'].compareTo(item2['name']),
            order: GroupedListOrder.DESC,
            useStickyGroupSeparators: true,
            groupSeparatorBuilder: (String value) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                value,
                textAlign: TextAlign.center,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            itemBuilder: (c, element) {
              return ShoppingListCard(element: element);
            },
          ),
        ),
        Align(
          alignment: Alignment(0.9, 0.5),
          heightFactor: 2,
          child: SizedBox(
            height: 60,
            width: 60,
            child: ElevatedButton(
              onPressed: () {
                print('button was clicked');
              },
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50))
              ),
              child: Icon(Icons.add),
            ),
          ),
        )
      ],
    );
  }
}
