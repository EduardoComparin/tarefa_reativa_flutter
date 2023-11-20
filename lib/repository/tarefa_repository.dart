import 'package:tarefa_reativa_flutter/model/tarefa_model.dart';
import 'package:tarefa_reativa_flutter/system/http_service.dart';


class TarefaRepositoy {
 static final _dio = httpService().getDio();

  static Future<Map<String, dynamic>> get(String url) async {

    var result = await _dio.get(url);

    Map<String, dynamic> retorno = result.data;

    return retorno;
  }

  static Future<Map<String, dynamic>> create(TarefaModel tarefaModel) async {
    
    var result = await _dio.post("tarefa", data: tarefaModel.toJson());
    
    return result.data;
  }

  static Future<void> update(TarefaModel tarefaModel) async {
    try {
      await _dio.put(
          "tarefa/${tarefaModel.id}",
          data: tarefaModel.toJson());
    } catch (e) {
      throw e;
    }
  }

  static Future<void> remove(String id) async {
    try {
       await _dio.delete(
        "tarefa/$id",
      );
    } catch (e) {
      throw e;
    }
  }
}
