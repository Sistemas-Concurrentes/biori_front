class TagsButtonsModel {
  final String name;
  final int id;
  bool isFollowed;

  TagsButtonsModel({
    required this.name,
    required this.id,
    this.isFollowed=false,
  });

  static List<TagsButtonsModel> getCategoriesButtons() {
    List<TagsButtonsModel> categories = [];
    categories.add(TagsButtonsModel(name: "All", id: 9, isFollowed: true));

    return categories;
  }

  void changeSelected() {
    isFollowed = !isFollowed;
  }
}
