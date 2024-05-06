import 'package:biori/style/model/chip_button_model.dart';

class AddReportDto {
  String? titulo;
  String? descripcion;

  AddReportDto({
    required this.titulo,
    required this.descripcion,
  });

  Map<String, dynamic> toJson() => {
        'titulo': titulo,
        'descripcion': descripcion,
      };
}
