import 'package:capsule_events_erp_mobile/utils/my_shared.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

BaseOptions myBaseOption = new BaseOptions(
  // 请求 host
  baseUrl: "http://localhost:3000"
);

Dio myDio() {
  Dio dio = new Dio(myBaseOption);

  // 增加请求拦截
  // 除登录外的每一个请求，自动加上 token
  dio.interceptors.add(new InterceptorsWrapper(
    onRequest: (RequestOptions options) async {
      if (options.path != '/login') {
        SharedPreferences instance = await getMyShared();
        var token = instance.getString("token");
        options.headers["token"] = token;
      }
      options.headers["device"] = "mobile";
      return options;
    },
    onResponse: (Response response) {
      return response;
    },
    onError: (DioError error) {
      print("error");
      print(error.message);
      return error;
    }
  ));
  return dio;
}
