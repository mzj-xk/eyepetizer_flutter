import 'package:eyepetizer_flutter/service/eyepetizer_repository.dart';
import 'package:eyepetizer_flutter/viewmodels/base_view_model.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class PushViewModel extends BaseViewModel {
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  RefreshController get refreshController => _refreshController;
  @override
  Future loadData() async {
    return EyepetizerRepository.fetchPush();
  }
}
