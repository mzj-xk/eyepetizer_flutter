import 'package:eyepetizer_flutter/routes/tabbarview/notify/interaction_page.dart';
import 'package:eyepetizer_flutter/routes/tabbarview/notify/message_page.dart';
import 'package:eyepetizer_flutter/routes/tabbarview/notify/push_page.dart';
import 'package:flutter/material.dart';

class NotifyPage extends StatefulWidget {
  @override
  _NotifyPageState createState() => _NotifyPageState();
}

class _NotifyPageState extends State<NotifyPage>
    with AutomaticKeepAliveClientMixin {
  List<String> tabs = ["推送", "互动", "私信"];

  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return DefaultTabController(
        length: tabs.length,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            centerTitle: true,
            actions: [
              Icon(
                Icons.search,
                color: Colors.grey,
              )
            ],
            title: TabBar(
              labelPadding: EdgeInsets.only(left: 25, right: 25),
              indicatorColor: Colors.black87,
              indicatorSize: TabBarIndicatorSize.label,
              unselectedLabelColor: Colors.grey,
              labelColor: Colors.black87,
              isScrollable: true,
              tabs: List.generate(
                tabs.length,
                (index) => Tab(
                  text: tabs[index],
                ),
              ),
            ),
          ),
          body: TabBarView(
            children: [
              PushPage(),
              InteractionPage(),
              MessagePage(),
            ],
          ),
        ));
  }
}
