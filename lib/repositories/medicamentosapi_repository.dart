import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:pressaoarterialapp/models/medicamento_model.dart';

class MedicamentoApiRepository {
  final Dio _dio = Dio();
  String url = "https://apothegmatical-driv.000webhostapp.com/";

  Future<String> setMedicamento(Medicamento remedio) async {
    FormData dados_remedio = new FormData.fromMap(remedio.toMap());
    Response response = await _dio.post('$url/set.php',data:dados_remedio);
    if (response.statusCode != 200) {
      print(response.data);
      throw Exception();
    } else {
      print(response.data);
    }
  }


  Future<List<Medicamento>> getAllMedicamentos() async {
    Response response = await _dio.get('$url/getAllMedicamentos.php/2');
    if (response.statusCode != 200) {
      print(response.data);
      throw Exception();
    } else {
     return Medicamento.fromJson(response.data);
    }
  }
}


