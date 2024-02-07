class RegisterDto{
  final String name;
  final String surname;
  final String username;
  final String password;
  final String fechaNacimientoString;
  final String phone;


  RegisterDto({required this.name, required this.surname, required this.username,
    required this.password, required this.fechaNacimientoString, required this.phone});

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "surname": surname,
      "user_name": username,
      "birth_date": fechaNacimientoString,
      "password": password,
      "phone_number": phone
    };
  }
}