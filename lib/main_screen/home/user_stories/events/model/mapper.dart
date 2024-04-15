import 'package:biori/main_screen/home/user_stories/releases/releases_widgets/button_widgets/model/categories_button_model.dart';

import 'event_model.dart';

class EventMapper {
  List<EventModel> fromJson(List<dynamic> listEventsJson) {
    return listEventsJson.map((eventJson) =>
        EventModel(
          id: eventJson['id'],
          title: eventJson['title'],
          category: eventJson['category'],
          description: eventJson['description'],
          organiserId: eventJson['organiser'],
          organiserName: eventJson['organiserName'],
          dates: getDatesFromJson(eventJson['dates']),
          location: eventJson['location'],
          tags: getTagsFromJson(eventJson['tags']),
          lastUpdate: DateTime.parse(eventJson['updatedAt'].toString()),
          numberLikes: eventJson['likes'],
          endInscription: eventJson['endInscription'] != null ? DateTime.parse(eventJson['endInscription'].toString()) : null,
        )
    ).toList();
  }

  List<DateTime> getDatesFromJson(List<dynamic> json) {

    return json.map((date) => DateTime.parse(date.toString())).toList();
  }

  List<TagsButtonsModel> getTagsFromJson(List<dynamic> json) {
    return json
        .map((tag) => TagsButtonsModel(name: tag['tagTitle'], id: tag['tagId']))
        .toList();
  }
}
