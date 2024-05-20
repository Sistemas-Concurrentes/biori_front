import 'package:flutter_dotenv/flutter_dotenv.dart';

class Constants {
  final URI = dotenv.env['BACKEND_URL'];

  // 192.168.30.26 -> domo
  // 192.168.1.135 -> casa
  final String TOKEN = 'token';
}
