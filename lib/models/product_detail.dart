class ProductDetail {
  bool? status;
  String? message;
  ModelData? data;

  ProductDetail({this.status, this.message, this.data});

  ProductDetail.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? ModelData.fromJson(json['data']) : null;
  }
}

class ModelData {
  Vehicles? vehicles;

  ModelData({this.vehicles});

  ModelData.fromJson(Map<String, dynamic> json) {
    vehicles =
        json['vehicles'] != null ? Vehicles.fromJson(json['vehicles']) : null;
  }

 
}

class Vehicles {
  int? currentPage;
  List<ModelData>? data;
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  List<Links>? links;
  String? nextPageUrl;
  String? path;
  String? perPage;
  String? prevPageUrl;
  int? to;
  int? total;

  Vehicles(
      {this.currentPage,
      this.data,
      this.firstPageUrl,
      this.from,
      this.lastPage,
      this.lastPageUrl,
      this.links,
      this.nextPageUrl,
      this.path,
      this.perPage,
      this.prevPageUrl,
      this.to,
      this.total});

  Vehicles.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    if (json['data'] != null) {
      data = <ModelData>[];
      json['data'].forEach((v) {
        data!.add(ModelData.fromJson(v));
      });
    }
    firstPageUrl = json['first_page_url'];
    from = json['from'];
    lastPage = json['last_page'];
    lastPageUrl = json['last_page_url'];
    if (json['links'] != null) {
      links = <Links>[];
      json['links'].forEach((v) {
        links!.add(Links.fromJson(v));
      });
    }
    nextPageUrl = json['next_page_url'];
    path = json['path'];
    perPage = json['per_page'];
    prevPageUrl = json['prev_page_url'];
    to = json['to'];
    total = json['total'];
  }


}

class Data {
  int? id;
  String? makeId;
  String? vehicleModelId;
  String? bodyTypeId;
  Null colorId;
  String? transmissionId;
  String? fuelTypeId;
  String? conditionId;
  String? usePreferenceId;
  String? vehicleTypeId;
  String? countryId;
  Null sellerId;
  Null dealerId;
  String? title;
  String? slug;
  String? year;
  Null mileage;
  String? unitPrice;
  String? mrpPrice;
  String? engine;
  Null power;
  Null location;
  List<Null>? basicData;
  List<Null>? vehicleHistory;
  List<Null>? technicalData;
  List<Null>? energyConsumption;
  List<Null>? equipment;
  List<Null>? colourUpholstery;
  Null shortDescription;
  Null description;
  String? thumbnailImage;
  List<String>? featureImages;
  List<String>? gallery;
  String? status;
  Null depth;
  Null rgt;
  Null lft;
  Null parentId;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.id,
      this.makeId,
      this.vehicleModelId,
      this.bodyTypeId,
      this.colorId,
      this.transmissionId,
      this.fuelTypeId,
      this.conditionId,
      this.usePreferenceId,
      this.vehicleTypeId,
      this.countryId,
      this.sellerId,
      this.dealerId,
      this.title,
      this.slug,
      this.year,
      this.mileage,
      this.unitPrice,
      this.mrpPrice,
      this.engine,
      this.power,
      this.location,
      this.basicData,
      this.vehicleHistory,
      this.technicalData,
      this.energyConsumption,
      this.equipment,
      this.colourUpholstery,
      this.shortDescription,
      this.description,
      this.thumbnailImage,
      this.featureImages,
      this.gallery,
      this.status,
      this.depth,
      this.rgt,
      this.lft,
      this.parentId,
      this.createdAt,
      this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    makeId = json['make_id'];
    vehicleModelId = json['vehicle_model_id'];
    bodyTypeId = json['body_type_id'];
    colorId = json['color_id'];
    transmissionId = json['transmission_id'];
    fuelTypeId = json['fuel_type_id'];
    conditionId = json['condition_id'];
    usePreferenceId = json['use_preference_id'];
    vehicleTypeId = json['vehicle_type_id'];
    countryId = json['country_id'];
    sellerId = json['seller_id'];
    dealerId = json['dealer_id'];
    title = json['title'];
    slug = json['slug'];
    year = json['year'];
    mileage = json['mileage'];
    unitPrice = json['unit_price'];
    mrpPrice = json['mrp_price'];
    engine = json['engine'];
    power = json['power'];
    location = json['location'];
    // if (json['basic_data'] != null) {
    //   basicData = <Null>[];
    //   json['basic_data'].forEach((v) {
    //     basicData!.add(Null.fromJson(v));
    //   });
    // }
    // if (json['vehicle_history'] != null) {
    //   vehicleHistory = <Null>[];
    //   json['vehicle_history'].forEach((v) {
    //     vehicleHistory!.add(Null.fromJson(v));
    //   });
    // }
    // if (json['technical_data'] != null) {
    //   technicalData = <Null>[];
    //   json['technical_data'].forEach((v) {
    //     technicalData!.add(Null.fromJson(v));
    //   });
    // }
    // if (json['energy_consumption'] != null) {
    //   energyConsumption = <Null>[];
    //   json['energy_consumption'].forEach((v) {
    //     energyConsumption!.add(Null.fromJson(v));
    //   });
    // }
    // if (json['equipment'] != null) {
    //   equipment = <Null>[];
    //   json['equipment'].forEach((v) {
    //     equipment!.add(Null.fromJson(v));
    //   });
    // }
    // if (json['colour_upholstery'] != null) {
    //   colourUpholstery = <Null>[];
    //   json['colour_upholstery'].forEach((v) {
    //     colourUpholstery!.add(Null.fromJson(v));
    //   });
    // }
    shortDescription = json['short_description'];
    description = json['description'];
    thumbnailImage = json['thumbnail_image'];
    featureImages = json['feature_images'].cast<String>();
    gallery = json['gallery'].cast<String>();
    status = json['status'];
    depth = json['depth'];
    rgt = json['rgt'];
    lft = json['lft'];
    parentId = json['parent_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }


}

class Links {
  String? url;
  String? label;
  bool? active;

  Links({this.url, this.label, this.active});

  Links.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    label = json['label'];
    active = json['active'];
  }

 
}
