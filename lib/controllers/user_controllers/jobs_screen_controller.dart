import 'package:get/get.dart';

class JobsScreenController extends GetxController {
  RxInt selectedIndex = 0.obs;
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
