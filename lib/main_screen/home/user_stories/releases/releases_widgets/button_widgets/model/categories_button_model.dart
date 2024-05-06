import 'package:biori/style/model/chip_button_model.dart';

class TagsButtonsModel extends ChipButtonModel {
  TagsButtonsModel(
      {required String name, required int id, bool isFollowed = false})
      : super(name: name, id: id, isFollowed: isFollowed);

  static List<TagsButtonsModel> getCategoriesButtons() {
    List<TagsButtonsModel> categories = [];
    categories.add(TagsButtonsModel(name: "All", id: 9, isFollowed: true));

    return categories;
  }

  @override
  Map<String, dynamic> toJson() {
    return {"name": name, "id": id};
  }

  void changeSelected() {
    isFollowed = !isFollowed;
  }
}
