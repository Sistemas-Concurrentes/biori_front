class AddEventGroupDto {
  String? titulo;
  String? descripcion;
  String? categoria;
  String? localizacion;
  List<String> fechas = [];
  List<int> groupsId = [];
  String? fechaFinInscripcion;

  AddEventGroupDto({
    required this.titulo,
    required this.descripcion,
    required this.categoria,
    required this.localizacion,
    required this.fechas,
    required this.groupsId,
    required this.fechaFinInscripcion,
  });

  Map<String, dynamic> toJson() => {
        'titulo': titulo,
        'descripcion': descripcion,
        'categoria': categoria,
        'localizacion': localizacion,
        'fechas': fechas,
        'groupsId': groupsId,
        'fechaFinInscripcion': fechaFinInscripcion,
      };
}
