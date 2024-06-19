class AddEventGroupDto {
  String titulo;
  String descripcion;
  String categoria;
  String localizacion;
  List<String> fechas;
  List<int> groupsId;
  String? fechaFinInscripcion;

  AddEventGroupDto({
    this.titulo = "",
    this.descripcion = "",
    this.categoria = "",
    this.localizacion = "",
    required this.fechas,
    this.groupsId = const [],
    this.fechaFinInscripcion,
  });

  Map<String, dynamic> toJson() => {
        'titulo': titulo,
        'descripcion': descripcion,
        'categoria': categoria,
        'localizacion': localizacion,
        'fechas': fechas,
        'associatedIds': groupsId,
        'fechaFinInscripcion': fechaFinInscripcion,
      };
}
