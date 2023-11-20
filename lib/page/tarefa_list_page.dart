import 'dart:io';
import 'package:get/get.dart';
import 'package:tarefa_reativa_flutter/main.dart';
import 'package:tarefa_reativa_flutter/model/tarefa_model.dart';
import 'package:tarefa_reativa_flutter/page/tarefa_edit_page.dart';
import 'package:tarefa_reativa_flutter/service/tarefa_sevice.dart';

import 'package:flutter/material.dart';
import 'package:tarefa_reativa_flutter/shared/widgets/custon_list_itens.dart';

class TarefaListPage extends StatefulWidget {
  @override
  State createState() => _TarefaListPageState();
}

class _TarefaListPageState extends State<TarefaListPage> {
  var tarefaService = getIt<TarefaService>();

  @override
  void initState() {
    super.initState();
    obterTarefas();
  }

  void obterTarefas() async {
    tarefaService.setCarregando(true);
    await tarefaService.obterTodosTarefa();
    tarefaService.setCarregando(false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          automaticallyImplyLeading: false,
          actions: [
            Obx(() {
              return Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Switch(
                  inactiveTrackColor:Colors.white,
                  activeTrackColor: Colors.white,
                  thumbColor: const MaterialStatePropertyAll<Color>(Colors.blue),
                  onChanged: (bool value) async {
                    tarefaService.setApenasNaoconcluidos(value);
                  },
                  value: tarefaService.apenasNaoConcluidos,
                ),
              );
            }),
          ],
          title: const Text('Tarefas', style: TextStyle(color: Colors.white)),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.blue,
          shape: CircleBorder(),
          onPressed: () async {
            await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => TarefaEditPage(
                  tarefaModel: novaTarefa(),
                  titulo: "Nova Tarefa",
                  novo: true,
                ),
              ),
            );
          },
          tooltip: 'Create',
          child: const Icon(Icons.add),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
        bottomNavigationBar: BottomAppBar(
          height: 60,
          shape: const CircularNotchedRectangle(),
          color: Colors.blue,
          child: IconTheme(
            data: IconThemeData(color: Theme.of(context).colorScheme.onPrimary),
            child: Container(height: 45),
          ),
        ),
        body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: custonListItens(),
        ));
  }

  TarefaModel novaTarefa() {
    return TarefaModel(concluido: false, titulo: "", descricao: "");
  }
}
