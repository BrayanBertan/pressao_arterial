import 'package:dio/dio.dart';
import 'package:pressaoarterialapp/models/medicamento_model.dart';

class MedicamentoApiRepository {
  final Dio _dio = Dio();
  String url = "https://apothegmatical-driv.000webhostapp.com/";

  Future<String> setMedicamento() async {
    Response response = await _dio.post('$url/set',data:{'nome':'aa'});
    if (response.statusCode != 200) {
      print(response.data);
      throw Exception();
    } else {
      print(response.data);
    }
  }
}