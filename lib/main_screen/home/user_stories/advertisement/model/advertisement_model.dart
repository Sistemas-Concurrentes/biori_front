import '../../releases/release_model_interface.dart';

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

}
