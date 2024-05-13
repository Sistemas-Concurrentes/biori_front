import 'dart:convert';
import 'package:biori/conection_to_backend/requests.dart';
import 'package:biori/style/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'releases_datasource.dart';

class ApiReleasesDatasource implements ReleasesDatasource {
  final ApiService apiService = ApiService();
  final getAllUri = '${Constants().URI}/releases/getAll';

  @override
  Future<Map<String, dynamic>> getReleases() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString(Constants().TOKEN);

    final object = await apiService.getRequestWithHeader(getAllUri, token);
    return jsonDecode(object.body) as Map<String, dynamic>;
  }
}
