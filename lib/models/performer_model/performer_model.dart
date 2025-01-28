class PerformerModel {
  String? userId;
  String? email;
  String? userType;
  Null? phone;
  UserDetails? userDetails;
  List<Professions>? professions;

  PerformerModel({this.userId, this.email, this.userType, this.phone, this.userDetails, this.professions});

  PerformerModel.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    email = json['email'];
    userType = json['user_type'];
    phone = json['phone'];
    userDetails = json['user_details'] != null ? new UserDetails.fromJson(json['user_details']) : null;
    if (json['professions'] != null) {
      professions = <Professions>[];
      json['professions'].forEach((v) {
        professions!.add(new Professions.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['email'] = this.email;
    data['user_type'] = this.userType;
    data['phone'] = this.phone;
    if (this.userDetails != null) {
      data['user_details'] = this.userDetails!.toJson();
    }
    if (this.professions != null) {
      data['professions'] = this.professions!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class UserDetails {
  String? description;
  String? profilePicture;
  String? dateOfBirth;
  String? firstName;
  String? lastName;
  String? longitude;
  String? latitude;
  String? contactEmail;
  Null? contactPhone;
  String? address;
  String? location;
  String? gender;
  String? workerType;
  int? age;

  UserDetails(
      {this.description,
      this.profilePicture,
      this.dateOfBirth,
      this.firstName,
      this.lastName,
      this.longitude,
      this.latitude,
      this.contactEmail,
      this.contactPhone,
      this.address,
      this.location,
      this.gender,
      this.workerType,
      this.age});

  UserDetails.fromJson(Map<String, dynamic> json) {
    description = json['description'];
    profilePicture = json['profile_picture'];
    dateOfBirth = json['date_of_birth'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    longitude = json['longitude'];
    latitude = json['latitude'];
    contactEmail = json['contact_email'];
    contactPhone = json['contact_phone'];
    address = json['address'];
    location = json['location'];
    gender = json['gender'];
    workerType = json['worker_type'];
    age = json['age'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['description'] = this.description;
    data['profile_picture'] = this.profilePicture;
    data['date_of_birth'] = this.dateOfBirth;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['longitude'] = this.longitude;
    data['latitude'] = this.latitude;
    data['contact_email'] = this.contactEmail;
    data['contact_phone'] = this.contactPhone;
    data['address'] = this.address;
    data['location'] = this.location;
    data['gender'] = this.gender;
    data['worker_type'] = this.workerType;
    data['age'] = this.age;
    return data;
  }
}

class Professions {
  String? id;
  String? professionServiceId;
  String? professionName;

  Professions({this.id, this.professionServiceId, this.professionName});

  Professions.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    professionServiceId = json['profession_service_id'];
    professionName = json['profession_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['profession_service_id'] = this.professionServiceId;
    data['profession_name'] = this.professionName;
    return data;
  }
}
