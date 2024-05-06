class ChipButtonModel {
  final String name;
  final int id;
  bool isFollowed;

  ChipButtonModel(
      {required this.id, required this.name, this.isFollowed = false});

  Map<String, dynamic> toJson() {
    return {"name": name, "id": id};
  }
}
