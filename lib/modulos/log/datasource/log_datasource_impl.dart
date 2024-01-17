import 'package:dio/dio.dart';

import '../../../config/constants/environment.dart';
import 'log_datasource.dart';

class LogDataSourceImpl implements LogDataSource {
  static final LogDataSourceImpl _instance = LogDataSourceImpl._internal();
  LogDataSourceImpl._internal();

  static LogDataSourceImpl getInstance() {
    return _instance;
  }
  final dio = Dio(BaseOptions(baseUrl: Environment.apiUrl));





}