class Report{
  int? id;
  int? idFacture;
  String? message;
  int? isDone;

  Report({
    this.id,
    this.idFacture,
    this.message,
    this.isDone
  });

  fromJson(Map<String,dynamic> json) {
    id = json["id"];
    idFacture = json["idFacture"];
    message = json["message"];
    isDone = json["isDone"];

    return this;
  }

  Map<String,dynamic> toJson() {
    Map<String,dynamic> data = new Map<String,dynamic>();
    data["id"] = this.id;
    data["idFacture"] = idFacture;
    data["message"] = this.message;
    data["isDone"] = this.isDone;

    return data;
  }
}