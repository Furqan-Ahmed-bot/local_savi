class PerformerJobsModel {
  String? id;
  String? title;
  String? description;
  dynamic budget;
  dynamic decidedCost;
  String? jobDate;
  String? jobStatus;

  PerformerJobsModel(
      {this.id,
      this.title,
      this.description,
      this.budget,
      this.decidedCost,
      this.jobDate,
      this.jobStatus});

  PerformerJobsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    budget = json['budget'];
    decidedCost = json['decided_cost'];
    jobDate = json['job_date'];
    jobStatus = json['job_status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['description'] = description;
    data['budget'] = budget;
    data['decided_cost'] = decidedCost;
    data['job_date'] = jobDate;
    data['job_status'] = jobStatus;
    return data;
  }
}
