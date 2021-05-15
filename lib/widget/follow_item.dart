import 'package:flutter/material.dart';

class FollowItem extends StatefulWidget {
  final String iconUrl;
  final String author;
  final String description;
  final String imageUrl;

  FollowItem({
    this.iconUrl,
    this.author,
    this.description,
    this.imageUrl,
  });
  @override
  _FollowItemState createState() => _FollowItemState();
}

class _FollowItemState extends State<FollowItem>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(15, 5, 0, 5),
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 23,
                  backgroundImage: NetworkImage(
                    widget.iconUrl,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 10),
                child: Text(
                  widget.author,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
          Container(
            margin: EdgeInsets.fromLTRB(15, 0, 15, 5),
            child: Text(
              widget.description,
              style: TextStyle(fontSize: 16),
              maxLines: 2,
            ),
          ),
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
          ),
          Container(
            margin: EdgeInsets.fromLTRB(15, 5, 15, 5),
            child: Row(
              children: [
                Icon(
                  Icons.favorite_border,
                  color: Colors.grey,
                ),
                Icon(
                  Icons.star_border,
                  color: Colors.grey,
                ),
              ],
            ),
          ),
          Divider(),
        ],
      ),
    );
  }
}
