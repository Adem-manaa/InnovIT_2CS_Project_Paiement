class HistoryItem {
  int? id;
  String? name;
  String? image;
  String? recette;
  String? price;
  bool? isReported;

  HistoryItem({
    this.id,
    this.name,
    this.image,
    this.recette,
    this.price,
    this.isReported
  });

  fromJson(Map<String,dynamic> json) {
    id = json["id"];
    name = json["name"];
    image = json["image"];
    recette = json["recette"];
    price = json["price"];
    isReported = json["isReported"];
    return this;
  }

  Map<String,dynamic> toJson() {
    final Map<String,dynamic> data = new Map<String,dynamic>();
    data["id"] = this.id;
    data["name"] = this.name;
    data["image"] = this.image;
    data["recette"] = this.recette;
    data["price"] = this.price;
    data["isReported"] = this.isReported;

    return data;
  }
  
}
