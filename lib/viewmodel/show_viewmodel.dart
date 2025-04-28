import 'dart:convert';
import 'package:crud_api/model/show_model.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class ShowViewmodel extends ChangeNotifier {
  List<ShowModel>? _show;
  bool _isLoading = false;
  String? _errorMessage;

  List<ShowModel>? get show => _show;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  Future<void> fetchShow() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      const url = 'https://api.fajarms.fun/show_data.php';
      final response = await http.get(
        Uri.parse(url),
      );
      print(url);
      print(response.body);

      if (response.statusCode == 200) {
        final List<dynamic> jsonData = json.decode(response.body);
        _show = ShowModel.fromJsonList(jsonData);

        // if (jsonData is List && jsonData.isNotEmpty) {
        //   _show = ShowModel.fromJson(jsonData.first);
        // }
      } else {
        _errorMessage =
            'Failed to load schedule. status code: ${response.statusCode}';
      }
    } catch (e) {
      _errorMessage = 'An Error occurred: $e';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}