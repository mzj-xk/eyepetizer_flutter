class DailyBean {
  List<IssueList> issueList;
  String nextPageUrl;
  int nextPublishTime;
  String newestIssueType;

  DailyBean({
    this.issueList,
    this.nextPageUrl,
    this.nextPublishTime,
    this.newestIssueType,
  });

  DailyBean.fromJson(Map<String, dynamic> json) {
    if (json['issueList'] != null) {
      issueList = new List<IssueList>();
      json['issueList'].forEach((v) {
        issueList.add(new IssueList.fromJson(v));
      });
    }
    nextPageUrl = json['nextPageUrl'];
    nextPublishTime = json['nextPublishTime'];
    newestIssueType = json['newestIssueType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.issueList != null) {
      data['issueList'] = this.issueList.map((v) => v.toJson()).toList();
    }
    data['nextPageUrl'] = this.nextPageUrl;
    data['nextPublishTime'] = this.nextPublishTime;
    data['newestIssueType'] = this.newestIssueType;
    return data;
  }
}

class IssueList {
  int releaseTime;
  String type;
  int date;
  int publishTime;
  List<ItemList> itemList;
  int count;

  IssueList(
      {this.releaseTime,
      this.type,
      this.date,
      this.publishTime,
      this.itemList,
      this.count});

  IssueList.fromJson(Map<String, dynamic> json) {
    releaseTime = json['releaseTime'];
    type = json['type'];
    date = json['date'];
    publishTime = json['publishTime'];
    if (json['itemList'] != null) {
      itemList = new List<ItemList>();
      json['itemList'].forEach((v) {
        itemList.add(new ItemList.fromJson(v));
      });
    }
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['releaseTime'] = this.releaseTime;
    data['type'] = this.type;
    data['date'] = this.date;
    data['publishTime'] = this.publishTime;
    if (this.itemList != null) {
      data['itemList'] = this.itemList.map((v) => v.toJson()).toList();
    }
    data['count'] = this.count;
    return data;
  }
}

class ItemList {
  String type;
  Data data;

  int id;
  int adIndex;

  ItemList(
      {this.type,
      this.data,
      // this.trackingData,
      // this.tag,
      this.id,
      this.adIndex});

  ItemList.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    // trackingData = json['trackingData'];
    // tag = json['tag'];
    id = json['id'];
    adIndex = json['adIndex'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    data['id'] = this.id;
    data['adIndex'] = this.adIndex;
    return data;
  }
}

class Data {
  String dataType;
  int id;
  String title;
  String description;
  String image;
  String actionUrl;
  bool shade;
  bool autoPlay;
  String library;
  List<Tags> tags;
  Consumption consumption;
  String resourceType;
  Provider provider;
  String category;
  Author author;
  Cover cover;
  String playUrl;
  int duration;
  WebUrl webUrl;
  int releaseTime;
  List<PlayInfo> playInfo;
  bool ad;
  String type;
  String remark;
  bool ifLimitVideo;
  int searchWeight;
  VideoPosterBean videoPosterBean;
  int idx;
  int date;
  String descriptionEditor;
  bool collected;
  bool reallyCollected;
  bool played;

  Data({
    this.dataType,
    this.id,
    this.title,
    this.description,
    this.image,
    this.actionUrl,
    this.shade,
    this.autoPlay,
    this.library,
    this.tags,
    this.consumption,
    this.resourceType,
    this.provider,
    this.category,
    this.author,
    this.cover,
    this.playUrl,
    this.duration,
    this.webUrl,
    this.releaseTime,
    this.playInfo,
    this.ad,
    this.type,
    this.remark,
    this.ifLimitVideo,
    this.searchWeight,
    this.videoPosterBean,
    this.idx,
    this.date,
    this.descriptionEditor,
    this.collected,
    this.reallyCollected,
    this.played,
  });

