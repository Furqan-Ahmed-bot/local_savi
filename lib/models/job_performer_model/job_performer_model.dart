class PerformerJobsModel {
  String? id;
  String? title;
  String? description;
  dynamic budget;
  dynamic decidedCost;
  String? jobDate;
  String? jobTime;
  String? jobStatus;
  bool? bookMarked;


  PerformerJobsModel({this.id, this.title, this.description, this.budget, this.decidedCost, this.jobDate, this.jobTime, this.jobStatus, this.bookMarked});

  PerformerJobsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    budget = json['budget'].toString();
    decidedCost = json['decided_cost'];
    jobDate = json['job_date'];
    jobTime = json['start_time'];
    jobStatus = json['job_status'];
    bookMarked = json['is_bookmarked'];
    
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['description'] = description;
    data['budget'] = budget;
    data['decided_cost'] = decidedCost;
    data['job_date'] = jobDate;
    data['start_time'] = jobTime;
    data['job_status'] = jobStatus;
    data['is_bookmarked'] = bookMarked;
    return data;
  }
}
