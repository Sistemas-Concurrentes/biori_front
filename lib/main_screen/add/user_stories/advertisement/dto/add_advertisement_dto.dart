import 'package:biori/style/model/chip_button_model.dart';

class AddAdvertisementDto {
  String? titulo;
  String? descripcion;
  List<ChipButtonModel> groupsButtons;

  AddAdvertisementDto({
    this.titulo = "",
    this.descripcion = "",
    required this.groupsButtons,
  });

  Map<String, dynamic> toJson() => {
        'titulo': titulo,
        'descripcion': descripcion,
        'groups': groupsButtons.map((e) => e.toJson()).toList(),
      };
}
