import 'package:library_app/src/core/service/dio_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppRepository {
  late SharedPreferences prefs;
  late DioService service;

  AppRepository({required this.service}) {
    _initSharedPreferences();
    service;
  }

  void _initSharedPreferences() async {
    prefs = await SharedPreferences.getInstance();
  }
}
