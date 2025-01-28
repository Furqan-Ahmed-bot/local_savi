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

  @override
  void onInit() {
    getJobs();
    super.onInit();
  }

//[OPEN, UPCOMING, ONGOING, COMPLETED, CANCELLED]
  getJobs() async {
    appliedJobsList =
        await UserServices().getPerformerAllJobs(filter: "APPLIED");
    upcomingJobsList =
        await UserServices().getPerformerAllJobs(filter: "UPCOMING");
    ongoingJobsList =
        await UserServices().getPerformerAllJobs(filter: "ONGOING");
    completedJobsList =
        await UserServices().getPerformerAllJobs(filter: "COMPLETED");
    // cancelledJobsList =
    //     await UserServices().getPerformerAllJobs(filter: "CANCELLED");

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
