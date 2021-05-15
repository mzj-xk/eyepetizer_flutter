class PushBean {
  List<MessageList> messageList;
  int updateTime;
  String nextPageUrl;

  PushBean({this.messageList, this.updateTime, this.nextPageUrl});

  PushBean.fromJson(Map<String, dynamic> json) {
    if (json['messageList'] != null) {
      messageList = new List<MessageList>();
      json['messageList'].forEach((v) {
        messageList.add(new MessageList.fromJson(v));
      });
    }
    updateTime = json['updateTime'];
    nextPageUrl = json['nextPageUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.messageList != null) {
      data['messageList'] = this.messageList.map((v) => v.toJson()).toList();
    }
    data['updateTime'] = this.updateTime;
    data['nextPageUrl'] = this.nextPageUrl;
    return data;
  }
}

class MessageList {
  int id;
  String title;
  String content;
  int date;
  String actionUrl;
  String icon;
  bool viewed;
  bool ifPush;
  int pushStatus;
  Null uid;

  MessageList(
      {this.id,
      this.title,
      this.content,
      this.date,
      this.actionUrl,
      this.icon,
      this.viewed,
      this.ifPush,
      this.pushStatus,
      this.uid});

  MessageList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    content = json['content'];
    date = json['date'];
    actionUrl = json['actionUrl'];
    icon = json['icon'];
    viewed = json['viewed'];
    ifPush = json['ifPush'];
    pushStatus = json['pushStatus'];
    uid = json['uid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['content'] = this.content;
    data['date'] = this.date;
    data['actionUrl'] = this.actionUrl;
    data['icon'] = this.icon;
    data['viewed'] = this.viewed;
    data['ifPush'] = this.ifPush;
    data['pushStatus'] = this.pushStatus;
    data['uid'] = this.uid;
    return data;
  }
}
