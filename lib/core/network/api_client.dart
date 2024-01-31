import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'api_path.dart';

class ApiClient {
  final Dio _dio;

  ApiClient({Dio? dio}) : _dio = dio ?? _createDioWithCacheInterceptor();

  static Dio _createDioWithCacheInterceptor() {
    final dio = Dio();

    dio.interceptors.add(
      DioCacheInterceptor(
        options: CacheOptions(
          store: MemCacheStore(),
          policy: CachePolicy.request,
          hitCacheOnErrorExcept: [404],
        ),
      ),
    );

    return dio;
  }

  Future<Map<String, dynamic>> getRequest(String url) async {
    try {
      final response = await _dio.get(ApiPath.baseUrl + url);
      return response.data;
    } catch (e) {
      throw Exception('Failed to load');
    }
  }

}
