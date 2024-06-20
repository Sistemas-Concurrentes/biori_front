import 'package:biori/main_screen/home/widget/events/interface/event_model_interface.dart';
import 'package:biori/main_screen/home/widget/releases_widgets/release_model_interface.dart';
import 'package:biori/style/model/chip_button_model.dart';

import '../../../listeners/card_listener_interface.dart';

class EventGroupModel implements ReleaseModelInterface, EventModelInterface {
  @override
  int id;

  @override
  ReleaseType get releaseType => ReleaseType.eventGroup;
  @override
  String title;
  @override
  String category;
  @override
  String description;
  @override
  int organiserId;
  @override
  String organiserName;
  @override
  List<DateTime> dates;
  @override
  String location;
  @override
  int numberLikes;
  @override
  DateTime? endInscription;
  @override
  DateTime lastUpdate;
  @override
  bool isSubscribed;
  @override
  bool isLiked = false;

  List<ChipButtonModel> groups;

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
          .map((group) =>
              ChipButtonModel(name: group['groupTitle'], id: group['groupId']))
          .toList(),
      lastUpdate: DateTime.parse(json['updatedAt'].toString()),
      numberLikes: json['likes'],
      isLiked: json['isLiked'] == 1,
      isSubscribed: json['isRegistered'] == 1,
      endInscription: json['dateEndInscription'] != null
          ? DateTime.parse(json['dateEndInscription'].toString())
          : null,
    );
  }
}
