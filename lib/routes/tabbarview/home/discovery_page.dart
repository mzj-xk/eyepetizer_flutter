import 'package:eyepetizer_flutter/model/sort_bean.dart';
import 'package:eyepetizer_flutter/viewmodels/discovery_view_model.dart';
import 'package:eyepetizer_flutter/widget/gridview_item.dart';
import 'package:eyepetizer_flutter/widget/pageview_item.dart';
import 'package:eyepetizer_flutter/widget/provider_widget.dart';
import 'package:flutter/material.dart';
// import 'package:pull_to_refresh/pull_to_refresh.dart';

class DiscoveryPage extends StatefulWidget {
  @override
  _DiscoveryPageState createState() => _DiscoveryPageState();
}

class _DiscoveryPageState extends State<DiscoveryPage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: ProviderWidget<DisoveryViewModel>(
        model: DisoveryViewModel(),
        onModelReady: (model) => model.initData(),
        builder: (context, model, child) => model.data == null ||
                model.sortData == null // 做判空处理避免显示错误
            ? Text("")
            : RefreshIndicator(
                // controller: model.refreshController,
                // onRefresh: model.refreshController.refreshCompleted,
                onRefresh: () async {
                  await model.refresh();
                },
                child: SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.only(top: 10),
                    child: Column(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height / 4,
                          child: PageView(
                            controller: PageController(
                              initialPage: 0,
                              viewportFraction: 0.9, // 屏占比
                              keepPage: true, //  保持页码状态
                            ),
                            scrollDirection: Axis.horizontal,
                            children: model.data.itemList[0].data.itemList
                                .map<Widget>(
                                    (banner) => _bannerItem(banner.data.image))
                                .toList(),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 5, bottom: 5),
                          child: Divider(),
                        ),
                        Row(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width / 3 * 2,
                              margin: EdgeInsets.only(left: 20),
                              child: Text(
                                "热门分类",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25,
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 3),
                              child: Text(
                                "查看全部分类 >",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blueAccent,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          ],
                        ),
                        // 热门分类网格
                        Container(
                          margin: EdgeInsets.only(left: 10),
                          padding: EdgeInsets.all(10),
                          height: 300,
                          child: GridView(
                            // reverse: true,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              mainAxisSpacing: 5,
                              crossAxisSpacing: 5,
                              crossAxisCount: 2,
                            ),
                            scrollDirection: Axis.horizontal,
                            // 如果不用 => 而用 {} 时要用 return
                            children: model.sortData
                                .map<Widget>((item) => GridViewItem(
                                      SortBean.fromJson(item).bgPicture,
                                      SortBean.fromJson(item).name,
                                    ))
                                .toList(),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 5, bottom: 5),
                          child: Divider(),
                        ),
                        Row(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width / 3 * 2,
                              margin: EdgeInsets.only(left: 20),
                              child: Text(
                                "推荐主题",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25,
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 30),
                              child: Text(
                                "查看全部 >",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blueAccent,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 15, top: 10),
                          child: Column(
                            children: listSubjectItem(model.data),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
      ),
    );
  }

  // 顶部 PagevView 子组件
  //  需要解决网络图片预加载
  Widget _bannerItem(imageUrl) {
    return PageViewItem(imageUrl);
  }

  Widget _subjectItem(String imageUrl, String title, String description) {
    return Container(
      margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  image: DecorationImage(
                    image: NetworkImage(imageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width / 5 * 3,
                margin: EdgeInsets.only(left: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      description,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(5),
                // margin: EdgeInsets.only(left: 5),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 0.5),
                  borderRadius: BorderRadius.circular(3),
                ),
                child: Text(" +关注"),
              ),
            ],
          ),
          Divider(),
        ],
      ),
    );
  }

  List<Widget> listSubjectItem(data) {
    List<Widget> _list = [];
    for (var i = 0; i < data.itemList.length; i++) {
      if (data.itemList[i].data.dataType == "TagBriefCard") {
        _list.add(
          _subjectItem(data.itemList[i].data.icon, data.itemList[i].data.title,
              data.itemList[i].data.description),
        );
      }
    }
    return _list;
  }
}
