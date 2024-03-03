import 'package:flutter/material.dart';

class CategoriesButtonsModel {
  final String name;
  bool isSelected;

  CategoriesButtonsModel({
    required this.name,
    required this.isSelected,
  });

  static List<CategoriesButtonsModel> getCategoriesButtons() {
    List<CategoriesButtonsModel> categories = [];
    categories.add(CategoriesButtonsModel(name: "All", isSelected: true));
    categories.add(CategoriesButtonsModel(name: "Music", isSelected: false));
    categories.add(CategoriesButtonsModel(name: "Sports", isSelected: false));
    categories.add(CategoriesButtonsModel(name: "Theater", isSelected: false));
    categories.add(CategoriesButtonsModel(name: "Cinema", isSelected: false));

    return categories;
  }

  void changeSelected() {
    isSelected = !isSelected;
  }
}
