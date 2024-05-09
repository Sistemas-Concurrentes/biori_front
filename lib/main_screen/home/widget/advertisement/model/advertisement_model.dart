import '../../releases_widgets/release_model_interface.dart';

class AdvertisementModel implements ReleaseModelInterface {
  int id;
  Map<int, String> groupsInfo;
  String title;
  String description;
  String creatorName;

  @override
  DateTime lastUpdate;

  int? teacherUserId;
  int? delegateUserId;

  AdvertisementModel(
      {required this.id,
      required this.groupsInfo,
      required this.title,
      required this.description,
      required this.creatorName,
      required this.lastUpdate,
      this.teacherUserId,
      this.delegateUserId});

  factory AdvertisementModel.fromJson(Map<String, dynamic> json) {
    final Map<int, String> groupsInfo = {};

    for (var group in json['groups'] as List<dynamic>) {
      groupsInfo[group['id']] = group['name'];
    }

    return AdvertisementModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      groupsInfo: groupsInfo,
      creatorName: json['userName'],
      lastUpdate: DateTime.parse(json['updatedAt'].toString()),
      teacherUserId: json['userId'],
    );
  }
}
