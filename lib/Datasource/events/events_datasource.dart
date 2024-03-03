
import '../../main_screen/home/user_stories/events/model/event_model.dart';

class EventsDatasource {
  List<EventModel> getEvents() {
    return [
      EventModel(
        id: 1,
        title: "Evento 1",
        category: "Categoria 1",
        organizer: "Organizador 1",
        description: "Descripcion 1",
        date: DateTime.now(),
        location: "Ubicacion 1",
        isSubscribed: true,
      ),
      EventModel(
        id: 2,
        title: "Evento 2",
        category: "Categoria 2",
        organizer: "Organizador 2",
        description: "Descripcion 2",
        date: DateTime.now(),
        location: "Ubicacion 2",
        endInscription: DateTime.now(),
      ),
    ];
  }
}
