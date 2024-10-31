import 'package:get/get.dart';

class TutorialController extends GetxController {
  // Track if tutorial should be shown
  RxBool showTutorial = false.obs;
  bool get shouldStartTutorial => showTutorial.value;
  // Function to determine and start tutorial
  bool startTutorial() {
      showTutorial.value = true;
    return true;
  }

  bool stopTutorial() {
    showTutorial.value = false;
    return false;
  }

  // Method to start the tutorial

}
