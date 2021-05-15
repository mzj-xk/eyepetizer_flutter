import 'package:eyepetizer_flutter/viewmodels/base_view_model.dart';

class TabNavigatorViewModel extends BaseViewModel {
  int index;
  List<String> icons = [
    "assets/images/btn_home_page_normal.png",
    "assets/images/btn_community_normal.png",
    "assets/images/btn_release_normal.png",
    "assets/images/btn_notification_normal.png",
    "assets/images/btn_mine_normal.png",
  ];

  List<String> onClickIcons = [
    "assets/images/btn_home_page_selected.png",
    "assets/images/btn_community_selected.png",
    "assets/images/btn_release_normal.png",
    "assets/images/btn_notification_selected.png",
    "assets/images/btn_mine_selected.png",
  ];

  List<bool> buttonState = [true, false, false, false, false];

  @override
  Future loadData() {
    return null;
  }

  void onClick(index) {
    buttonState = [false, false, false, false, false];
    buttonState[index] = true;
    notifyListeners();
  }
}
