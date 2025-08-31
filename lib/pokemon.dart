class Pokemon {
    String? name;
    String? url;
    String? imagem;
    int? id;

    Pokemon({
        this.name,
        this.url,
        this.imagem,
        this.id,
    });

    static Pokemon fromJson(Map<String, dynamic> json){
      return Pokemon(
        name: json['name'],
        url: json['url'],
      );
    }
}