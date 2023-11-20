import 'package:tarefa_reativa_flutter/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:tarefa_reativa_flutter/service/tarefa_sevice.dart';

final getIt = GetIt.instance;

setupGetIt() {
  getIt.registerSingleton<TarefaService>(TarefaService());
}

void main() async{
  await dotenv.load(fileName: "assets/.env");
  setupGetIt();
  runApp(const App());
}


