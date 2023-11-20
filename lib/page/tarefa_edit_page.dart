import 'package:get/get.dart';
import 'package:tarefa_reativa_flutter/main.dart';
import 'package:tarefa_reativa_flutter/model/tarefa_model.dart';
import 'package:tarefa_reativa_flutter/service/tarefa_sevice.dart';
import 'package:flutter/material.dart';
import 'package:tarefa_reativa_flutter/shared/widgets/custon_text_field.dart';

class TarefaEditPage extends StatelessWidget {
  final TarefaModel tarefaModel;
  final String titulo;
  final bool novo;

  TarefaEditPage(
      {Key? key,
      required this.tarefaModel,
      required this.titulo,
      required this.novo})
      : super(key: key);

  var _tarefaService = getIt<TarefaService>();

  late TextEditingController _ctrlTitulo;
  late TextEditingController _ctrlDescricao;

  @override
  Widget build(BuildContext context) {

    _tarefaService.setConcluido(tarefaModel.concluido!);
    _ctrlTitulo = TextEditingController(text: tarefaModel.titulo.toString());
    _ctrlDescricao =
        TextEditingController(text: tarefaModel.descricao.toString());

    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
         iconTheme: IconThemeData(
    color: Colors.white, //change your color here
  ),
        automaticallyImplyLeading: true,
        title: Text(titulo,style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        child: ListView(
          padding: EdgeInsets.only(top: 10),
          children: [
            Center(
              child: Stack(
                alignment: Alignment.bottomRight,
                children: <Widget>[],
              ),
            ),
            custonInputText(
                label: "Titulo", controller: _ctrlTitulo, leitura: false),
            custonInputText(
                label: "Descrição", controller: _ctrlDescricao, leitura: false),
            Padding(
              padding: const EdgeInsets.only(left: 18, right: 10, top: 8),
              child: SizedBox(
                height: 45,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Concluído",
                      style: TextStyle(fontSize: 18),
                    ),
                    Obx(() => Switch(
                          onChanged: (bool value) async {
                            _tarefaService.setConcluido(value);
                          },
                          value: _tarefaService.concluido,
                        )),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10, right: 10, left: 10),
              child: Padding(
                padding: EdgeInsets.only(right: 50, left: 50),
                child: ElevatedButton(
                  onPressed: () async {
                    await saveOrEdit();
                    Navigator.pop(context);
                  },
                  child: novo ? Text('Salvar') : Text('Atualizar'),
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }

  Future<void> saveOrEdit() async {
    tarefaModel.titulo = _ctrlTitulo.text.trim();
    tarefaModel.descricao = _ctrlDescricao.text.trim();
    tarefaModel.concluido = _tarefaService.concluido;

    if (novo) {
      await _tarefaService.criar(tarefaModel);
    } else {
      await _tarefaService.atualizar(tarefaModel);
    }
  }
}
