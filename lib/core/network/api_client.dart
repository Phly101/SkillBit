abstract class ApiClient {
  Future<dynamic> get({
    required final String endpoint,
    final Object? data,
    final Map<String, dynamic>? queryParams,
    final Map<String, dynamic>? extra,
  });

  Future<dynamic> post({
    required final String endpoint,
    final Object? data,
    final Map<String, dynamic>? queryParams,
    final Map<String, dynamic>? extra,
  });

  Future<dynamic> patch({
    required final String endpoint,
    final Object? data,
    final Map<String, dynamic>? queryParams,
    final Map<String, dynamic>? extra,
  });

  Future<dynamic> delete({
    required final String endpoint,
    final Object? data,
    final Map<String, dynamic>? queryParams,
    final Map<String, dynamic>? extra,
  });
}
