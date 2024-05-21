import 'package:biori/main_screen/home/widget/releases_widgets/release_model_interface.dart';
import 'package:biori/style/model/chip_button_model.dart';

class EventGroupModel implements ReleaseModelInterface {
  int id;
  String title;
  String category;
  String description;
  int organiserId;
  String organiserName;
  List<DateTime> dates;
  String location;
  int numberLikes;
  List<ChipButtonModel> groups;

  DateTime? endInscription;
  @override
  DateTime lastUpdate;

  bool isSubscribed;
  bool isLiked = false;

  EventGroupModel(
      {required this.id,
      required this.title,
      required this.category,
      required this.description,
      required this.organiserId,
      required this.organiserName,
      required this.dates,
      required this.location,
      required this.groups,
      required this.lastUpdate,
      this.isSubscribed = false,
      this.isLiked = false,
      this.numberLikes = 0,
      this.endInscription});

  factory EventGroupModel.fromJson(Map<String, dynamic> json) {
    return EventGroupModel(
      id: json['id'],
      title: json['title'],
      category: json['category'],
      description: json['description'],
      organiserId: json['organiser'],
      organiserName: json['organiserName'],
      dates: (json['dates'] as List<dynamic>)
          .map((date) => DateTime.parse(date.toString()))
          .toList(),
      location: json['location'],
      groups: (json['groups'] as List<dynamic>)
          .map((tag) =>
              ChipButtonModel(name: tag['groupsId'], id: tag['groupsName']))
          .toList(),
      lastUpdate: DateTime.parse(json['updatedAt'].toString()),
      numberLikes: json['likes'],
      endInscription: json['dateEndInscription'] != null
          ? DateTime.parse(json['dateEndInscription'].toString())
          : null,
    );
  }
}
