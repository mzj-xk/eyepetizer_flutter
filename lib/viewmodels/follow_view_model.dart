import 'package:eyepetizer_flutter/model/follow_bean.dart';
import 'package:eyepetizer_flutter/service/eyepetizer_repository.dart';
import 'package:eyepetizer_flutter/viewmodels/base_view_model.dart';
import 'package:eyepetizer_flutter/widget/follow_item.dart';
import 'package:flutter/material.dart';

class FollowViewModel extends BaseViewModel {
  ScrollController controller = new ScrollController();
  var url = "http://baobab.kaiyanapp.com/api/v6/community/tab/follow";

  List<Widget> list = [];
  @override
  Future loadData() async {
    var _data = await EyepetizerRepository.fetchFollow(url);
    return _data;
  }

  void getList() {
    for (int i = 0; i < FollowBean.fromJson(data).itemList.length; i++) {
      list.add(FollowItem(
        iconUrl:
            FollowBean.fromJson(data).itemList[i].data.content.data.author.icon,
        author:
            FollowBean.fromJson(data).itemList[i].data.content.data.author.name,
        description:
            FollowBean.fromJson(data).itemList[i].data.content.data.description,
        imageUrl:
            FollowBean.fromJson(data).itemList[i].data.content.data.cover.feed,
      ));
    }
  }

  @override
  refresh() async {
    list = [];
    setState(ViewState.Busy);
    data = await loadData();
    print(state);
    if (data != null) {
      setState(ViewState.Idle);
    }
    getList();
  }

  pull() {
    url = FollowBean.fromJson(data).nextPageUrl;

    super.refresh();
    getList();
    setState(ViewState.Idle);
  }
}
