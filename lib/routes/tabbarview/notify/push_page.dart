import 'package:eyepetizer_flutter/viewmodels/push_view_model.dart';
import 'package:eyepetizer_flutter/widget/provider_widget.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class PushPage extends StatefulWidget {
  @override
  _PushPageState createState() => _PushPageState();
}

class _PushPageState extends State<PushPage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: ProviderWidget<PushViewModel>(
        model: PushViewModel(),
        onModelReady: (model) => model.initData(),
        builder: (context, model, child) => model.data == null
            ? Text("")
            : SmartRefresher(
                controller: model.refreshController,
                onRefresh: model.refreshController.refreshCompleted,
                child: ListView(
                  children: model.data.messageList
                      .map<Widget>(
                        (item) => _item(
                            item.title, item.date.toString(), item.content),
                      )
                      .toList(),
                ),
              ),
      ),
    );
  }

  Widget _item(title, time, content) {
    return Column(
      children: [
        Row(
          children: [
            Image.asset(
              "assets/images/eye_icon.png",
              width: 50,
              height: 50,
            ),
            Container(
              margin: EdgeInsets.only(top: 5, left: 20),
              width: MediaQuery.of(context).size.width / 4 * 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(fontSize: 30),
                  ),
                  Text(
                    time,
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    content,
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 10),
              child: Text(">"),
            )
          ],
        ),
        Divider(),
      ],
    );
  }
}
