class DiscoveryBean {
  List<ItemList> itemList;

  DiscoveryBean({this.itemList});

  DiscoveryBean.fromJson(Map<String, dynamic> json) {
    if (json['itemList'] != null) {
      itemList = new List<ItemList>();
      json['itemList'].forEach((v) {
        itemList.add(new ItemList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.itemList != null) {
      data['itemList'] = this.itemList.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ItemList {
  String type;
  Data data;

  ItemList({this.type, this.data});

  ItemList.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class Data {
  List<ItemList> itemList;
  int count;
  String type;
  String text;
  String icon;
  String iconType;
  String title;
  String description;
  String dataType;
  String image;
  String actionUrl;

  Data({
    this.itemList,
    this.count,
    this.type,
    this.text,
    this.icon,
    this.iconType,
    this.title,
    this.description,
    this.dataType,
    this.image,
    this.actionUrl,
  });

  Data.fromJson(Map<String, dynamic> json) {
    if (json['itemList'] != null) {
      itemList = new List<ItemList>();
      json['itemList'].forEach((v) {
        itemList.add(new ItemList.fromJson(v));
      });
    }
    count = json['count'];
    type = json['type'];
    text = json['text'];
    icon = json['icon'];
    iconType = json['iconType'];
    title = json['title'];
    description = json['description'];
    dataType = json['dataType'];
    image = json['image'];
    actionUrl = json['actionUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.itemList != null) {
      data['itemList'] = this.itemList.map((v) => v.toJson()).toList();
    }
    data['count'] = this.count;
    data['type'] = this.type;
    data['text'] = this.text;
    data['icon'] = this.icon;
    data['iconType'] = this.iconType;
    data['title'] = this.title;
    data['description'] = this.description;
    data['dataType'] = this.dataType;
    data['image'] = this.image;
    data['actionUrl'] = this.actionUrl;
    return data;
  }
}
