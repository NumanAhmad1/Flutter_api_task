import '/Constants/const.dart';

class PropertyListing {
  String? code;
  bool? status;
  String? message;
  Data? data;

  PropertyListing({this.code, this.status, this.message, this.data});

  PropertyListing.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? totalRecords;
  int? currentPage;
  List<Properties>? properties;

  Data({this.totalRecords, this.currentPage, this.properties});

  Data.fromJson(Map<String, dynamic> json) {
    totalRecords = json['total-records'];
    currentPage = json['current-page'];
    if (json['properties'] != null) {
      properties = <Properties>[];
      json['properties'].forEach((v) {
        properties!.add(new Properties.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total-records'] = this.totalRecords;
    data['current-page'] = this.currentPage;
    if (this.properties != null) {
      data['properties'] = this.properties!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Properties {
  int? id;
  String? title;
  String? description;
  String? type;
  String? categoryTitle;
  String? subCategoryTitle;
  String? price;
  String? propertyImage;
  String? cityTitle;
  String? area;
  String? areaUnitTitle;
  String? zipCode;
  String? address;
  String? isFetured;
  int? isFavourite;

  Properties(
      {this.id,
        this.title,
        this.description,
        this.type,
        this.categoryTitle,
        this.subCategoryTitle,
        this.price,
        this.propertyImage,
        this.cityTitle,
        this.area,
        this.areaUnitTitle,
        this.zipCode,
        this.address,
        this.isFetured,
        this.isFavourite});

  Properties.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    type = json['type'];
    categoryTitle = json['category_title'];
    subCategoryTitle = json['sub_category_title'];
    price = json['price'];
    propertyImage = json['propertyImage'];
    cityTitle = json['city_title'];
    area = json['area'];
    areaUnitTitle = json['area_unit_title'];
    zipCode = json['zip_code'];
    address = json['address'];
    isFetured = json['is_fetured'];
    isFavourite = json['is_favourite'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    data['type'] = this.type;
    data['category_title'] = this.categoryTitle;
    data['sub_category_title'] = this.subCategoryTitle;
    data['price'] = this.price;
    data['propertyImage'] = this.propertyImage;
    data['city_title'] = this.cityTitle;
    data['area'] = this.area;
    data['area_unit_title'] = this.areaUnitTitle;
    data['zip_code'] = this.zipCode;
    data['address'] = this.address;
    data['is_fetured'] = this.isFetured;
    data['is_favourite'] = this.isFavourite;
    return data;
  }
}
