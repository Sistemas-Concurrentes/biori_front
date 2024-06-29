import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum UserType { student, teacher }

enum UserRol { none, admin, delegated }

class UserModel {
  final String email;
  final int id;
  final String nombre;
  final UserType tipo;
  final UserRol? rol;

  UserModel(
      {required this.email,
      required this.id,
      required this.nombre,
      required this.tipo,
      required this.rol});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      email: json['username'],
      id: json['id'],
      nombre: json['name'],
      tipo:
          json['user_type'] == "teacher" ? UserType.student : UserType.teacher,
      rol: getRolFromString(json['rol']),
    );
  }
}

UserRol? getRolFromString(String rol) {
  if (rol == "administrador") {
    return UserRol.admin;
  } else if (rol == "delegado") {
    return UserRol.delegated;
  } else {
    return UserRol.none;
  }
}

class UserDataRepository {
  final datasource = CacheDatasource();

  static final UserDataRepository _instance = UserDataRepository._internal();

  factory UserDataRepository() {
    return _instance;
  }

  UserDataRepository._internal();

  Future<UserModel> getUserData() async {
    return await datasource.getUser();
  }
}

class CacheDatasource {
  Future<UserModel> getUser() async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final jwt = prefs.getString('token') ?? '';
      final jwtDecoded = JwtDecoder.decode(jwt);
      return UserModel.fromJson(jwtDecoded);
    } catch (e) {
      return UserModel(
          email: '', id: 0, nombre: '', tipo: UserType.student, rol: null);
    }
  }
}
