class HistoryItem {
  int? id;
  String? name;
  String? image;
  String? recette;
  String? ingredient;
  String? price;
  String? userMail;
  String? cardNumber;
  String? ccv;
  bool? isClaimed;
  String? date;
  String? localisation;

  HistoryItem({
    this.id,
    this.name,
    this.image,
    this.recette,
    this.ingredient,
    this.price,
    this.userMail,
    this.cardNumber,
    this.ccv,
    this.isClaimed,
    this.date,
    this.localisation
  });

  fromJson(Map<String,dynamic> json) {
    id = json["id"];
    name = json["name"];
    image = json["image"];
    recette = json["recette"];
    ingredient = json["ingredient"];
    price = json["price"];
    userMail = json["userMail"];
    cardNumber = json["cardNumber"];
    ccv = json["ccv"];
    isClaimed = json["isClaimed"];
    date = json["date"];
    localisation = json["localisation"];
    return this;
  }

  Map<String,dynamic> toJson() {
    final Map<String,dynamic> data = new Map<String,dynamic>();
    data["id"] = this.id;
    data["name"] = this.name;
    data["image"] = this.image;
    data["recette"] = this.recette;
    data["ingredient"] = this.ingredient;
    data["price"] = this.price;
    data["userMail"] = this.userMail;
    data["cardNumber"] = this.cardNumber;
    data["ccv"] = this.ccv;
    data["isClaimed"] = this.isClaimed;
    data["date"] = this.date;
    data["localisation"] = this.localisation;

    return data;
  }
  
}
