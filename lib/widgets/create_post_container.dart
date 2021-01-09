import 'package:flutter/material.dart';
import 'package:facebook_ui_clone/models/models.dart';
import 'package:facebook_ui_clone/widgets/widgets.dart';

class CreatePostContainer extends StatelessWidget {
  final User currentUser;
  CreatePostContainer({@required this.currentUser});
  @override
  Widget build(BuildContext context) {
    return Container(
      color:Colors.white,
        padding: const EdgeInsets.fromLTRB(12.0, 8.0, 12.0, 0.0),
        child: Column(
          children: [
            Row(
              children: [
                ProfileAvatar(imageUrl:currentUser.imageUrl),
                const SizedBox(
                  width: 8.0,
                ),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration.collapsed(
                      hintText: 'What\'s on your mind?',
                    ),
                  ),
                ),
              ],
            ),
            const Divider(
              height: 10.0,
              thickness: 0.5,
            ),
            Container(
              height:40.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FlatButton.icon(onPressed: ()=>print('Live'),
                      icon: const Icon(Icons.videocam,
                        color:Colors.red
                      ),
                      label: Text('Live')),
                  const VerticalDivider(width: 8.0,),
                  FlatButton.icon(onPressed: ()=>print('Photo'),
                      icon: const Icon(Icons.photo_library,
                          color:Colors.green
                      ),
                      label: Text('Photo')),
                  const VerticalDivider(width: 8.0,),
                  FlatButton.icon(onPressed: ()=>print('Live'),
                      icon: const Icon(Icons.video_call,
                          color:Colors.purpleAccent
                      ),
                      label: Text('Room')),
                  const VerticalDivider(width: 8.0,)
                ],
              ),
            ),
          ],
        ),
    );
  }
}
