import 'package:biori/main_screen/home/user_stories/reports/model/report_model.dart';

class ReportDatasource {
  List<ReportModel> getReports() {
    return [
      ReportModel(
          id: 1,
          title: "Se abre periodo alteración de matrícula",
          description:
              "Ayuda en secretaría para aquellos estudiantes que deseen cambiar alguna de las asignatras o grupos asignados durante la proxima semana.",
          creatorName: "Creator",
          lastUpdate: DateTime(2024,1,3),
          teacherUserId: 1
      ),
      ReportModel(
          id: 2,
          title: "Noticias y Agenda UGR",
          description:
              "Buenas, os remito esta edición de noticias y agenda UGR la cual incluye una convocatoria de becas que os puede resultar interesante.\nBuenas tardes: \nPublicado el Boletín ""Noticias y Agenda UGR correspondiente al 19 de diciembre de 2023"".\n Contiene la actualización diaria de noticias, agenda, convocatorias, exposiciones y otras cuestiones de interés relacionadas con la Universidad de Granada. \n"
                  "Puede consultarlo en: http://sl.ugr.es/REVBOL1912202. \nUn saludo.",
          creatorName: "Creator",
          lastUpdate: DateTime(2023,12,19),
          teacherUserId: 1
      ),
    ];
  }


}
