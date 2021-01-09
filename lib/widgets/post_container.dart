import 'package:cached_network_image/cached_network_image.dart';
import 'package:facebook_ui_clone/widgets/profile_avatar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:facebook_ui_clone/models/models.dart';
import 'package:facebook_ui_clone/config/palette.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
class PostContainer extends StatelessWidget {
  final Post post;
  const PostContainer({@required this.post});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 5.0,
      ),
      padding: EdgeInsets.symmetric(vertical: 8.0),
      color: Colors.white,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _PostHeader(post: post),
                const SizedBox(height: 4.0),
                Text(post.caption),
                post.imageUrl != null
                    ? const SizedBox.shrink()
                    : const SizedBox(height: 6.0)
              ],
            ),
          ),
          post.imageUrl != null
              ? Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: CachedNetworkImage(imageUrl: post.imageUrl),
                )
              : const SizedBox.shrink(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: _PostStats(post: post),
          ),
        ],
      ),
    );
  }
}

class _PostHeader extends StatelessWidget {
  final Post post;
  const _PostHeader({@required this.post});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ProfileAvatar(imageUrl: post.user.imageUrl),
        const SizedBox(width: 8.0),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                post.user.name,
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              Row(
                children: [
                  Text(
                    '${post.timeAgo} •',
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 12.0,
                    ),
                  ),
                  Icon(Icons.public, color: Colors.grey[600], size: 12.0),
                ],
              ),
            ],
          ),
        ),
        IconButton(
          icon: const Icon(Icons.more_horiz),
          onPressed: () => print('More'),
        ),
      ],
    );
  }
}

class _PostStats extends StatelessWidget {
  final Post post;
  _PostStats({@required this.post});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              padding: const EdgeInsets.all(4.0),
              decoration: BoxDecoration(
                color: Palette.facebookBlue,
                shape: BoxShape.circle,
              ),
              child:
                  const Icon(Icons.thumb_up, size: 10.0, color: Colors.white),
            ),
            const SizedBox(width: 4.0),
            Expanded(
              child: Text(
                '${post.likes}',
                style: TextStyle(color: Colors.grey[600]),
              ),
            ),
            Text(
              '${post.comments} Comments',
              style: TextStyle(color: Colors.grey[600]),
            ),
            const SizedBox(width: 8.0,),
            Text(
              '${post.shares} Shares',
              style: TextStyle(color: Colors.grey[600]),
            ),
          ],
        ),
        const Divider(),
        Row(
          children: [
            _PostButton(
              icon:Icon(MdiIcons.thumbUpOutline,
              color:Colors.grey[600],
              size:20.0
            ),
              label: 'Like',
              onTap:()=>print('Like')
            ),
            _PostButton(
                icon:Icon(MdiIcons.commentOutline,
                    color:Colors.grey[600],
                    size:20.0
                ),
                label: 'Comment',
                onTap:()=>print('Comment')
            ),
            _PostButton(
                icon:Icon(MdiIcons.shareOutline,
                    color:Colors.grey[600],
                    size:25.0
                ),
                label: 'Share',
                onTap:()=>print('Share')
            ),
          ],
        )
      ],
    );
  }
}


class _PostButton extends StatelessWidget {
  final Icon icon;
  final String label;
  final Function onTap;
  _PostButton({@required this.icon,@required this.label,@required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Material(
        color:Colors.white,
        child: InkWell(
          onTap:onTap,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            height:25.0,
            child:Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                icon,
                const SizedBox(width:4.0),
                Text(label),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
