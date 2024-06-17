import 'package:library_app/src/core/service/dio_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BaseRepository {
  late SharedPreferences prefs;
  final DioService service = DioService();

  BaseRepository() {
    _initSharedPreferences();
  }

  void _initSharedPreferences() async {
    prefs = await SharedPreferences.getInstance();
    service.dio.options.baseUrl = prefs.getString('base_url') ?? '';
  }
}
