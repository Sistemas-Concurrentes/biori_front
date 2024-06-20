class AddReportDto {
  String? titulo;
  String? descripcion;
  int scholarYear;
  List<int> courses;
  bool toTeachers;

  AddReportDto({
    required this.titulo,
    required this.descripcion,
    required this.scholarYear,
    required this.courses,
    required this.toTeachers,
  });

  Map<String, dynamic> toJson() => {
        'titulo': titulo,
        'descripcion': descripcion,
        'scholarYear': scholarYear,
        'courses': courses,
        'toTeachers': toTeachers,
      };
}
