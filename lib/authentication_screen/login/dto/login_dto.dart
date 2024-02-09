class LoginDto {
  String username;
  String password;

  LoginDto({
    required this.username,
    required this.password,
  });

  LoginDto.fromJson(Map<String, dynamic> json)
      : username = json['username'],
        password = json['password'];

  Map<String, dynamic> toJson() => {
        'user_name': username,
        'password': password,
      };
}
