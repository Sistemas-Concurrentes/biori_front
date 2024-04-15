class ValidationDtoResult{
  final String token;

  ValidationDtoResult({
    required this.token,
  });

  factory ValidationDtoResult.fromJson(Map<String, dynamic> json) {
    return switch (json){
      {
        'token': String token,
      } => ValidationDtoResult(
        token: token,
      ),
      _ => throw const FormatException('Failed to load loginDtoResult'),
    };
  }
}

