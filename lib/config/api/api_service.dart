import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String alias;
  final String apiKey;
  final String environment;
  final String baseUrl;

  ApiService({
    required this.alias,
    required this.apiKey,
    required this.environment,
    required this.baseUrl,
  });

  Future<Map<String, dynamic>> getWalletInfo(String walletId) async {
    final response = await http.get(
      Uri.parse('$baseUrl/wallet/$walletId'),
      headers: {
        'Content-Type': 'application/json',
        'x-api-key': apiKey,
      },
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load wallet info');
    }
  }

  Future<Map<String, dynamic>> createPaymentRequest(Map<String, dynamic> data) async {
    final response = await http.post(
      Uri.parse('$baseUrl/payment/request'),
      headers: {
        'Content-Type': 'application/json',
        'x-api-key': apiKey,
      },
      body: json.encode(data),
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to create payment request');
    }
  }
}
