import 'package:biori/main_screen/home/user_stories/releases/releases_widgets/button_widgets/model/categories_button_model.dart';

import 'event_model.dart';

class EventMapper {
  List<EventModel> fromJson(List<dynamic> listEventsJson) {
    return listEventsJson
        .where((eventJson) {
          try {
            EventModel.fromJson(eventJson);
            return true;
          } catch (e) {
            return false;
          }
        })
        .map((eventJson) => EventModel.fromJson(eventJson))
        .toList();
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