  Data.fromJson(Map<String, dynamic> json) {
    dataType = json['dataType'];
    id = json['id'];
    title = json['title'];
    description = json['description'];
    image = json['image'];
    actionUrl = json['actionUrl'];

    shade = json['shade'];

    autoPlay = json['autoPlay'];
    library = json['library'];
    if (json['tags'] != null) {
      tags = new List<Tags>();
      json['tags'].forEach((v) {
        tags.add(new Tags.fromJson(v));
      });
    }
    consumption = json['consumption'] != null
        ? new Consumption.fromJson(json['consumption'])
        : null;
    resourceType = json['resourceType'];
    provider = json['provider'] != null
        ? new Provider.fromJson(json['provider'])
        : null;
    category = json['category'];
    author =
        json['author'] != null ? new Author.fromJson(json['author']) : null;
    cover = json['cover'] != null ? new Cover.fromJson(json['cover']) : null;
    playUrl = json['playUrl'];
    duration = json['duration'];
    webUrl =
        json['webUrl'] != null ? new WebUrl.fromJson(json['webUrl']) : null;
    releaseTime = json['releaseTime'];
    if (json['playInfo'] != null) {
      playInfo = new List<PlayInfo>();
      json['playInfo'].forEach((v) {
        playInfo.add(new PlayInfo.fromJson(v));
      });
    }
    ad = json['ad'];
    type = json['type'];
    remark = json['remark'];
    ifLimitVideo = json['ifLimitVideo'];
    searchWeight = json['searchWeight'];
    videoPosterBean = json['videoPosterBean'] != null
        ? new VideoPosterBean.fromJson(json['videoPosterBean'])
        : null;
    idx = json['idx'];
    date = json['date'];
    descriptionEditor = json['descriptionEditor'];
    collected = json['collected'];
    reallyCollected = json['reallyCollected'];
    played = json['played'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['dataType'] = this.dataType;
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    data['image'] = this.image;
    data['actionUrl'] = this.actionUrl;

    data['shade'] = this.shade;

    data['autoPlay'] = this.autoPlay;
    data['library'] = this.library;
    if (this.tags != null) {
      data['tags'] = this.tags.map((v) => v.toJson()).toList();
    }
    if (this.consumption != null) {
      data['consumption'] = this.consumption.toJson();
    }
    data['resourceType'] = this.resourceType;
    if (this.provider != null) {
      data['provider'] = this.provider.toJson();
    }
    data['category'] = this.category;
    if (this.author != null) {
      data['author'] = this.author.toJson();
    }
    if (this.cover != null) {
      data['cover'] = this.cover.toJson();
    }
    data['playUrl'] = this.playUrl;
    data['duration'] = this.duration;
    if (this.webUrl != null) {
      data['webUrl'] = this.webUrl.toJson();
    }
    data['releaseTime'] = this.releaseTime;
    if (this.playInfo != null) {
      data['playInfo'] = this.playInfo.map((v) => v.toJson()).toList();
    }
    data['ad'] = this.ad;
    data['type'] = this.type;
    data['remark'] = this.remark;
    data['ifLimitVideo'] = this.ifLimitVideo;
    data['searchWeight'] = this.searchWeight;
    if (this.videoPosterBean != null) {
      data['videoPosterBean'] = this.videoPosterBean.toJson();
    }
    data['idx'] = this.idx;
    data['date'] = this.date;
    data['descriptionEditor'] = this.descriptionEditor;
    data['collected'] = this.collected;
    data['reallyCollected'] = this.reallyCollected;
    data['played'] = this.played;

    return data;
  }
}

class Tags {
  int id;
  String name;
  String actionUrl;
  String desc;
  String bgPicture;
  String headerImage;
  String tagRecType;
  bool haveReward;
  bool ifNewest;
  int newestEndTime;
  int communityIndex;

  Tags(
      {this.id,
      this.name,
      this.actionUrl,
      this.desc,
      this.bgPicture,
      this.headerImage,
      this.tagRecType,
      this.haveReward,
      this.ifNewest,
      this.newestEndTime,
      this.communityIndex});

  Tags.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    actionUrl = json['actionUrl'];
    desc = json['desc'];
    bgPicture = json['bgPicture'];
    headerImage = json['headerImage'];
    tagRecType = json['tagRecType'];
    haveReward = json['haveReward'];
    ifNewest = json['ifNewest'];
    newestEndTime = json['newestEndTime'];
    communityIndex = json['communityIndex'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['actionUrl'] = this.actionUrl;
    data['desc'] = this.desc;
    data['bgPicture'] = this.bgPicture;
    data['headerImage'] = this.headerImage;
    data['tagRecType'] = this.tagRecType;
    data['haveReward'] = this.haveReward;
    data['ifNewest'] = this.ifNewest;
    data['newestEndTime'] = this.newestEndTime;
    data['communityIndex'] = this.communityIndex;
    return data;
  }
}

class Consumption {
  int collectionCount;
  int shareCount;
  int replyCount;
  int realCollectionCount;

  Consumption(
      {this.collectionCount,
      this.shareCount,
      this.replyCount,
      this.realCollectionCount});

  Consumption.fromJson(Map<String, dynamic> json) {
    collectionCount = json['collectionCount'];
    shareCount = json['shareCount'];
    replyCount = json['replyCount'];
    realCollectionCount = json['realCollectionCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['collectionCount'] = this.collectionCount;
    data['shareCount'] = this.shareCount;
    data['replyCount'] = this.replyCount;
    data['realCollectionCount'] = this.realCollectionCount;
    return data;
  }
}

class Provider {
  String name;
  String alias;
  String icon;

  Provider({this.name, this.alias, this.icon});

  Provider.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    alias = json['alias'];
    icon = json['icon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['alias'] = this.alias;
    data['icon'] = this.icon;
    return data;
  }
}

class Author {
  int id;
  String icon;
  String name;
  String description;
  String link;
  int latestReleaseTime;
  int videoNum;
  Follow follow;
  Shield shield;
  int approvedNotReadyVideoCount;
  bool ifPgc;
  int recSort;
  bool expert;

