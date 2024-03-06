import 'package:biori/style/releases_widgets/button_widgets/model/categories_button_model.dart';

class EventModel {
  int id;
  String title;
  List<CategoriesButtonsModel> categories ;
  String organizer;
  String description;
  DateTime date;
  String location;
  DateTime lastUpdate;
  bool isSubscribed;
  DateTime? endInscription;
  bool isLiked = false;
  int numberLikes;

  EventModel(
      {required this.id,
      required this.title,
      required this.categories,
      required this.organizer,
      required this.description,
      required this.date,
      required this.location,
        required this.lastUpdate,
      this.endInscription,
      this.isSubscribed = false,
      this.isLiked = false,
      this.numberLikes = 0});
}
