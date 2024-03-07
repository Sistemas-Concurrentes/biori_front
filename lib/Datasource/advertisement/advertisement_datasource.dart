
import 'package:biori/main_screen/home/user_stories/advertisement/model/advertisement_model.dart';

class AdvertisementDatasource {
  List<AdvertisementModel> getAdvertisements() {
    return [
      AdvertisementModel(
        id: 1,
        groupsInfo: {1: "Grupo 3 Organografía"},
        title: "Presentaciones de prácticas.",
        description: "Debido a las peticiones de algunos de vosotros os aviso para que sepáis que las presentaciones están subidas a Prado.",
        creatorName: "Creador 2",
        delegateUserId: 2,
        lastUpdate: DateTime (2024, 1, 12),
      ),
      AdvertisementModel(
        id: 2,
        groupsInfo: {1: "Grupo 1 Organografía", 2: "Grupo 2 Organografía", 3: "Grupo 3 Organografía"},
        title: "Convocatoria movilidad para Grado",
        description: "Se abre el plazo para solicitar becas movilidad para estudiantes de Grado",
        creatorName: "Creador 3",
        lastUpdate: DateTime (2023, 12, 15),
      ),
      AdvertisementModel(
        id: 3,
        groupsInfo: {1: "Grupo 1 Organografía"},
        title: "Recuperación de Clase",
        description: "La clase del pasado miércoles se recuperará el próximo lunes en el aula A12 de 12-13: horas.",
        creatorName: "Profesor 1",
        teacherUserId: 1,
        lastUpdate: DateTime (2023, 12, 12),
      ),

    ];
  }

  List<int> getGroupsSubscribedByUser() {
    return [1,2,3 ,4];
  }
}