import 'package:flutter/material.dart';

class CategoriesButtonsModel {
  final String name;
  final int id;
  bool isFollowed;

  CategoriesButtonsModel({
    required this.name,
    required this.id,
    this.isFollowed=false,
  });

  static List<CategoriesButtonsModel> getCategoriesButtons() {
    List<CategoriesButtonsModel> categories = [];
    categories.add(CategoriesButtonsModel(name: "All", id: 9, isFollowed: true));

    return categories;
  }

  void changeSelected() {
    isFollowed = !isFollowed;
  }
}
