import 'package:tarefa_reativa_flutter/model/tarefa_model.dart';
import 'package:tarefa_reativa_flutter/repository/tarefa_repository.dart';
import 'package:get/get.dart';

class TarefaService extends GetxController {
  
  RxList<TarefaModel> _tarefas = <TarefaModel>[].obs;
  var _apenasNaoConcluidos = true.obs;
  var _carregando = false.obs;
  var _concluido = false.obs;

  bool get apenasNaoConcluidos => _apenasNaoConcluidos.value;

  void setApenasNaoconcluidos(bool value) async {
    _apenasNaoConcluidos.value = value;
    await this.obterTodosTarefa();
  }

  bool get carregando => _carregando.value;
  void setCarregando(bool value) {
    _carregando.value = value;
  }

  bool get concluido => _concluido.value;
  void setConcluido(bool value) {
    _concluido.value = value;
  }

  List<TarefaModel> get tarefas => _tarefas.toList();

  Future<void> obterTodosTarefa() async {
   
    var url = "tarefa";
    if (_apenasNaoConcluidos.value) {
      url = "tarefa?where={\"concluido\":false}";
    }

    try {
      Map<String, dynamic> retorno = await TarefaRepositoy.get(url);
      _tarefas.clear();
       _tarefas = <TarefaModel>[].obs;
      if (retorno['results'] != null) {
        retorno['results'].forEach((v) {
          _tarefas.add(TarefaModel.fromJson(v));
         
        });
      }
      _tarefas.refresh();

    } catch (e) {
      throw e;
    }
  }

  Future<TarefaModel> obterTarefa(String id) async {
    var url = "tarefa?where={\"objectId\":\"$id\"}";

    try {
      Map<String, dynamic> retorno = await TarefaRepositoy.get(url);

      List<TarefaModel> conversao = TarefaModel().mapFromJson(retorno);

      if (conversao.length > 0) {
        return conversao[0];
      }

      return TarefaModel();
    } catch (e) {
      throw e;
    }
  }

  Future<bool> criar(TarefaModel tarefaModel) async {
    var retorno = await TarefaRepositoy.create(tarefaModel);

    if (retorno['objectId'] != "") {
      tarefaModel.id = retorno['objectId'];
      _tarefas.add(tarefaModel);
      _tarefas.refresh();
      
      return true;
    } else {
      return false;
    }
  }

  Future<void> atualizar(TarefaModel tarefaModel) async {
    try {
      await TarefaRepositoy.update(tarefaModel);
      _tarefas.refresh();
    } catch (e) {
      throw e;
    }
  }

  Future<void> remover(String id) async {
    try {
      _tarefas.removeWhere((element) => element.id == id);
      await TarefaRepositoy.remove(id);
    } catch (e) {
      throw e;
    }
  }
}
