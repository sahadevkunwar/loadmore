// To parse this JSON data, do
//
//     final productDetail = productDetailFromMap(jsonString);

import 'dart:convert';

ProductDetail productDetailFromMap(String str) =>
    ProductDetail.fromMap(json.decode(str));

String productDetailToMap(ProductDetail data) => json.encode(data.toMap());

class ProductDetail {
  bool status;
  String message;
  Data data;

  ProductDetail({
    required this.status,
    required this.message,
    required this.data,
  });

  factory ProductDetail.fromMap(Map<String, dynamic> json) => ProductDetail(
        status: json["status"],
        message: json["message"],
        data: Data.fromMap(json["data"]),
      );

  Map<String, dynamic> toMap() => {
        "status": status,
        "message": message,
        "data": data.toMap(),
      };
}

class Data {
  Vehicles vehicles;

  Data({
    required this.vehicles,
  });

  factory Data.fromMap(Map<String, dynamic> json) => Data(
        vehicles: Vehicles.fromMap(json["vehicles"]),
      );

  Map<String, dynamic> toMap() => {
        "vehicles": vehicles.toMap(),
      };
}

class Vehicles {
  int currentPage;
  List<Datum> data;
  String firstPageUrl;
  int from;
  int lastPage;
  String lastPageUrl;
  List<Link> links;
  String nextPageUrl;
  String path;
  String perPage;
  dynamic prevPageUrl;
  int to;
  int total;

  Vehicles({
    required this.currentPage,
    required this.data,
    required this.firstPageUrl,
    required this.from,
    required this.lastPage,
    required this.lastPageUrl,
    required this.links,
    required this.nextPageUrl,
    required this.path,
    required this.perPage,
    required this.prevPageUrl,
    required this.to,
    required this.total,
  });

  factory Vehicles.fromMap(Map<String, dynamic> json) => Vehicles(
        currentPage: json["current_page"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromMap(x))),
        firstPageUrl: json["first_page_url"],
        from: json["from"],
        lastPage: json["last_page"],
        lastPageUrl: json["last_page_url"],
        links: List<Link>.from(json["links"].map((x) => Link.fromMap(x))),
        nextPageUrl: json["next_page_url"],
        path: json["path"],
        perPage: json["per_page"],
        prevPageUrl: json["prev_page_url"],
        to: json["to"],
        total: json["total"],
      );

  Map<String, dynamic> toMap() => {
        "current_page": currentPage,
        "data": List<dynamic>.from(data.map((x) => x.toMap())),
        "first_page_url": firstPageUrl,
        "from": from,
        "last_page": lastPage,
        "last_page_url": lastPageUrl,
        "links": List<dynamic>.from(links.map((x) => x.toMap())),
        "next_page_url": nextPageUrl,
        "path": path,
        "per_page": perPage,
        "prev_page_url": prevPageUrl,
        "to": to,
        "total": total,
      };
}

class Datum {
  int id;
  String makeId;
  String? vehicleModelId;
  String bodyTypeId;
  dynamic colorId;
  String transmissionId;
  String fuelTypeId;
  String conditionId;
  String usePreferenceId;
  String vehicleTypeId;
  String countryId;
  dynamic sellerId;
  dynamic dealerId;
  String title;
  String slug;
  String year;
  dynamic mileage;
  String unitPrice;
  String mrpPrice;
  String engine;
  dynamic power;
  dynamic location;
  List<BasicDatum> basicData;
  List<BasicDatum> vehicleHistory;
  List<BasicDatum> technicalData;
  List<BasicDatum> energyConsumption;
  List<BasicDatum> equipment;
  List<BasicDatum> colourUpholstery;
  dynamic shortDescription;
  dynamic description;
  String thumbnailImage;
  List<String> featureImages;
  List<String> gallery;
  String status;
  dynamic depth;
  dynamic rgt;
  dynamic lft;
  dynamic parentId;
  DateTime createdAt;
  DateTime updatedAt;

