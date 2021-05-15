import 'package:eyepetizer_flutter/viewmodels/daily_view_model.dart';
import 'package:eyepetizer_flutter/widget/daily_item.dart';
import 'package:eyepetizer_flutter/widget/provider_widget.dart';
import 'package:flutter/material.dart';

class HomeDailyPage extends StatefulWidget {
  @override
  _HomeDailyPageState createState() => _HomeDailyPageState();
}

class _HomeDailyPageState extends State<HomeDailyPage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: ProviderWidget<DailyViewModel>(
        model: DailyViewModel(),
        onModelReady: (model) => model.initData(),
        builder: (context, model, child) => model.data == null
            ? Text("")
            : RefreshIndicator(
                onRefresh: () async {
                  await model.refresh();
                },
                child: ListView(
                  controller: model.controller
                    ..addListener(() {
                      // print(model.controller.position.pixels);
                      print("listview count" + model.item.length.toString());
                      if (model.controller.position.pixels ==
                          model.controller.position.maxScrollExtent) {
                        print("到达底部");
                        model.pull();
                      }
                    }),
                  children: model.item,
                ),
              ),
      ),
    );
  }

  List<Widget> _list(data) {
    List<Widget> _list = [
      Container(
        margin: EdgeInsets.fromLTRB(15, 10, 0, 10),
        child: Text(
          "今日开眼精选",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
        ),
      )
    ]; // 没有[]无法用add

    for (int i = 1; i < data.issueList[0].itemList.length; i++) {
      _list.add(DailyItem(
        imageUrl: data.issueList[0].itemList[i].data.cover.feed,
        iconUrl: data.issueList[0].itemList[i].data.author.icon,
        title: data.issueList[0].itemList[i].data.title,
        author: data.issueList[0].itemList[i].data.author.name,
        category: data.issueList[0].itemList[i].data.category,
        duration: data.issueList[0].itemList[i].data.duration,
      ));
    }

    return _list;
  }
}
