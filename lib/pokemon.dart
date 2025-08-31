class Pokemon {
    String? name;
    String? url;
    String? imagem;

    Pokemon({
        this.name,
        this.url,
        this.imagem,
    });

    static Pokemon fromJson(Map<String, dynamic> json){
      return Pokemon(
        name: json['name'],
        url: json['url'],
      );
    }
}