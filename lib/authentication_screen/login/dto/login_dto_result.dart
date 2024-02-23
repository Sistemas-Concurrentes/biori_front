class LoginDtoResult{
  final String token;
  final int id;
  final String user_name;
  final int  register_code;

  LoginDtoResult({
    required this.token,
    required this.id,
    required this.user_name,
    required this.register_code,
  });

  factory LoginDtoResult.fromJson(Map<String, dynamic> json) {
    return switch (json){
      {
        'token': String token,
        'id': int id,
        'user_name': String email,
        'register_code': int registerCode,
      } => LoginDtoResult(
        token: token,
        id: id,
        user_name: email,
        register_code: registerCode,
      ),
      _ => throw const FormatException('Failed to load loginDtoResult'),
    };
  }
}

