import 'package:get/get.dart';
import 'package:flutter/material.dart';

class ProfileDoctorController extends GetxController {
  var selectedDate = DateTime.now().obs;
  var selectedTime = TimeOfDay.now().obs;
  var stringMessage = "".obs;
  chooseDate() async {
    DateTime? pickedDate = await showDatePicker(
      context: Get.context!,
      initialDate: selectedDate.value,
      firstDate: DateTime(2000),
      lastDate: DateTime(2024),
    );
    if (pickedDate != null && pickedDate != selectedDate.value) {
      selectedDate.value = pickedDate;
    }
  }

  chooseTime() async {
    TimeOfDay? pickedTime = await showTimePicker(
      context: Get.context!,
      initialTime: selectedTime.value,
    );
    if (pickedTime != null && pickedTime != selectedTime.value) {
      pickedTime.format(Get.context!);

      if (pickedTime.hour > 20) {
        Get.defaultDialog(
          title: 'Melebihi jam kerja konsultant',
          content: Text('Maaf anda melebihi jam kerja konsultant'),
          textConfirm: 'Ok',
          onConfirm: () {
            Get.back();
          },
        );
      } else {
        if (pickedTime.hour >= 12 && pickedTime.hour <= 24) {
          stringMessage.value = "PM";
        } else {
          stringMessage.value = "AM";
        }
        selectedTime.value = pickedTime;
      }
    }
  }
 
}
