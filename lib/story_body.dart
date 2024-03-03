import 'package:consequences/404.dart';
import 'package:flutter/material.dart';
import './data/storage.dart';
import 'model/story.dart';
import 'story_pages.dart';
import 'model/story_part.dart';

class StoryBody extends StatelessWidget {
  const StoryBody(this.story, this.segment, this.paragraph);
  final Story? story;
  final String? segment;
  final String? paragraph;

  @override
  Widget build(BuildContext context) {
    if (this.story == null || this.segment == null) {
      return PageNotFound();
    }
    return FutureBuilder(
        future: Storage.getStoryData(this.story!.id, this.segment!),
        builder: (ctx, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.data == null) {
              return PageNotFound();
            }
            StoryPart segment = snapshot.data as StoryPart;
            if (paragraph != null) {
              try {
                return PageWidget(story!, segment, int.parse(paragraph!));
              } catch (e) {}
            }
            return PageWidget(story!, segment, 0);
          } else {
            return Center(child: CircularProgressIndicator());
          }
        });
  }
}
