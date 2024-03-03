class EventModel {
  int id;
  String title;
  String category;
  String organizer;
  String description;
  DateTime date;
  DateTime? endInscription;
  bool isLiked = false;
  bool isSubscribed;
  String location;
  int numberLikes;

  EventModel(
      {required this.id,
      required this.title,
      required this.category,
      required this.organizer,
      required this.description,
      required this.date,
      required this.location,
      this.endInscription,
      this.isSubscribed = false,
      this.isLiked = false,
      this.numberLikes = 0});
}
