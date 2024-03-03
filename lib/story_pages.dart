import 'package:consequences/story_options.dart';
import 'package:flutter/material.dart';

import 'model/story.dart';
import 'model/story_part.dart';
import 'story_ending.dart';
import 'story_paragraph.dart';

// Define a class for _Page widget
class PageWidget extends StatelessWidget {
  final int index;
  final StoryPart segment;
  final Story story;

  const PageWidget(this.story, this.segment,
      this.index); // Pass it as a parameter to the widget

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: segment.paragraphs.length + 1,
      initialIndex: index,
      child: Builder(builder: (BuildContext context2) {
        return Scaffold(
          appBar: AppBar(
            title: Text(segment.name),
          ),
          body: SizedBox.expand(
            child: TabBarView(
              children: [
                for (var i = 0; i < segment.paragraphs.length; i++)
                  Center(
                    child:
                        StoryParagraphWidget(segment.paragraphs[i], i % 2 == 0),
                  ),
                segment.options.length > 0
                    ? StoryOptionsWidget(story, segment.options)
                    : EndingScreen(story, segment.ending),
              ],
            ),
          ),
          bottomNavigationBar: BottomAppBar(
            child: StatefulBuilder(builder: (context3, setState) {
              final dtc = DefaultTabController.of(context2);
              String path = '/#/' + story.name + '/' + segment.id + '/';
              return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                        onPressed: dtc.index == 0
                            ? null
                            : (() {
                                DefaultTabController.of(context2)
                                    .animateTo(dtc.index - 1);
                                setState(() {});
                              }),
                        child: Text('Prev')),
                    SizedBox(
                      height: (MediaQuery.of(context).size.height * 0.05),
                      child: TabPageSelector(),
                    ),
                    ElevatedButton(
                        onPressed: dtc.index == dtc.length - 1
                            ? null
                            : (() {
                                dtc.animateTo(dtc.index + 1);
                                setState(() {});
                              }),
                        child: Text('Next')),
                  ]);
            }),
          ),
        );
      }),
    );
  }
}
