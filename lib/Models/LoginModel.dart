class LoginModel {
  String? code;
  bool? status;
  String? message;
  Data? data;

  LoginModel({this.code, this.status, this.message, this.data});

  LoginModel.fromJson(Map<String, dynamic> json) {
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
  String? token;
  User? user;

  Data({this.token, this.user});

  Data.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class User {
  int? id;
  String? userType;
  int? tenantId;
  String? zipCode;
  String? address;
  String? firstName;
  String? lastName;
  String? phone;
  String? email;
  String? photo;
  String? profileStatus;

  User(
      {this.id,
        this.userType,
        this.tenantId,
        this.zipCode,
        this.address,
        this.firstName,
        this.lastName,
        this.phone,
        this.email,
        this.photo,
        this.profileStatus});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userType = json['user_type'];
    tenantId = json['tenant_id'];
    zipCode = json['zip_code'];
    address = json['address'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    phone = json['phone'];
    email = json['email'];
    photo = json['photo'];
    profileStatus = json['profile_status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_type'] = this.userType;
    data['tenant_id'] = this.tenantId;
    data['zip_code'] = this.zipCode;
    data['address'] = this.address;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['photo'] = this.photo;
    data['profile_status'] = this.profileStatus;
    return data;
  }
}
