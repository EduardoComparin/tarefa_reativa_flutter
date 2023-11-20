import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tarefa_reativa_flutter/main.dart';
import 'package:tarefa_reativa_flutter/page/tarefa_edit_page.dart';
import 'package:tarefa_reativa_flutter/service/tarefa_sevice.dart';

// ignore: must_be_immutable
class custonListItens extends StatelessWidget {

  var tarefaService = getIt<TarefaService>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
            return tarefaService.carregando
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [Center(child: CircularProgressIndicator())],
                  )
                : Column(
                    children: [
                      Expanded(
                          child: ListView.builder(
                              itemCount: tarefaService.tarefas.length,
                              itemBuilder: (BuildContext bc, int index) {
                                var tarefa = tarefaService.tarefas[index];
                                return Column(
                                  children: [
                                    Dismissible(
                                      key: UniqueKey(),
                                      direction: DismissDirection.endToStart,
                                      onDismissed: (DismissDirection
                                          dismissDirection) async {
                                        await tarefaService
                                            .remover(tarefa.id.toString());
                                      },
                                      background: Container(
                                        color: Colors.red,
                                        child: Padding(
                                          padding: const EdgeInsets.all(15),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: const [
                                              Icon(Icons.delete_forever,
                                                  color: Colors.white),
                                              SizedBox(width: 8.0),
                                              Text(
                                                'Remover',
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      child: ListTile(
                                        title: Text(tarefa.titulo.toString()),
                                        subtitle:
                                            Text(tarefa.descricao.toString()),
                                        trailing: Switch(
                                          onChanged: (bool value) async {
                                            tarefa.concluido = value;
                                            tarefaService.atualizar(tarefa);
                                          },
                                          value: tarefa.concluido!,
                                        ),
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  TarefaEditPage(
                                                tarefaModel: tarefa,
                                                titulo: "Editando Tarefa",
                                                novo: false,
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                    Divider(height: 0),
                                  ],
                                );
                              })),
                    ],
                  );
          });
  }
}