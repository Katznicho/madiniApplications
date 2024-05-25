import 'package:dio/dio.dart';
import 'package:madini/services/token_service.dart';

class ApiService {
  static const String baseUrl = 'https://admin.madinigroup.com/api/v1';

  final Dio _dio = Dio();

  ApiService() {
    _dio.options.baseUrl = baseUrl;

    // Add interceptor to attach token to requests
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) async {
        final token = await TokenService.getToken();
        if (token != null) {
          options.headers['Authorization'] = 'Bearer $token';
        }
        return handler.next(options);
      },
    ));
  }

  Future<Map<String, dynamic>> getProducts({int page = 1, int category_id = 1}) async {
    try {
      final response = await _dio.get('/products?page=$page&category_id=$category_id');
      final responseData = response.data;

      // Log response data
      print('Response data: $responseData');

      // Parse pagination information
      // final pagination = responseData['pagination'];
      // if (pagination == null) {
      //   throw Exception('Pagination data not found');
      // }

      // final currentPage = pagination['current_page'];
      // final perPage = pagination['per_page'];
      // final total = pagination['total'];
      final products = responseData['data'];
      
      if (products == null) {
        throw Exception('Products data not found');
      }

      return {
        // 'currentPage': currentPage,
        // 'perPage': perPage,
        // 'total': total,
        'products': products,
      };
    } on DioException catch (e) {
      // Handle DioError (network error, etc.)
      print('Dio error: $e');
      throw e;
    } catch (e) {
      // Handle other errors
      print('Error: $e');
      throw e;
    }
  }

  Future<Map<String, dynamic>> processOrder({required double amount, required int quantity}) async {
    try {
      final response = await _dio.post('/orders', data: {'amount': amount, 'quantity': quantity});
      final responseData = response.data;

      // Log response data
      print('Response data: $responseData');

      if (responseData == null) {
        throw Exception('Order response data not found');
      }

      return responseData;
    } on DioException catch (e) {
      // Handle DioError (network error, etc.)
      print('Dio error: $e');
      throw e;
    } catch (e) {
      // Handle other errors
      print('Error: $e');
      throw e;
    }
  }
}
