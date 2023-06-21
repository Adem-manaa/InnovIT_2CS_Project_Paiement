class claimsCategory{
  int? id;
  String? claim;
  String? message;

  claimsCategory({
    this.id,
    this.claim,
    this.message

  });

  fromJson(Map<String,dynamic> json) {
    id = json["id"];
    claim = json["claim"];
    message = json["message"];

    return this;
  }

  Map<String,dynamic> toJson() {
    Map<String,dynamic> data = new Map<String,dynamic>();
    data["id"] = this.id;
    data["claim"] = this.claim;
    data["message"] = this.message;

    return data;
  }
}