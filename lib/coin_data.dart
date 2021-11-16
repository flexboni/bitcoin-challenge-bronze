import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

const coinAPIURL = 'https://rest.coinapi.io/v1/exchangerate';
var apiKey = dotenv.env['COIN_API_KEY'];

class CoinData {
  Future<dynamic> getCoinData(String selectedCurrency) async {
    try {
      Uri uri = Uri.parse('$coinAPIURL/BTC/$selectedCurrency?apikey=$apiKey');
      http.Response response = await http.get(uri);
      if (response.statusCode == 200) {
        Map<String, dynamic> decodedData =
            jsonDecode(response.body) as Map<String, dynamic>;

        double lastPrice = decodedData['rate'];
        return lastPrice;
      } else {
        throw 'Problem with the get request';
      }
    } catch (e) {
      throw 'Problem with the get request : $e';
    }
  }
}
