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
        body: StoryBody(story, segment, paragraph));
  }
}
