import 'package:flutter/material.dart';
import './story_body.dart';
import 'model/story.dart';

class StoryScreen extends StatelessWidget {
  const StoryScreen(this.story, this.segment, this.paragraph);
  final Story? story;
  final String? segment;
  final String? paragraph;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              icon: const Icon(Icons.person),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute<ProfileScreen>(
                    builder: (context) => ProfileScreen(
                      appBar: AppBar(
                        title: const Text('User Profile'),
                      ),
                      actions: [
                        SignedOutAction((context) {
                          Navigator.of(context).pop();
                        })
                      ],
                      children: [
                        const Divider(),
                        Padding(
                          padding: const EdgeInsets.all(2),
                          child: Image.asset('flutterfire_300x.png', scale: 1),
                        ),
                        const Divider(),
                      ],
                    ),
                  ),
                );
              },
            )
          ],
          automaticallyImplyLeading: false,
        ),
        body: StoryBody(story, segment, paragraph));
  }
}
