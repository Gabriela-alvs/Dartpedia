import 'title_set.dart';
//CLASSE 
//ATRIBUTOS - CARACTERISTICAS, DEFINIÇÕES
//CONSTRUTOR
//MÉTODOS-AÇÕES
class Summary{

Summary({
  required this.titles,
  required this.pageid,
  required this.extract,
  required this.extractHTML,
  required this.lang,
  required this.dir,
  this.url,
  this.description,
});

  int pageid;

  String extract;
  String extractHTML;
  String? url;
  String lang;
  String dir;
  String? description;
  TitleSet titles;
}