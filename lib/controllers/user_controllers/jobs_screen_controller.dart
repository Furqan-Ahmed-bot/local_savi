import 'package:get/get.dart';
import 'package:local_saviors/models/job_provider_model/JobsModel.dart';
import 'package:local_saviors/utils/api_services/user_services.dart';

class JobsScreenController extends GetxController {
  RxInt selectedIndex = 0.obs;
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    getJobs();
    super.onInit();
  }

//[OPEN, UPCOMING, ONGOING, COMPLETED, CANCELLED]
  getJobs() async {
    isLoading.value = true;
    openJobsList = await UserServices.instance.getAllJobs(filter: "OPEN");
    upcomingJobsList =
        await UserServices.instance.getAllJobs(filter: "UPCOMING");
    ongoingJobsList = await UserServices.instance.getAllJobs(filter: "ONGOING");
    completedJobsList =
        await UserServices.instance.getAllJobs(filter: "COMPLETED");
    cancelledJobsList =
        await UserServices.instance.getAllJobs(filter: "CANCELLED");
    isLoading.value = false;
    update();
  }

  List<JobsModel> openJobsList = [];
  List<JobsModel> upcomingJobsList = [];
  List<JobsModel> ongoingJobsList = [];
  List<JobsModel> completedJobsList = [];
  List<JobsModel> cancelledJobsList = [];

  List<String> names = [
    "Open",
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
