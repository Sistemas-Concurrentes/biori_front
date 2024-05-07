import 'package:biori/style/model/chip_button_model.dart';

class AddEventDto {
  String? titulo;
  String? descripcion;
  String? categoria;
  String? localizacion;
  List<String> fechas = [];
  List<ChipButtonModel> tagsButtons = [];
  String? fechaFinInscripcion;

  AddEventDto({
    required this.titulo,
    required this.descripcion,
    required this.categoria,
    required this.localizacion,
    required this.fechas,
    required this.tagsButtons,
    required this.fechaFinInscripcion,
  });

  Map<String, dynamic> toJson() => {
        'titulo': titulo,
        'descripcion': descripcion,
        'categoria': categoria,
        'localizacion': localizacion,
        'fechas': fechas,
        'tagsButtons': tagsButtons.map((e) => e.toJson()).toList(),
        'fechaFinInscripcion': fechaFinInscripcion,
      };
}
