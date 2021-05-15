import 'package:eyepetizer_flutter/service/eyepetizer_repository.dart';
import 'package:eyepetizer_flutter/viewmodels/base_view_model.dart';
import 'package:eyepetizer_flutter/widget/daily_item.dart';
import 'package:flutter/material.dart';

class DailyViewModel extends BaseViewModel {
  ScrollController controller = new ScrollController();
  List<Widget> item;
  String url = "http://baobab.kaiyanapp.com/api/v2/feed?num=0";
  @override
  Future loadData() async {
    var _data = await EyepetizerRepository.fetchDaily(url);
    // 更新 url

    return _data;
  }

  @override
  refresh() async {
    item = [
      Container(
        margin: EdgeInsets.fromLTRB(15, 10, 0, 10),
        child: Text(
          "今日开眼精选",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
        ),
      ),
    ];
    setState(ViewState.Busy);
    data = await loadData();
    print(state);
    if (data != null) {
      setState(ViewState.Idle);
    }
    print(state);
    _list(data);
    print(item.length);
    // return super.refresh();
  }

  void pull() {
    url = data.nextPageUrl;

    super.refresh();

    _list(data);
    setState(ViewState.Idle);
    print(item.length);
  }

  void _list(data) {
    // item.add(
    //   Container(
    //     margin: EdgeInsets.fromLTRB(15, 10, 0, 10),
    //     child: Text(
    //       "今日开眼精选",
    //       style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
    //     ),
    //   ),
    // );

    for (int i = 1; i < data.issueList[0].itemList.length; i++) {
      item.add(DailyItem(
        imageUrl: data.issueList[0].itemList[i].data.cover.feed,
        iconUrl: data.issueList[0].itemList[i].data.author.icon,
        title: data.issueList[0].itemList[i].data.title,
        author: data.issueList[0].itemList[i].data.author.name,
        category: data.issueList[0].itemList[i].data.category,
        duration: data.issueList[0].itemList[i].data.duration,
      ));
    }
    // item.add(Center(
    //   child: Text("上拉加载更多"),
    // ));
  }
}
