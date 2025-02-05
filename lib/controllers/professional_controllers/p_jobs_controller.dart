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
    getJobs();
    print("=====<>> init:");
    super.onInit();
  }

//[OPEN, UPCOMING, ONGOING, COMPLETED, CANCELLED]
  getJobs() async {
    isLoading.value = true;

    appliedJobsList = await UserServices.instance
        .getPerformerAllFilteredJobs(filter: "APPLIED");
    upcomingJobsList = await UserServices.instance
        .getPerformerAllFilteredJobs(filter: "UPCOMING");
    ongoingJobsList = await UserServices.instance
        .getPerformerAllFilteredJobs(filter: "ONGOING");
    completedJobsList = await UserServices.instance
        .getPerformerAllFilteredJobs(filter: "COMPLETED");
    // cancelledJobsList =
    //     await UserServices.instance.getPerformerAllJobs(filter: "CANCELLED");
    isLoading.value = false;
    update();
  }

  List<String> names = [
    "Applied",
    "Upcoming",
    "Ongoing",
    "Completed",
    "Cancelled"
  ];

  List listOfCancelledCard = [
    {
      "status": "Pending",
      "date": "July 20",
      "desc": "Lorem ipsum dolor sit amet consectetur adipiscing elit odio."
    },
    {
      "status": "Job Cancelled",
      "date": "July 20",
      "desc": "Lorem ipsum dolor sit amet consectetur adipiscing elit odio."
    },
    {
      "status": "Job Cancelled",
      "date": "July 20",
      "desc": "Lorem ipsum dolor sit amet consectetur adipiscing elit odio."
    },
    {
      "status": "Job Cancelled",
      "date": "July 20",
      "desc": "Lorem ipsum dolor sit amet consectetur adipiscing elit odio."
    },
    {
      "status": "Job Cancelled",
      "date": "July 20",
      "desc": "Lorem ipsum dolor sit amet consectetur adipiscing elit odio."
    },
  ];
}
