class Shein {
  
  Shein ({
    required this.pageid,
    required this.nomeProduto,
    required this.id,
    required this.precoDesc,
    required this.precoOriginal,
    required this.cor,
    required this.imagem,
    required this.origem,
    required this.estoque,
    this.avaliacao,
    this.url,
    this.descricao,
    this.favorito,
    this.marca,
    this.imagensextras,
    this.tamanhos,
  });  



  int pageid;
  String nomeProduto;
  String id;
  String precoDesc;
  String precoOriginal;
  String? avaliacao;
  String cor;
  String imagem;
  String origem;
  String? favorito;
  String estoque;
  String? tamanhos;
  String? marca;
  String? imagensextras;
  String? descricao;
  String? url;


}