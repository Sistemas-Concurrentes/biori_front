class RegisterDto{
  final String name;
  final String surname;
  final String username;
  final String password;
  final String fechaNacimiento;
  final String phone;


  RegisterDto({required this.name, required this.surname, required this.username,
    required this.password, required this.fechaNacimiento, required this.phone});

  Map<String, dynamic> toJson() {
    return {
      "nombre": name,
      "apellidos": surname,
      "user_name": username,
      "password": password,
      "fecha_nacimiento": fechaNacimiento,
      "telefono": phone
    };
  }
}