import 'package:biori/style/model/chip_button_model.dart';

class AddEventDto {
  String titulo;
  String descripcion;
  String categoria;
  String localizacion;
  List<String> fechas;
  List<ChipButtonModel> tagsButtons;
  String? fechaFinInscripcion;

  AddEventDto({
    this.titulo = "",
    this.descripcion = "",
    this.categoria = "",
    this.localizacion = "",
    required this.fechas,
    this.tagsButtons = const [],
    this.fechaFinInscripcion,
  });

  Map<String, dynamic> toJson() => {
        'titulo': titulo,
        'descripcion': descripcion,
        'categoria': categoria,
        'localizacion': localizacion,
        'fechas': fechas,
        'associatedIds': tagsButtons.map((e) => e.id).toList(),
        'fechaFinInscripcion': fechaFinInscripcion,
      };
}
