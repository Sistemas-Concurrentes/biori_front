
import 'package:biori/main_screen/home/user_stories/advertisement/model/advertisement_model.dart';

class AdvertisementDatasource {
  List<AdvertisementModel> getAdvertisements() {
    return [
      AdvertisementModel(
        id: 1,
        groupsInfo: {1: "Grupo 1", 2: "Grupo 2"},
        title: "Anuncio 1",
        description: "Descripcion 1",
        creatorName: "Creador 1",
        teacherUserId: 1,
        lastUpdate: DateTime (2021, 10, 10),
      ),
      AdvertisementModel(
        id: 2,
        groupsInfo: {1: "Grupo 1", 2: "Grupo 2"},
        title: "Anuncio 2",
        description: "Descripcion 2",
        creatorName: "Creador 2",
        delegateUserId: 2,
        lastUpdate: DateTime (2021, 10, 1),
      ),
      AdvertisementModel(
        id: 3,
        groupsInfo: {1: "Grupo 1", 4: "Grupo 4"},
        title: "Anuncio 3",
        description: "Descripcion 3",
        creatorName: "Creador 3",
        lastUpdate: DateTime (2021, 10, 1),
      ),

    ];
  }

  List<int> getGroupsSubscribedByUser() {
    return [1 ,4];
  }
}
