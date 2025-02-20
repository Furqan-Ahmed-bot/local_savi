class PerformerModel {
  String? userId;
  String? email;
  String? userType;
  bool? isProfileCompleted;
  Null? phone;
  UserDetails? userDetails;
  List<Professions>? professions;
  List<Documents>? documents;
  Review? review;

  PerformerModel(
      {this.userId, this.email, this.userType, this.isProfileCompleted, this.phone, this.userDetails, this.professions, this.documents, this.review});

  PerformerModel.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    email = json['email'];
    userType = json['user_type'];
    isProfileCompleted = json['is_profile_completed'];
    phone = json['phone'];
    userDetails = json['user_details'] != null ? new UserDetails.fromJson(json['user_details']) : null;
    if (json['professions'] != null) {
      professions = <Professions>[];
      json['professions'].forEach((v) {
        professions!.add(new Professions.fromJson(v));
      });
    }
    if (json['documents'] != null) {
      documents = <Documents>[];
      json['documents'].forEach((v) {
        documents!.add(new Documents.fromJson(v));
      });
    }
    review = json['review'] != null ? new Review.fromJson(json['review']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['email'] = this.email;
    data['user_type'] = this.userType;
    data['is_profile_completed'] = this.isProfileCompleted;
    data['phone'] = this.phone;
    if (this.userDetails != null) {
      data['user_details'] = this.userDetails!.toJson();
    }
    if (this.professions != null) {
      data['professions'] = this.professions!.map((v) => v.toJson()).toList();
    }
    if (this.documents != null) {
      data['documents'] = this.documents!.map((v) => v.toJson()).toList();
    }
    if (this.review != null) {
      data['review'] = this.review!.toJson();
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
  int? completedJobs;
  bool? isStripeVerified;

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
      this.age,
      this.completedJobs,
      this.isStripeVerified});

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
    completedJobs = json['completed_jobs'];
    isStripeVerified = json['is_stripe_verified'];
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
    data['completed_jobs'] = this.completedJobs;
    data['is_stripe_verified'] = this.isStripeVerified;
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

class Documents {
  String? documentId;
  String? mediaFile;

  Documents({this.documentId, this.mediaFile});

  Documents.fromJson(Map<String, dynamic> json) {
    documentId = json['document_id'];
    mediaFile = json['media_file'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['document_id'] = this.documentId;
    data['media_file'] = this.mediaFile;
    return data;
  }
}

class Review {
  String? id;
  String? performerId;
  double? averageRatings;
  int? ratingCount;
  String? createdAt;
  String? updatedAt;

  Review({this.id, this.performerId, this.averageRatings, this.ratingCount, this.createdAt, this.updatedAt});

  Review.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    performerId = json['performer_id'];
    averageRatings = json['average_ratings'];
    ratingCount = json['rating_count'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['performer_id'] = this.performerId;
    data['average_ratings'] = this.averageRatings;
    data['rating_count'] = this.ratingCount;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}
