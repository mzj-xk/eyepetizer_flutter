import 'package:eyepetizer_flutter/routes/tabbarview/community/community_follow_page.dart';
import 'package:eyepetizer_flutter/routes/tabbarview/community/community_recommend_page.dart';
import 'package:flutter/material.dart';

class CommunityPage extends StatefulWidget {
  @override
  _CommunityPageState createState() => _CommunityPageState();
}

class _CommunityPageState extends State<CommunityPage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  List<String> tabs = ["推荐", "关注"];
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
              CommunityRecommendPage(),
              CommunityFollowPage(),
            ],
          ),
        ));
  }
}