  Author(
      {this.id,
      this.icon,
      this.name,
      this.description,
      this.link,
      this.latestReleaseTime,
      this.videoNum,
      this.follow,
      this.shield,
      this.approvedNotReadyVideoCount,
      this.ifPgc,
      this.recSort,
      this.expert});

  Author.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    icon = json['icon'];
    name = json['name'];
    description = json['description'];
    link = json['link'];
    latestReleaseTime = json['latestReleaseTime'];
    videoNum = json['videoNum'];
    follow =
        json['follow'] != null ? new Follow.fromJson(json['follow']) : null;
    shield =
        json['shield'] != null ? new Shield.fromJson(json['shield']) : null;
    approvedNotReadyVideoCount = json['approvedNotReadyVideoCount'];
    ifPgc = json['ifPgc'];
    recSort = json['recSort'];
    expert = json['expert'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['icon'] = this.icon;
    data['name'] = this.name;
    data['description'] = this.description;
    data['link'] = this.link;
    data['latestReleaseTime'] = this.latestReleaseTime;
    data['videoNum'] = this.videoNum;
    if (this.follow != null) {
      data['follow'] = this.follow.toJson();
    }
    if (this.shield != null) {
      data['shield'] = this.shield.toJson();
    }
    data['approvedNotReadyVideoCount'] = this.approvedNotReadyVideoCount;
    data['ifPgc'] = this.ifPgc;
    data['recSort'] = this.recSort;
    data['expert'] = this.expert;
    return data;
  }
}

class Follow {
  String itemType;
  int itemId;
  bool followed;

  Follow({this.itemType, this.itemId, this.followed});

  Follow.fromJson(Map<String, dynamic> json) {
    itemType = json['itemType'];
    itemId = json['itemId'];
    followed = json['followed'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['itemType'] = this.itemType;
    data['itemId'] = this.itemId;
    data['followed'] = this.followed;
    return data;
  }
}

class Shield {
  String itemType;
  int itemId;
  bool shielded;

  Shield({this.itemType, this.itemId, this.shielded});

  Shield.fromJson(Map<String, dynamic> json) {
    itemType = json['itemType'];
    itemId = json['itemId'];
    shielded = json['shielded'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['itemType'] = this.itemType;
    data['itemId'] = this.itemId;
    data['shielded'] = this.shielded;
    return data;
  }
}

class Cover {
  String feed;
  String detail;
  String blurred;
  String homepage;

  Cover({this.feed, this.detail, this.blurred, this.homepage});

  Cover.fromJson(Map<String, dynamic> json) {
    feed = json['feed'];
    detail = json['detail'];
    blurred = json['blurred'];
    homepage = json['homepage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['feed'] = this.feed;
    data['detail'] = this.detail;
    data['blurred'] = this.blurred;
    data['homepage'] = this.homepage;
    return data;
  }
}

class WebUrl {
  String raw;
  String forWeibo;

  WebUrl({this.raw, this.forWeibo});

  WebUrl.fromJson(Map<String, dynamic> json) {
    raw = json['raw'];
    forWeibo = json['forWeibo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['raw'] = this.raw;
    data['forWeibo'] = this.forWeibo;
    return data;
  }
}

class PlayInfo {
  int height;
  int width;
  List<UrlList> urlList;
  String name;
  String type;
  String url;

  PlayInfo(
      {this.height, this.width, this.urlList, this.name, this.type, this.url});

  PlayInfo.fromJson(Map<String, dynamic> json) {
    height = json['height'];
    width = json['width'];
    if (json['urlList'] != null) {
      urlList = new List<UrlList>();
      json['urlList'].forEach((v) {
        urlList.add(new UrlList.fromJson(v));
      });
    }
    name = json['name'];
    type = json['type'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['height'] = this.height;
    data['width'] = this.width;
    if (this.urlList != null) {
      data['urlList'] = this.urlList.map((v) => v.toJson()).toList();
    }
    data['name'] = this.name;
    data['type'] = this.type;
    data['url'] = this.url;
    return data;
  }
}

class UrlList {
  String name;
  String url;
  int size;

  UrlList({this.name, this.url, this.size});

  UrlList.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
    size = json['size'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['url'] = this.url;
    data['size'] = this.size;
    return data;
  }
}

class VideoPosterBean {
  double scale;
  String url;
  String fileSizeStr;

  VideoPosterBean({this.scale, this.url, this.fileSizeStr});

  VideoPosterBean.fromJson(Map<String, dynamic> json) {
    scale = json['scale'];
    url = json['url'];
    fileSizeStr = json['fileSizeStr'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['scale'] = this.scale;
    data['url'] = this.url;
    data['fileSizeStr'] = this.fileSizeStr;
    return data;
  }
}
