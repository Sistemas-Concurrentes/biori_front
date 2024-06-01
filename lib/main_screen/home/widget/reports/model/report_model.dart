import 'package:biori/main_screen/home/widget/releases_widgets/release_model_interface.dart';

class ReportModel implements ReleaseModelInterface {
  int id;
  String title;
  String description;
  String creatorName;
  int creatorId;
  List<int> courses;
  bool toTeachers;

  @override
  DateTime lastUpdate;

  ReportModel(
      {required this.id,
      required this.title,
      required this.description,
      required this.creatorName,
    required this.creatorId,
    required this.courses,
    required this.toTeachers,
    required this.lastUpdate,
      });

  factory ReportModel.fromJson(Map<String, dynamic> json) {
    return ReportModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      creatorName: json['userName'],
      creatorId: json['userId'],
      courses: (json['courses'] as List<dynamic>)
          .map((course) => course as int)
          .toList(),
      toTeachers: json['toTeachers'] == 1,
      lastUpdate: DateTime.parse(json['updatedAt']),
    );
  }
}
