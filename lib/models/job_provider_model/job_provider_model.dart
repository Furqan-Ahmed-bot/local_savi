// ignore_for_file: unnecessary_this

class JobProviderModel {
  String? email;
  String? userType;
  String? phone;
  UserDetails? userDetails;

  JobProviderModel({this.email, this.userType, this.phone, this.userDetails});

  JobProviderModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    userType = json['user_type'];
    phone = json['phone'];
    userDetails = json['user_details'] != null ? new UserDetails.fromJson(json['user_details']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['user_type'] = this.userType;
    data['phone'] = this.phone;
    if (this.userDetails != null) {
      data['user_details'] = this.userDetails!.toJson();
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
  String? contactPhone;
  String? address;
  String? location;
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
    data['age'] = this.age;
    return data;
  }
}