  Datum({
    required this.id,
    required this.makeId,
    required this.vehicleModelId,
    required this.bodyTypeId,
    required this.colorId,
    required this.transmissionId,
    required this.fuelTypeId,
    required this.conditionId,
    required this.usePreferenceId,
    required this.vehicleTypeId,
    required this.countryId,
    required this.sellerId,
    required this.dealerId,
    required this.title,
    required this.slug,
    required this.year,
    required this.mileage,
    required this.unitPrice,
    required this.mrpPrice,
    required this.engine,
    required this.power,
    required this.location,
    required this.basicData,
    required this.vehicleHistory,
    required this.technicalData,
    required this.energyConsumption,
    required this.equipment,
    required this.colourUpholstery,
    required this.shortDescription,
    required this.description,
    required this.thumbnailImage,
    required this.featureImages,
    required this.gallery,
    required this.status,
    required this.depth,
    required this.rgt,
    required this.lft,
    required this.parentId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Datum.fromMap(Map<String, dynamic> json) => Datum(
        id: json["id"],
        makeId: json["make_id"],
        vehicleModelId: json["vehicle_model_id"],
        bodyTypeId: json["body_type_id"],
        colorId: json["color_id"],
        transmissionId: json["transmission_id"],
        fuelTypeId: json["fuel_type_id"],
        conditionId: json["condition_id"],
        usePreferenceId: json["use_preference_id"],
        vehicleTypeId: json["vehicle_type_id"],
        countryId: json["country_id"],
        sellerId: json["seller_id"],
        dealerId: json["dealer_id"],
        title: json["title"],
        slug: json["slug"],
        year: json["year"],
        mileage: json["mileage"],
        unitPrice: json["unit_price"],
        mrpPrice: json["mrp_price"],
        engine: json["engine"],
        power: json["power"],
        location: json["location"],
        basicData: List<BasicDatum>.from(
            json["basic_data"].map((x) => BasicDatum.fromMap(x))),
        vehicleHistory: List<BasicDatum>.from(
            json["vehicle_history"].map((x) => BasicDatum.fromMap(x))),
        technicalData: List<BasicDatum>.from(
            json["technical_data"].map((x) => BasicDatum.fromMap(x))),
        energyConsumption: List<BasicDatum>.from(
            json["energy_consumption"].map((x) => BasicDatum.fromMap(x))),
        equipment: List<BasicDatum>.from(
            json["equipment"].map((x) => BasicDatum.fromMap(x))),
        colourUpholstery: List<BasicDatum>.from(
            json["colour_upholstery"].map((x) => BasicDatum.fromMap(x))),
        shortDescription: json["short_description"],
        description: json["description"],
        thumbnailImage: json["thumbnail_image"],
        featureImages: List<String>.from(json["feature_images"].map((x) => x)),
        gallery: List<String>.from(json["gallery"].map((x) => x)),
        status: json["status"],
        depth: json["depth"],
        rgt: json["rgt"],
        lft: json["lft"],
        parentId: json["parent_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "make_id": makeId,
        "vehicle_model_id": vehicleModelId,
        "body_type_id": bodyTypeId,
        "color_id": colorId,
        "transmission_id": transmissionId,
        "fuel_type_id": fuelTypeId,
        "condition_id": conditionId,
        "use_preference_id": usePreferenceId,
        "vehicle_type_id": vehicleTypeId,
        "country_id": countryId,
        "seller_id": sellerId,
        "dealer_id": dealerId,
        "title": title,
        "slug": slug,
        "year": year,
        "mileage": mileage,
        "unit_price": unitPrice,
        "mrp_price": mrpPrice,
        "engine": engine,
        "power": power,
        "location": location,
        "basic_data": List<dynamic>.from(basicData.map((x) => x.toMap())),
        "vehicle_history":
            List<dynamic>.from(vehicleHistory.map((x) => x.toMap())),
        "technical_data":
            List<dynamic>.from(technicalData.map((x) => x.toMap())),
        "energy_consumption":
            List<dynamic>.from(energyConsumption.map((x) => x.toMap())),
        "equipment": List<dynamic>.from(equipment.map((x) => x.toMap())),
        "colour_upholstery":
            List<dynamic>.from(colourUpholstery.map((x) => x.toMap())),
        "short_description": shortDescription,
        "description": description,
        "thumbnail_image": thumbnailImage,
        "feature_images": List<dynamic>.from(featureImages.map((x) => x)),
        "gallery": List<dynamic>.from(gallery.map((x) => x)),
        "status": status,
        "depth": depth,
        "rgt": rgt,
        "lft": lft,
        "parent_id": parentId,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}

class BasicDatum {
  String key;
  String value;

  BasicDatum({
    required this.key,
    required this.value,
  });

  factory BasicDatum.fromMap(Map<String, dynamic> json) => BasicDatum(
        key: json["key"],
        value: json["value"],
      );

  Map<String, dynamic> toMap() => {
        "key": key,
        "value": value,
      };
}

class Link {
  String? url;
  String label;
  bool active;

  Link({
    required this.url,
    required this.label,
    required this.active,
  });

  factory Link.fromMap(Map<String, dynamic> json) => Link(
        url: json["url"],
        label: json["label"],
        active: json["active"],
      );

  Map<String, dynamic> toMap() => {
        "url": url,
        "label": label,
        "active": active,
      };
}
