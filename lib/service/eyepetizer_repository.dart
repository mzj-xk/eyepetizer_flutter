import 'package:dio/dio.dart';
import 'package:eyepetizer_flutter/model/daily_bean.dart';
import 'package:eyepetizer_flutter/model/discovery_bean.dart';
import 'package:eyepetizer_flutter/model/push_bean.dart';

class EyepetizerRepository {
  static Dio _dio = Dio();

  //  首页-发现
  static Future fetchDiscovery() async {
    var response = await _dio
        .get("http://baobab.kaiyanapp.com/api/v7/index/tab/discovery");
    return DiscoveryBean.fromJson(response.data);
  }

  // 首页-发现-分类
  static Future fetchSort() async {
    var response =
        await _dio.get("http://baobab.kaiyanapp.com/api/v4/categories");
    // 因为返回的是纯数组所以不在这里解析
    // SortBean.from(response.data[0])
    return response.data;
  }

  //  推送
  static Future fetchPush() async {
    var response =
        await _dio.get("http://baobab.kaiyanapp.com/api/v3/messages");
    return PushBean.fromJson(response.data);
  }

  static Future fetchDaily(String url) async {
    var response = await _dio.get(url);
    return DailyBean.fromJson(response.data);
  }

  static Future fetchFollow(String url) async {
    var response = await _dio.get(url);
    return response.data;
  }
}
