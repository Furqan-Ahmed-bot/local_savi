class PerformerAllJobsModel {
  String? id;
  String? userId;
  dynamic performerId;
  dynamic paymentIntentId;
  dynamic transactionId;
  dynamic payoutId;
  dynamic transferId;
  dynamic categoryId;
  String? title;
  String? jobDate;
  String? startTime;
  String? description;
  String? location;
  String? address;
  String? state;
  String? city;
  String? latitude;
  String? longitude;
  dynamic taxAmount;
  dynamic netAmount;
  dynamic commissionCharges;
  dynamic grossAmount;
  bool? isPaid;
  bool? isPaidToPerformer;
  dynamic completedAt;
  dynamic budget;
  dynamic decidedCost;
  String? jobStatus;
  String? paymentStatus;
  String? workerType;
  String? jobType;
  String? budgetType;
  dynamic jobJourney;
  String? createdAt;
  String? updatedAt;

  PerformerAllJobsModel(
      {this.id,
      this.userId,
      this.performerId,
      this.paymentIntentId,
      this.transactionId,
      this.payoutId,
      this.transferId,
      this.categoryId,
      this.title,
      this.jobDate,
      this.startTime,
      this.description,
      this.location,
      this.address,
      this.state,
      this.city,
      this.latitude,
      this.longitude,
      this.taxAmount,
      this.netAmount,
      this.commissionCharges,
      this.grossAmount,
      this.isPaid,
      this.isPaidToPerformer,
      this.completedAt,
      this.budget,
      this.decidedCost,
      this.jobStatus,
      this.paymentStatus,
      this.workerType,
      this.jobType,
      this.budgetType,
      this.jobJourney,
      this.createdAt,
      this.updatedAt});

  PerformerAllJobsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    performerId = json['performer_id'];
    paymentIntentId = json['payment_intent_id'];
    transactionId = json['transaction_id'];
    payoutId = json['payout_id'];
    transferId = json['transfer_id'];
    categoryId = json['category_id'];
    title = json['title'];
    jobDate = json['job_date'];
    startTime = json['start_time'];
    description = json['description'];
    location = json['location'];
    address = json['address'];
    state = json['state'];
    city = json['city'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    taxAmount = json['tax_amount'];
    netAmount = json['net_amount'];
    commissionCharges = json['commission_charges'];
    grossAmount = json['gross_amount'];
    isPaid = json['is_paid'];
    isPaidToPerformer = json['is_paid_to_performer'];
    completedAt = json['completed_at'];
    budget = json['budget'];
    decidedCost = json['decided_cost'];
    jobStatus = json['job_status'];
    paymentStatus = json['payment_status'];
    workerType = json['worker_type'];
    jobType = json['job_type'];
    budgetType = json['budget_type'];
    jobJourney = json['job_journey'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['performer_id'] = this.performerId;
    data['payment_intent_id'] = this.paymentIntentId;
    data['transaction_id'] = this.transactionId;
    data['payout_id'] = this.payoutId;
    data['transfer_id'] = this.transferId;
    data['category_id'] = this.categoryId;
    data['title'] = this.title;
    data['job_date'] = this.jobDate;
    data['start_time'] = this.startTime;
    data['description'] = this.description;
    data['location'] = this.location;
    data['address'] = this.address;
    data['state'] = this.state;
    data['city'] = this.city;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['tax_amount'] = this.taxAmount;
    data['net_amount'] = this.netAmount;
    data['commission_charges'] = this.commissionCharges;
    data['gross_amount'] = this.grossAmount;
    data['is_paid'] = this.isPaid;
    data['is_paid_to_performer'] = this.isPaidToPerformer;
    data['completed_at'] = this.completedAt;
    data['budget'] = this.budget;
    data['decided_cost'] = this.decidedCost;
    data['job_status'] = this.jobStatus;
    data['payment_status'] = this.paymentStatus;
    data['worker_type'] = this.workerType;
    data['job_type'] = this.jobType;
    data['budget_type'] = this.budgetType;
    data['job_journey'] = this.jobJourney;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}
