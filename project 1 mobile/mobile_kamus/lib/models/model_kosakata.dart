import 'dart:convert';

ModelKosakata modelKosakataFromJson(String str) => ModelKosakata.fromJson(json.decode(str));

String modelKosakataToJson(ModelKosakata data) => json.encode(data.toJson());

class ModelKosakata {
  bool isSuccess;
  String message;
  List<Datum> data;

  ModelKosakata({
    required this.isSuccess,
    required this.message,
    required this.data,
  });

  factory ModelKosakata.fromJson(Map<String, dynamic> json) => ModelKosakata(
    isSuccess: json["isSuccess"],
    message: json["message"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  get kosa_kata => null;

  get arti => null;

  Map<String, dynamic> toJson() => {
    "isSuccess": isSuccess,
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };

  toLowerCase() {}


}

class Datum {
  String id;
  String indonesia;
  String korea;
  String hangeul;

  Datum({
    required this.id,
    required this.indonesia,
    required this.korea,
    required this.hangeul,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    indonesia: json["indonesia"],
    korea: json["korea"],
    hangeul : json["hangeul"] ,
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "Indonesia": indonesia,
    "Korea": korea,
    "Hangeul" : hangeul,
  };
}





