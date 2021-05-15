import 'package:eyepetizer_flutter/routes/tabbarview/home/discovery_page.dart';
import 'package:eyepetizer_flutter/routes/tabbarview/home/daily_page.dart';
import 'package:eyepetizer_flutter/routes/tabbarview/home/recommend_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  List<String> tabs = ["发现", "推荐", "日报"];
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          leading: Icon(
            Icons.calendar_today,
            color: Colors.grey,
          ),
          actions: [Icon(Icons.search, color: Colors.grey)],
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
            DiscoveryPage(),
            HomeRecommendPage(),
            HomeDailyPage(),
          ],
        ),
      ),
    );
  }
}
