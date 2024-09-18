import 'package:get/get.dart';

class PracticeSessionController extends GetxController {
  // Reactive variables
  var int1 = 0.obs;
  var int2 = 0.obs;
  var int3 = 0.obs;
  var dateTime = DateTime.now().obs;

  // Method to get values
  int getInt1() => int1.value;
  int getInt2() => int2.value;
  int getInt3() => int3.value;
  DateTime getDateTime() => dateTime.value;

  // Method to set values
  void setInt1(int value) {
    int1.value = value;
  }

  void setInt2(int value) {
    int2.value = value;
  }

  void setInt3(int value) {
    int3.value = value;
  }

  void setDateTime(DateTime newDateTime) {
    dateTime.value = newDateTime;
  }

  // Method to create/initialize values
  void createValues(int val1, int val2, int val3, DateTime date) {
    int1.value = val1;
    int2.value = val2;
    int3.value = val3;
    dateTime.value = date;
  }
}
