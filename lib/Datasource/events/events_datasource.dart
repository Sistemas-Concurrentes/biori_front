import 'package:biori/main_screen/home/user_stories/releases/releases_widgets/button_widgets/model/categories_button_model.dart';

import '../../main_screen/home/user_stories/events/model/event_model.dart';

class EventsDatasource {
  List<EventModel> getEventsOrderedByLastUpdate() {
    return [
      EventModel(
        id: 1,
        title: "Asamblea estudiantil Frente de estudiantes",
        categories: [concienciacion, frentedeestudiantes, estudiantado],
        organizer: "-",
        description:
            "Con motivo de los últimos cambios en la cafetería y sus efectos sobre el estudiantado, desde el Frente de estudiantes se convoca esta asamblea donde se debatirá sobre el rumbo a tomar para afrontar esta problemática.",
        date: DateTime(2024, 2, 1, 10, 30),
        lastUpdate: DateTime(2024, 1, 12),
        location: "Aula seminario ciencias políticas",
      ),
      EventModel(
        id: 2,
        title:
            "Prácticas itinerantes de alta montaña: las ciencias naturales «in situ» (IV ed.)",
        categories: [montana, praticasCampo],
        organizer: "-",
        description:
            "Este curso está especialmente diseñado para acercarnos al apasionante mundo de la alta montaña. Sierra Nevada, por sus condiciones biogeográficas, es refugio de multitud de endemismos vegetales y animales por lo que resulta un espacio inmejorable para llevar a cabo un curso multidisciplinar como el que se propone",
        date: DateTime(2024, 7, 12, 9),
        lastUpdate: DateTime(2024, 1, 3),
        endInscription: DateTime(2024, 5, 10),
        location: "Pampaneira, Alpujarra Granadina",
      ),
      EventModel(
        id: 3,
        title:
            "II Edición del Ciclo de Talleres sobre Autocuidado y Salud Mental_Año 2024",
        categories: [igualdad, talleres, saludMental],
        organizer: "Organizador 2",
        description:
            "El objetivo de estos talleres es crear espacios en la universidad para poder dialogar sobre temas relacionados con el autocuidado y proporcionar herramientas prácticas para poderse cuidar mejor, abordando temas verdaderamente relevantes para el bienestar humano dentro y fuera de la universidad",
        date: DateTime(2024, 1, 23, 17),
        lastUpdate: DateTime(2024, 1, 2),
        location: "Sala de Prensa. Hospital Real. ",
        endInscription: DateTime(2024, 1, 10),
      ),
      EventModel(
        id: 5,
        title: "Sexualidad: Múltiples formas de sentirla y vivirla. IV Edición",
        categories: [igualdad, cursos, sexualidad],
        organizer: "Organizador 3",
        description:
        "Curso sobre la sexualidad impartido por la unidad de igualdad \nDATOS BÁSICOS \n- Fechas: 11, 12, 13, 18,19 Y 20 de diciembre de 2023.\n- Horario: de 17:00 a 20:00 h.\n- Lugar de celebración: Aula 25. Facultad de Trabajo Social.\n- Carga lectiva: 25 horas (18 presenciales 7 horas on line)\n- Personas destinatarias y número de plazas: 35 plazas dirigidas al estudiantado de la Universidad de Granada, con matrícula en el actual curso 2023/2024.\n- Créditos reconocidos: 1 ECTS\n- Certificados: La Unidad de Igualdad y Conciliación entregará un certificado de asistencia a quienes asistan como mínimo al 80% de las sesiones presenciales y realicen las actividades propuestas de la parte virtual.\n***ENLACE PARA MÁS INFORMACION A WEB UNIDAD IGUALDAD (APARTADO NOTICIAS) (aquí: inscripción, objetivos, contacto, toda la información de la programación)",
        date: DateTime(2024, 7, 16),
        lastUpdate: DateTime(2024, 1, 1),
        location: "Facultad de Ciencias",
        endInscription: DateTime(2023, 12, 31),
      ),
      EventModel(
        id: 4,
        title: "III CEEBI",
        categories: [conferencias, seminario],
        organizer: "Organizador 3",
        description:
            "III Congreso Estatal de Estudiantes de Biociencias (CEEBI), 16 al 19 de julio de 2024 en la Facultad de Ciencias de la Universidad de Granada. Toda la información del congreso así como las novedades podrán encontrarla en nuestra página web (biociencias.es) así como en nuestras redes sociales (@BiocienciasGRX). ",
        date: DateTime(2024, 7, 16),
        lastUpdate: DateTime(2023, 12, 15),
        location: "Facultad de Ciencias",
        endInscription: DateTime(2023, 12, 31),
      ),
    ];
  }

  List<int> getCategoriesFollowedByUser() {
    return [1, 4];
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

CategoriesButtonsModel concienciacion = CategoriesButtonsModel(
  id: 6,
  name: "Concienciación",
  isFollowed: false,
);

CategoriesButtonsModel frentedeestudiantes = CategoriesButtonsModel(
  id: 7,
  name: "Frente de estudiantes",
  isFollowed: false,
);

CategoriesButtonsModel estudiantado = CategoriesButtonsModel(
  id: 8,
  name: "Estudiantado",
  isFollowed: false,
);

CategoriesButtonsModel praticasCampo = CategoriesButtonsModel(
  id: 9,
  name: "Partidas de campo",
  isFollowed: false,
);

CategoriesButtonsModel montana = CategoriesButtonsModel(
  id: 10,
  name: "Montaña",
  isFollowed: false,
);

CategoriesButtonsModel igualdad = CategoriesButtonsModel(
  id: 11,
  name: "Igualdad",
  isFollowed: false,
);

CategoriesButtonsModel saludMental = CategoriesButtonsModel(
  id: 12,
  name: "Salud mental",
  isFollowed: false,
);

CategoriesButtonsModel talleres = CategoriesButtonsModel(
  id: 13,
  name: "Talleres",
  isFollowed: false,
);

CategoriesButtonsModel conferencias = CategoriesButtonsModel(
  id: 14,
  name: "Conferencias",
  isFollowed: false,
);

CategoriesButtonsModel seminario = CategoriesButtonsModel(
  id: 15,
  name: "Voluntariado",
  isFollowed: false,
);

CategoriesButtonsModel cursos = CategoriesButtonsModel(
  id: 16,
  name: "Cursos",
  isFollowed: false,
);

CategoriesButtonsModel sexualidad = CategoriesButtonsModel(
  id: 17,
  name: "Sexualidad",
  isFollowed: false,
);
