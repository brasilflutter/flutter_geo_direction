import 'package:http/http.dart' as http;

class HttpHelper {
  static Future<http.Response> get({
    required String url,
    required String endpoint,
    required Map<String, dynamic> params,
  }) async {
    try {
      final uri = Uri.https(url, endpoint, params);
      return await http.get(uri);
    } catch (e) {
      throw Exception(e);
    }
  }
}
