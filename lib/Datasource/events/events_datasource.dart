
import 'package:biori/style/releases_widgets/button_widgets/model/categories_button_model.dart';

import '../../main_screen/home/user_stories/events/model/event_model.dart';

class EventsDatasource {
  List<EventModel> getEvents() {
    return [
      EventModel(
        id: 1,
        title: "Evento 1",
        categories: [categoria1, categoria2],
        organizer: "Organizador 1",
        description: "Descripcion 1",
        date: DateTime.now(),
        location: "Ubicacion 1",
        isSubscribed: true,
      ),
      EventModel(
        id: 2,
        title: "Evento 2",
        categories: [categoria1, categoria3],
        organizer: "Organizador 2",
        description: "Descripcion 2",
        date: DateTime.now(),
        location: "Ubicacion 2",
        endInscription: DateTime.now(),
      ),
      EventModel(
        id: 3,
        title: "Evento 3",
        categories: [categoria1, categoria4],
        organizer: "Organizador 3",
        description: "Descripcion 3",
        date: DateTime.now(),
        location: "Ubicacion 3",
      ),
    ];
  }

  List<int> getCategoriesFollowedByUser() {
    return [1 ,4];
  }
}

CategoriesButtonsModel categoria1 = CategoriesButtonsModel(
  id: 1,
  name: "Categoria 1",
  isFollowed: false,
);
CategoriesButtonsModel categoria2 = CategoriesButtonsModel(
  id: 2,
  name: "Categoria 2",
  isFollowed: false,
);
CategoriesButtonsModel categoria3 = CategoriesButtonsModel(
  id: 3,
  name: "Categoria 3",
  isFollowed: false,
);
CategoriesButtonsModel categoria4 = CategoriesButtonsModel(
  id: 4,
  name: "Categoria 4",
  isFollowed: false,
);
CategoriesButtonsModel categoria5 = CategoriesButtonsModel(
  id: 5,
  name: "Categoria 5",
  isFollowed: false,
);

