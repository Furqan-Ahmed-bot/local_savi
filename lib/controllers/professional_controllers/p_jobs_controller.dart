import 'package:get/get.dart';
import 'package:local_saviors/models/job_performer_model/performer_all_jobs_model.dart';
import 'package:local_saviors/utils/api_services/user_services.dart';

class PJobsController extends GetxController {
  RxInt selectedIndex = 0.obs;
  List<PerformerAllJobsModel> appliedJobsList = [];
  List<PerformerAllJobsModel> upcomingJobsList = [];
  List<PerformerAllJobsModel> ongoingJobsList = [];
  List<PerformerAllJobsModel> completedJobsList = [];
  List<PerformerAllJobsModel> cancelledJobsList = [];
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    getJobs("APPLIED");

    super.onInit();
  }

//[OPEN, UPCOMING, ONGOING, COMPLETED, CANCELLED]
  getJobs(status) async {
    isLoading.value = true;
    if (status == "APPLIED") {
      appliedJobsList = await UserServices.instance.getPerformerAllFilteredJobs(filter: "APPLIED");
    } else if (status == "UPCOMING") {
      upcomingJobsList = await UserServices.instance.getPerformerAllFilteredJobs(filter: "UPCOMING");
    } else if (status == "ONGOING") {
      ongoingJobsList = await UserServices.instance.getPerformerAllFilteredJobs(filter: "ONGOING");
    } else if (status == "COMPLETED") {
      completedJobsList = await UserServices.instance.getPerformerAllFilteredJobs(filter: "COMPLETED");
    } else {
      cancelledJobsList = await UserServices.instance.getPerformerAllFilteredJobs(filter: "CANCELLED");
    }

    isLoading.value = false;
    update();
  }

  List<String> names = ["Applied", "Upcoming", "Ongoing", "Completed", "Cancelled"];

  // List listOfCancelledCard = [
  //   {
  //     "status": "Pending",
  //     "date": "July 20",
  //     "desc": "Lorem ipsum dolor sit amet consectetur adipiscing elit odio."
  //   },
  //   {
  //     "status": "Job Cancelled",
  //     "date": "July 20",
  //     "desc": "Lorem ipsum dolor sit amet consectetur adipiscing elit odio."
  //   },
  //   {
  //     "status": "Job Cancelled",
  //     "date": "July 20",
  //     "desc": "Lorem ipsum dolor sit amet consectetur adipiscing elit odio."
  //   },
  //   {
  //     "status": "Job Cancelled",
  //     "date": "July 20",
  //     "desc": "Lorem ipsum dolor sit amet consectetur adipiscing elit odio."
  //   },
  //   {
  //     "status": "Job Cancelled",
  //     "date": "July 20",
  //     "desc": "Lorem ipsum dolor sit amet consectetur adipiscing elit odio."
  //   },
  // ];
}
