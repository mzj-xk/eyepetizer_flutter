import 'package:eyepetizer_flutter/service/eyepetizer_repository.dart';
import 'package:eyepetizer_flutter/viewmodels/base_view_model.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class DisoveryViewModel extends BaseViewModel {
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  var sortData;

  RefreshController get refreshController => _refreshController;
  @override
  Future loadData() async {
    return EyepetizerRepository.fetchDiscovery();
  }

  // @override
  // initData() {
  //   sortData = EyepetizerRepository.fetchSort();
  //   return super.initData();
  // }
  @override
  refresh() async {
    sortData = await EyepetizerRepository.fetchSort();
    // print(state);
    data = await loadData();
    // print(data == null ? "data is null in BaseModel" : data);

    // 返回的是 response.data
    if (data != null && sortData != null) {
      setState(ViewState.Idle);
    }

    // print(state);
  }
}
