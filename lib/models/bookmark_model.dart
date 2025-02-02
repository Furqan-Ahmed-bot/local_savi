class BookMarkModel {
  String? id;
  Jobs? jobs;

  BookMarkModel({this.id, this.jobs});

  BookMarkModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    jobs = json['jobs'] != null ? new Jobs.fromJson(json['jobs']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.jobs != null) {
      data['jobs'] = this.jobs!.toJson();
    }
    return data;
  }
}

class Jobs {
  String? id;
  String? title;
  String? description;
  String? jobDate;
  String? startTime;
  String? budget;
  String? jobStatus;
  bool? canApply;

  Jobs(
      {this.id,
      this.title,
      this.description,
      this.jobDate,
      this.startTime,
      this.budget,
      this.jobStatus,
      this.canApply});

  Jobs.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    jobDate = json['job_date'];
    startTime = json['start_time'];
    budget = json['budget'].toString();
    jobStatus = json['job_status'];
    canApply = json['can_apply'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    data['job_date'] = this.jobDate;
    data['start_time'] = this.startTime;
    data['budget'] = this.budget;
    data['job_status'] = this.jobStatus;
    data['can_apply'] = this.canApply;
    return data;
  }
}
