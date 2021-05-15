import 'package:eyepetizer_flutter/routes/page/community_page.dart';
import 'package:eyepetizer_flutter/routes/page/home_page.dart';
import 'package:eyepetizer_flutter/routes/page/login_page.dart';
import 'package:eyepetizer_flutter/routes/page/mine_page.dart';
import 'package:eyepetizer_flutter/routes/page/notify_page.dart';
import 'package:eyepetizer_flutter/viewmodels/tab_navigator_view_model.dart';
import 'package:eyepetizer_flutter/widget/provider_widget.dart';
import 'package:flutter/material.dart';

List<Widget> pages = [
  HomePage(),
  CommunityPage(),
  LoginPage(),
  NotifyPage(),
  MinePage(),
];

class TabNavigator extends StatefulWidget {
  @override
  _TabNavigatorState createState() => _TabNavigatorState();
}

class _TabNavigatorState extends State<TabNavigator> {
  var _pageController = PageController();
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        itemBuilder: (ctx, index) => pages[index],
        itemCount: pages.length,
        controller: _pageController,
      ),
      bottomNavigationBar: Container(
        child: ProviderWidget<TabNavigatorViewModel>(
          model: TabNavigatorViewModel(),
          onModelReady: (model) => model.initData(),
          builder: (context, model, child) => BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            fixedColor: Colors.grey, //选中时字体的颜色
            iconSize: 20.0,
            currentIndex: _selectedIndex,
            onTap: (index) {
              _pageController.jumpToPage(index);
              model.onClick(index);
            },
            items: [
              BottomNavigationBarItem(
                  label: "首页",
                  icon: Image.asset(
                    model.buttonState[0]
                        ? model.onClickIcons[0]
                        : model.icons[0],
                    width: 20,
                    height: 20,
                  )),
              BottomNavigationBarItem(
                  label: "社区",
                  icon: Image.asset(
                    model.buttonState[1]
                        ? model.onClickIcons[1]
                        : model.icons[1],
                    width: 20,
                    height: 20,
                  )),
              BottomNavigationBarItem(
                  label: "",
                  icon: Image.asset(
                    model.buttonState[2]
                        ? model.onClickIcons[2]
                        : model.icons[2],
                    width: 30,
                    height: 30,
                  )),
              BottomNavigationBarItem(
                  label: "通知",
                  icon: Image.asset(
                    model.buttonState[3]
                        ? model.onClickIcons[3]
                        : model.icons[3],
                    width: 20,
                    height: 20,
                  )),
              BottomNavigationBarItem(
                  label: "我的",
                  icon: Image.asset(
                    model.buttonState[4]
                        ? model.onClickIcons[4]
                        : model.icons[4],
                    width: 20,
                    height: 20,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
