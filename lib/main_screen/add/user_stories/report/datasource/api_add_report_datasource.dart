import 'dart:convert';
import 'package:biori/conection_to_backend/requests.dart';
import 'package:biori/style/constants.dart';
import 'package:biori/style/model/chip_button_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'add_reports_datasource.dart';

class ApiAddReportDatasource implements AddReportDatasource {
  final ApiService apiService = ApiService();
  final getAllUri = '${Constants().URI}releases/report/getAllCourses';

  @override
  Future<List<ChipButtonModel>> getCourses() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString(Constants().TOKEN);

    final object = await apiService.getRequestWithHeader(getAllUri, token);
    final body = jsonDecode(object.body) as Map<String, dynamic>;

    return body['courses']
        .map<ChipButtonModel>((release) => ChipButtonModel.fromJson(release))
        .toList();
  }
}
