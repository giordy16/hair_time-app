import 'package:dio/dio.dart';

class LogginInterceptor extends Interceptor {

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    print("--------- DIO REQUEST ---------");
    print("PATH: ${options.uri}");
    print("BODY: ${options.data}");
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    print("--------- DIO RESPNSE ---------");
    print("RESPONSE ${response.data}");
    super.onResponse(response, handler);
  }

}