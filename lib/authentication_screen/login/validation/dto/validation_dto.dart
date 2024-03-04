class ValidationDto {
  String register_code;
  String token;

  ValidationDto({
    required this.register_code,
    required this.token,
  });

  ValidationDto.fromJson(Map<String, dynamic> json)
      : register_code = json['register_code'],
        token = json['token'];
  Map<String, dynamic> toJson() => {
        'register_code': register_code,
        'token': token,
      };
}
