import 'package:biori/style/model/chip_button_model.dart';

class AddAdvertisementDto {
  String? titulo;
  String? descripcion;
  List<ChipButtonModel> tagsButtons = [];

  AddAdvertisementDto({
    required this.titulo,
    required this.descripcion,
    required this.tagsButtons,
  });

  Map<String, dynamic> toJson() => {
        'titulo': titulo,
        'descripcion': descripcion,
        'groups': tagsButtons.map((e) => e.toJson()).toList(),
      };
}
