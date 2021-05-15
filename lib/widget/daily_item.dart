import 'package:flutter/material.dart';

class DailyItem extends StatefulWidget {
  final String imageUrl;
  final String iconUrl;
  final String title;
  final String author;
  final String category;
  final int duration;
  DailyItem({
    this.imageUrl,
    this.iconUrl,
    this.title,
    this.author,
    this.category,
    this.duration,
  });
  @override
  _DailyItemState createState() => _DailyItemState();
}

class _DailyItemState extends State<DailyItem>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Container(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
            height: 250,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              image: DecorationImage(
                image: NetworkImage(widget.imageUrl),
                fit: BoxFit.cover,
              ),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.only(left: 15, top: 15),
                  child: Image.asset(
                    "assets/images/ic_choiceness.png",
                    width: 60,
                    height: 60,
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 270, bottom: 10),
                      padding: EdgeInsets.all(4),
                      child: Text(
                        widget.duration % 60 < 10
                            ? "${widget.duration ~/ 60}:0${widget.duration % 60}"
                            : "${widget.duration ~/ 60}:${widget.duration % 60}",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      color: Colors.black54,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Row(
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(15, 5, 0, 5),
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 23,
                  backgroundImage: NetworkImage(
                    widget.iconUrl,
                    // width: 50,
                    // height: 50,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 300,
                      child: Text(
                        widget.title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    Text(
                      widget.author + "  /   #" + widget.category,
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                child: Icon(
                  Icons.share,
                  color: Colors.black45,
                ),
              )
            ],
          ),
          Divider(),
        ],
      ),
    );
  }
}
