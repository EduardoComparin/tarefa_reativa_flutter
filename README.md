
# Tarefa Reativa Flutter

Este é um projeto Flutter destinado a criação de tarefas para seu dia a dia.

## Configuração

Certifique-se de ter o Flutter SDK instalado em sua máquina. Para mais informações sobre como instalar o Flutter, consulte [a documentação oficial do Flutter](https://flutter.dev/docs/get-started/install).

- Criação do banco em : https://www.back4app.com com os seguintes campos:

- Tabela "tarefa"
 String "titulo" 
 String "descricao"
 bool "concluido"

 - Após a criação do banco você deve fornecer um arquivo `.env` na pasta `assets/` para configurar as chaves de API necessárias.
X-Parse-Application-Id
X-Parse-REST-API-Key

## Dependências

O projeto utiliza as seguintes dependências:

- [cupertino_icons](https://pub.dev/packages/cupertino_icons): Conjunto de ícones Cupertino para o estilo iOS.
- [path](https://pub.dev/packages/path): Manipulação de caminhos de arquivo e diretório.
- [intl](https://pub.dev/packages/intl): Internacionalização e formatação de datas e números.
- [dio](https://pub.dev/packages/dio): Cliente HTTP eficiente para Flutter e Dart.
- [flutter_dotenv](https://pub.dev/packages/flutter_dotenv): Suporte para variáveis de ambiente.
- [crypto](https://pub.dev/packages/crypto): Biblioteca para criptografia.
- [brasil_fields](https://pub.dev/packages/brasil_fields): Máscaras e validações para campos brasileiros.
- [animated_text_kit](https://pub.dev/packages/animated_text_kit): Kit para animações de texto.
- [font_awesome_flutter](https://pub.dev/packages/font_awesome_flutter): Ícones FontAwesome para Flutter.
- [easy_localization](https://pub.dev/packages/easy_localization): Suporte fácil para localização.
- [get_it](https://pub.dev/packages/get_it): Gerenciamento de dependências simples.
- [get](https://pub.dev/packages/get): Gerenciamento de estado e navegação.

## Configuração do `flutter_launcher_icons`

Certifique-se de executar o seguinte comando para gerar os ícones apropriados para o seu aplicativo:

```bash
dart run flutter_launcher_icons
```

Este comando irá gerar ícones para Android, iOS, e outras plataformas conforme configurado no pubspec.yaml.

Isso garantirá que a aplicação funcione conforme o esperado.

## Executando o Projeto

Para executar o projeto, use o seguinte comando:

```bash
flutter run
```

## Contribuições

Contribuições são bem-vindas! Sinta-se à vontade para abrir problemas ou enviar solicitações de pull para melhorar este projeto.

## Licença

Este projeto está sob a licença MIT. Veja o arquivo [LICENSE](LICENSE) para mais detalhes.
