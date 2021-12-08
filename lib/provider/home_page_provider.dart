import 'package:flutter/cupertino.dart';

class HomePageProvider with ChangeNotifier {
  bool? isEligible;
  String? eligibilityMassage = "";

  void checkEligibility(int age) {
    if (age >= 18) {
      isEligible = true;
      eligibilityMassage = "You are eligible!";
      notifyListeners();
    } else {
      isEligible = false;
      eligibilityMassage = "You are not eligible!";
      notifyListeners();
    }
  }
}
