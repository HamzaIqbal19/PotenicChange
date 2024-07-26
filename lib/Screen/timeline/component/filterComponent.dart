import 'package:flutter/material.dart';
import 'package:potenic_app/Screen/timeline/component/hurdle_component.dart';
import 'package:potenic_app/Screen/timeline/component/inspiration_component.dart';
import 'package:potenic_app/Screen/timeline/component/newvision_component.dart';
import 'package:potenic_app/Screen/timeline/component/recorded_component.dart';
import 'package:potenic_app/Screen/timeline/component/repoprt_component.dart';
import 'package:potenic_app/utils/app_dimensions.dart';

// filterComponent(context, data, component, goalName, pastActivities) {
//   print("SlecltedAcsd $component");
//   if (component == 'Hurdle') {
//     return data['userHurdlesCreated'].length == 0
//         ? noActivity(context)
//         : ListView.builder(
//             shrinkWrap: true,
//             itemCount: data['userHurdlesCreated'].length,
//             padding: EdgeInsets.zero,
//             physics: const NeverScrollableScrollPhysics(),
//             itemBuilder: (context, index) {
//               var data1 = data['userHurdlesCreated'][index];
//               return HurdleComponent(
//                 mainText: data1['hurdleName'],
//                 subText: data1['triggerStatment'],
//                 status: 'Created',
//               );
//             });
//   } else if (component == 'Inspiration') {
//     return data['userInspirationsCreated'].length == 0
//         ? noActivity(context)
//         : ListView.builder(
//             shrinkWrap: true,
//             itemCount: data['userInspirationsCreated'].length,
//             padding: EdgeInsets.zero,
//             physics: const NeverScrollableScrollPhysics(),
//             itemBuilder: (context, index) {
//               var data1 = data['userInspirationsCreated'][index];
//               return InspirationComponent(
//                 Text1: data1['title'],
//                 mainImage: data1['file'].toString(),
//                 inspirationId: data1['inspirationId'].toString(),
//                 Text2: data1['description'],
//                 status: null,
//               );
//             });
//   } else if (component == 'Practice session') {
//     var filterData = filterOnGoalNames(data, goalName, 'recordings');
//     return filterData['recordings'].length != 0
//         ? ListView.builder(
//             shrinkWrap: true,
//             itemCount: filterData['recordings'].length,
//             padding: EdgeInsets.only(top: 0),
//             physics: const NeverScrollableScrollPhysics(),
//             itemBuilder: (context, index) {
//               var data1 = filterData['recordings'][index];
//               return ListView.builder(
//                   shrinkWrap: true,
//                   itemCount: data1['schedule'].length - 1,
//                   padding: EdgeInsets.zero,
//                   physics: const NeverScrollableScrollPhysics(),
//                   itemBuilder: (context, index) {
//                     var schedule = data1['schedule']['time${index + 1}'];
//                     return RecordedComponent(
//                       afterText: data1['recordingAfterFeelingTime${index + 1}']
//                           .toString(),
//                       past: pastActivities,
//                       scheduleTime: schedule,
//                       recordedText: data1['name'],
//                       goalName: data1['userGoal']['name'],
//                       pracName: data1['name'],
//                       beforeText:
//                           data1['recordingBeforeFeelingTime${index + 1}']
//                               .toString(),
//                       orangeImage: data1['userGoal']['color'],
//                       greenImage: data1['color'],
//                       status: data1['recordingStatusTime${index + 1}'],
//                       missedGreenImage: null,
//                     );
//                   });
//             })
//         : noActivity(context);
//   } else if (component == 'Report') {
//     return data['practiceReport'].length == 0
//         ? noActivity(context)
//         : ListView.builder(
//             shrinkWrap: true,
//             itemCount: data['practiceReport'].length,
//             padding: EdgeInsets.zero,
//             physics: const NeverScrollableScrollPhysics(),
//             itemBuilder: (context, index) {
//               var data1 = data['practiceReport'][index];
//               return ReportComponent(
//                 pracName: data1['userPractice']['name'],
//                 color2: data1['userPractice']['color'].toString(),
//                 goalName: data1['userPractice']['userGoal']['name'],
//                 color1: data1['userPractice']['userGoal']['color'].toString(),
//               );
//             });
//   } else if (component == 'New Vision Score') {
//     return data['newGoalLevel'].length == 0
//         ? noActivity(context)
//         : ListView.builder(
//             shrinkWrap: true,
//             itemCount: data['newGoalLevel'].length,
//             padding: EdgeInsets.zero,
//             physics: const NeverScrollableScrollPhysics(),
//             itemBuilder: (context, index) {
//               var data1 = data['newGoalLevel'][index];
//               return NewVisionComponent(
//                 image1: data1['userGoal']['color'],
//                 image2: 'assets/images/medBlue_gradient.webp',
//                 mainText: data1['userGoal']['name'],
//                 subText: data1['userGoal']['identityStatement'][0]['text'],
//                 levelText: data1['goalLevel'].toString() == 'null'
//                     ? '0'
//                     : data1['goalLevel'].toString(),
//               );
//             });
//   }
// }

noActivity(BuildContext context) {
  return Container(
    height: AppDimensionsUpdated.height10(context) * 3,
    margin: EdgeInsets.only(top: AppDimensionsUpdated.height10(context) * 5),
    child: Center(
      child: Text(
        'No Record',
        textAlign: TextAlign.center,
        style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
            fontSize: AppDimensionsUpdated.height10(context) * 2.2),
      ),
    ),
  );
}

filterOnGoalNames(data, goalName, component) {
  var filteredData = [];

  // for (int i = 0; i < data.length; i++) {
  //   if (data[i]['userGoal']['name'] == goalName) {
  //     filteredData.add(data[i]);
  //   }
  // }
  if (goalName == 'All') {
    print("Filtered Data $filteredData");
    return data;
  } else {
    var data1 = data[component];
    filteredData.addAll(
        data1.where((element) => element['userGoal']['name'] == goalName));
    print("Filtered Data $filteredData");
    return filteredData;
  }
}
