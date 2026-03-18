import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:command_runner/command_runner.dart';

const version = '0,0,1'; //global - todo codigo do meu dartpedia2 consegue acessar.


//metodo principal
void main (List<String> arguments) async{
 var commandRunner = CommandRunner(
  onError: (Object error){
    if (error is Error){
      throw error;
    }
    if (error is Exception){
      print(error);
    }
  },
 )..addCommand(HelpCommand());
 CommandRunner.run(arguments);
}


void printUsage(){
  print("comandos válidos: 'help', 'version', 'search <ARTICLE-TITLE>'");
}

void searchWikipedia(List<String>? arguments) async{ //pode ou não receber valores
  final String? tituloArtigo;

  if (arguments == null || arguments.isEmpty){
    print('Por favor, forneça um assunto:');
    final inputStdin = stdin.readLineSync();
    if(inputStdin == null || inputStdin.isEmpty){
      print('Erro, pesquisa em branco.');
      return;
    }
    tituloArtigo = inputStdin;
  } else {
    tituloArtigo = arguments.join(' ');
  }
  print('Procurando  artigos sobre "$tituloArtigo". Aguarde.');
  var conteudoArtigo = await (getWikipediaArticle(tituloArtigo));

  print('Aqui está!');
  print(conteudoArtigo);
}

Future<String> getWikipediaArticle(String tituloArtigo) async{
  final url = Uri.http('en.wikipedia.org',
  '/api/rest_v1/page/summary/$tituloArtigo',
  );
  final response = await http.get(url); // o codigo só anda qnd o await permitir e tiver retorno
  if (response.statusCode == 200){
    return response.body;
  }
  return 'Erro: falha ao acessar o $tituloArtigo';
  }