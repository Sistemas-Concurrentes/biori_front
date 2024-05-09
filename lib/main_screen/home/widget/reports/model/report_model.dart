import 'package:biori/main_screen/home/widget/releases_widgets/release_model_interface.dart';

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

  factory ReportModel.fromJson(Map<String, dynamic> json) {
    return ReportModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      creatorName: json['teacherName'],
      lastUpdate: DateTime.parse(json['updatedAt']),
      teacherUserId: json['teacherId'],
    );
  }
}
