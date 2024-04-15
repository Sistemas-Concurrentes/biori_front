import '../../releases/release_model_interface.dart';

class ReportModel implements ReleaseModelInterface {
  int id;
  String title;
  String description;
  String creatorName;

  @override
  DateTime lastUpdate;

  int teacherUserId;

  ReportModel(
      {required this.id,
      required this.title,
      required this.description,
      required this.creatorName,
      required this.lastUpdate,
      required this.teacherUserId,
      });

}
