// 社区 => 关注
import 'package:eyepetizer_flutter/viewmodels/follow_view_model.dart';
import 'package:eyepetizer_flutter/widget/provider_widget.dart';
import 'package:flutter/material.dart';

class CommunityFollowPage extends StatefulWidget {
  @override
  _CommunityFollowPageState createState() => _CommunityFollowPageState();
}

class _CommunityFollowPageState extends State<CommunityFollowPage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: ProviderWidget<FollowViewModel>(
        model: FollowViewModel(),
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
                        print("listview count" + model.list.length.toString());
                        if (model.controller.position.pixels ==
                            model.controller.position.maxScrollExtent) {
                          print("到达底部");
                          model.pull();
                        }
                      }),
                    children: model.list),
              ),
      ),
    );
  }
}
