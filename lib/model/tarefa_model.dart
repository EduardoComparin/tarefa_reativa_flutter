class TarefaModel {

  String? id = "";
  String? titulo = "";
  String? descricao = "";
  bool? concluido = false;

  TarefaModel(
      {
      this.id,
      this.titulo,
      this.descricao,
      this.concluido}
      );

  TarefaModel.fromJson(Map<String, dynamic> json) {
    id = json['objectId'];
    titulo = json['titulo'];
    descricao = json['descricao'];
    concluido = json['concluido'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['objectId'] = id;
    data['titulo'] = titulo;
    data['descricao'] = descricao;
    data['concluido'] = concluido;

    return data;
  }

  mapFromJson(Map<String, dynamic> json) {
    
    List<TarefaModel> listaContato = [];

    if (json['results'] != null) {
      listaContato = <TarefaModel>[];
      json['results'].forEach((v) {
        listaContato.add(TarefaModel.fromJson(v));
      });
    }
    return listaContato;
  }

}
