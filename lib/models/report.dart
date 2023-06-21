class Report{
  int? id;
  int? idFacture;
  int? idCategoryClaim;
  String? message;
  int? isDone;
  String? date;

  Report({
    this.id,
    this.idFacture,
    this.idCategoryClaim,
    this.message,
    this.isDone,
    this.date
  });

  fromJson(Map<String,dynamic> json) {
    id = json["id"];
    idFacture = json["idFacture"];
    idCategoryClaim = json["idCategoryClaim"];
    message = json["message"];
    isDone = json["isDone"];
    date = json["date"];

    return this;
  }

  Map<String,dynamic> toJson() {
    Map<String,dynamic> data = new Map<String,dynamic>();
    data["id"] = this.id;
    data["idFacture"] = this.idFacture;
    data["idCategoryClaim"] = this.idCategoryClaim;
    data["message"] = this.message;
    data["isDone"] = this.isDone;
    data["date"] = this.date;

    return data;
  }
}