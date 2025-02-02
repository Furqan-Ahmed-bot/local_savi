class JobsModel {
  String? id;
  String? title;
  String? description;
  dynamic? budget;
  dynamic? decidedCost;
  String? jobDate;
  String? jobStatus;
  String? startTime;
  String? workerType;

  JobsModel(
      {this.id,
      this.title,
      this.description,
      this.budget,
      this.decidedCost,
      this.jobDate,
      this.jobStatus,
      this.startTime,
      this.workerType});

  JobsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    budget = json['budget'].toString();
    decidedCost = json['decided_cost'];
    jobDate = json['job_date'];
    jobStatus = json['job_status'];
    startTime = json['start_time'];
    workerType = json['worker_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    data['budget'] = this.budget;
    data['decided_cost'] = this.decidedCost;
    data['job_date'] = this.jobDate;
    data['job_status'] = this.jobStatus;
    data['start_time'] = this.startTime;
    data['worker_type'] = this.workerType;
    return data;
  }
}
