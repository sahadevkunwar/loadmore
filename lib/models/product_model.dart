class Product {
  bool status;
  String message;
  MakerData data;

  Product({
    required this.status,
    required this.message,
    required this.data,
  });

  factory Product.fromMap(Map<String, dynamic> json) => Product(
        status: json["status"],
        message: json["message"],
        data: MakerData.fromMap(json["data"]),
      );
}

class MakerData {
  List<Make> makes;

  MakerData({
    required this.makes,
  });

  factory MakerData.fromMap(Map<String, dynamic> json) => MakerData(
        makes: List<Make>.from(json["makes"].map((x) => Make.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "makes": List<dynamic>.from(makes.map((x) => x.toMap())),
      };
}

class Make {
  int id;
  String title;
  String? code;
  String? image;
  String status;
  String count;

  Make(
      {required this.id,
      required this.title,
      required this.code,
      required this.image,
      required this.status,
      required this.count});

  factory Make.fromMap(Map<String, dynamic> json) => Make(
      id: json["id"],
      title: json["title"],
      code: json["code"],
      image: json["image"],
      status: json["status"],
      count: json['count']);

  Map<String, dynamic> toMap() => {
        "id": id,
        "title": title,
        "code": code,
        "image": image,
        "status": status,
      };
}
