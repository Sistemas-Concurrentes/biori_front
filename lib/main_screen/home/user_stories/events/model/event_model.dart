import 'package:biori/main_screen/home/user_stories/releases/release_model_interface.dart';
import 'package:biori/main_screen/home/user_stories/releases/releases_widgets/button_widgets/model/categories_button_model.dart';

class EventModel implements ReleaseModelInterface {
  int id;
  String title;
  String category;
  String description;
  int organiserId;
  String organiserName;
  List<DateTime> dates;
  String location;
  int numberLikes;
  List<TagsButtonsModel> tags;

  DateTime? endInscription;
  @override
  DateTime lastUpdate;

  bool isSubscribed;
  bool isLiked = false;

  EventModel(
      {required this.id,
      required this.title,
      required this.category,
      required this.description,
      required this.organiserId,
      required this.organiserName,
      required this.dates,
      required this.location,
      required this.tags,
      required this.lastUpdate,
      this.isSubscribed = false,
      this.isLiked = false,
      this.numberLikes = 0,
      this.endInscription});

  factory EventModel.fromJson(Map<String, dynamic> json) {
    return EventModel(
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
      tags: (json['tags'] as List<dynamic>)
          .map((tag) =>
              TagsButtonsModel(name: tag['tagTitle'], id: tag['tagId']))
          .toList(),
      lastUpdate: DateTime.parse(json['updatedAt'].toString()),
      numberLikes: json['likes'],
      endInscription: json['endInscription'] != null
          ? DateTime.parse(json['endInscription'].toString())
          : null,
    );
  }
}
