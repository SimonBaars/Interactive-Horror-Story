import 'package:flutter/material.dart';
import 'model/paragraph.dart';

class StoryParagraphWidget extends StatelessWidget {
  const StoryParagraphWidget(this.paragraph, this.imageRight);
  final StoryParagraph paragraph;
  final bool imageRight;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 800) {
          final image = Container(
            margin: const EdgeInsets.all(16.0),
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: constraints.maxWidth * 0.6),
              child: Image.asset(paragraph.imageUrl, fit: BoxFit.cover),
            ),
          );
          final text = Flexible(
            flex: 1,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  paragraph.text,
                  style: TextStyle(fontSize: 24),
                  softWrap: true,
                ),
              ),
            ),
          );

          // Use Row widget for desktop layout
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: imageRight ? [text, image] : [image, text],
          );
        } else {
          // Use Column widget for mobile layout
          return SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Add some margin around the image
                Container(
                  margin: const EdgeInsets.all(16.0),
                  child: Image.asset(paragraph.imageUrl),
                ),
                // Add some padding around the text
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    paragraph.text,
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ],
            ),
          );
        }
      },
    );
  }
}
