import 'package:flutter/material.dart';

enum ViewState { Idle, Busy }

abstract class BaseViewModel extends ChangeNotifier {
  /// 防止页面销毁后,异步任务才完成,导致报错
  bool _disposed = false;

  var data;

  ViewState _state = ViewState.Idle;

  ViewState get state => _state;

  void setState(ViewState viewState) {
    _state = viewState;
    notifyListeners();
  }

  initData() async {
    refresh();
  }

  refresh() async {
    setState(ViewState.Busy);
    // print(state);
    data = await loadData();
    // print(data == null ? "data is null in BaseModel" : data);

    // 返回的是 response.data
    if (data != null) {
      setState(ViewState.Idle);
    }
    print(state);
  }

  //继承BaseModel的时候复写这个方法
  Future loadData();

  @override
  void notifyListeners() {
    if (!_disposed) {
      super.notifyListeners();
    }
  }

  @override
  void dispose() {
    _disposed = true;
    // debugPrint('view_state_model dispose -->$runtimeType');
    super.dispose();
  }
}
