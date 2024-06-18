abstract class EventModelInterface {
  String get title;

  String get category;

  String get description;

  int get organiserId;

  String get organiserName;

  List<DateTime> get dates;

  String get location;

  int get numberLikes;

  DateTime? get endInscription;

  bool get isSubscribed;

  bool get isLiked;

  set isLiked(bool value);

  set numberLikes(int value);
}
