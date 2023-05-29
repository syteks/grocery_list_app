import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:grocery_list_app/api/api_base.dart';
import 'package:grocery_list_app/models/grocery_list.dart';

class GroceryListApi extends ApiBase {
  /// Initiate a instance of GroceryListApi.
  GroceryListApi() {
    super.baseUrl = dotenv.env['API_URL']!;
  }

  /// Gets all the lists associated with the connected user.
  Future<List<GroceryList>> fetchLists() async {
    final response = await get('grocery-lists');

    Iterable lists = json.decode(response.body);

    return List<GroceryList>.from(lists.map((model) => GroceryList.fromJson(model)));
  }
}