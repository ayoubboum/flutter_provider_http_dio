import 'dart:convert';
import 'package:fltr_provider/model/categories.dart';
import 'package:fltr_provider/provider/base_state.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/services.dart' show rootBundle;

class TodoProvider extends BaseState {
  CategoriesList _get_todo;

  CategoriesList get get_todo => _get_todo;

  Future<CategoriesList> loadCategories() async {
    setState(ViewState.LOADING);
    String jsonCategories = await rootBundle
        .loadString('assets/json/categories.json');
    final jsonResponse = json.decode(jsonCategories);
    _get_todo = CategoriesList.fromJson(jsonResponse);
    print("CategorieAsset " + _get_todo.categories[0].name);
    setState(ViewState.LOADED);
    return _get_todo;
  }
}
