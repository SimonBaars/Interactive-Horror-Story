import 'package:flutter/material.dart';

import 'model/story.dart';
import 'package:go_router/go_router.dart';

class EndingScreen extends StatelessWidget {
  EndingScreen(this.story, this.ending);

  // Define some constants for the statistics and buttons
  final Story story;
  final int ending;
  final int segmentsCompleted = 72;
  final String restartStory = 'Restart story';
  final String continuePath = 'Continue unfinished path';
  final String backToMenu = 'Back to main menu';

  // Define a breakpoint for switching between mobile and desktop layout
  static const double breakpoint = 800;

  @override
  Widget build(BuildContext context) {
    // Use MediaQuery to get the device size and orientation
    var deviceOrientation = MediaQuery.of(context).orientation;

    // Use LayoutBuilder to get the constraints of the parent widget
    return LayoutBuilder(
      builder: (context, constraints) {
        // If the width is greater than the breakpoint, use a desktop layout
        if (constraints.maxWidth > breakpoint) {
          return Scaffold(
            appBar: AppBar(
              title: Text('You found an ending'),
            ),
            body: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: _buildStatistics(), // Build the statistics widget
                ),
                Expanded(
                  flex: 3,
                  child: _buildButtons(context), // Build the buttons widget
                ),
              ],
            ),
          );
        } else {
          // Otherwise, use a mobile layout
          return Scaffold(
            appBar: AppBar(
              title: Text('You found an ending'),
            ),
            body: Column(
              children: [
                Expanded(
                  flex: 2,
                  child: _buildStatistics(), // Build the statistics widget
                ),
                Expanded(
                  flex: 3,
                  child: _buildButtons(context, deviceOrientation),
                ),
              ],
            ),
          );
        }
      },
    );
  }

// A helper method to build the statistics widget with colons and bold labels
  Widget _buildStatistics() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RichText(
            textScaleFactor: 2.0,
            // Use RichText to style different parts of text
            text: TextSpan(
                // Use TextSpan to combine different text styles
                style: TextStyle(
                    color: Colors.black), // Use default text style for parent
                children: [
                  TextSpan(
                      text: 'Ending number:',
                      style: TextStyle(
                          fontWeight:
                              FontWeight.bold)), // Use bold style for label
                  TextSpan(text: ' $ending'), // Use normal style for metric
                ]),
          ),
          RichText(
            textScaleFactor: 2.0,
            // Repeat for other statistics
            text: TextSpan(
                // Use TextSpan to combine different text styles
                style: TextStyle(color: Colors.black),
                children: [
                  TextSpan(
                      text: 'Segments discovered:',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  TextSpan(text: ' $segmentsCompleted/${story.size}'),
                ]),
          ),
          RichText(
            textScaleFactor: 2.0,
            text: TextSpan(style: TextStyle(color: Colors.black), children: [
              TextSpan(
                  text: 'Completion:',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              TextSpan(
                  text: ' ' +
                      ((segmentsCompleted / story.endings) * 100)
                          .toStringAsFixed(1)),
            ]),
          ),
        ],
      ),
    );
  }

// A helper method to build the buttons widget with an optional orientation parameter and bigger size
  Widget _buildButtons(BuildContext context, [Orientation? orientation]) {
    return Padding(
        padding: EdgeInsets.all(16),
        child: Center(
          child: orientation ==
                  Orientation
                      .landscape // If landscape orientation, use a row of buttons
              ? Row(
                  mainAxisAlignment: MainAxisAlignment
                      .spaceEvenly, // Space out the buttons evenly
                  crossAxisAlignment: // Add this line to stretch buttons vertically
                      CrossAxisAlignment.stretch, // Stretch buttons vertically
                  children: _buildButtonList(
                      context), // Use a helper method to get a list of buttons with bigger size
                )
              : Column(
                  // Otherwise, use a column of buttons
                  mainAxisAlignment: MainAxisAlignment
                      .spaceEvenly, // Space out the buttons evenly
                  crossAxisAlignment: // Add this line to stretch buttons horizontally
                      CrossAxisAlignment
                          .stretch, // Stretch buttons horizontally
                  children: _buildButtonList(
                      context), // Use a helper method to get a list of buttons with bigger size
                ),
        ));
  }

// A helper method to get a list of buttons with different colors and texts and bigger size
  List<Widget> _buildButtonList(BuildContext context) {
    return [
      SizedBox(
        // Wrap each button with a SizedBox to control its height and width
        height: 60, // Increase the height to 60
        width: 200, // Increase the width to 200
        child: ElevatedButton(
          // A button for restarting story
          onPressed: () {
            context.go('/' + story.name + "/" + story.start + "/0");
          }, // Add your logic here
          style: ElevatedButton.styleFrom(
              primary: Color.fromARGB(
                  255, 137, 219, 90)), // Use red color for this button
          child: Text(restartStory,
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold)), // Increase the font size to 20
        ),
      ),
      SizedBox(
        // Repeat for other buttons
        height: 60,
        width: 200,
        child: ElevatedButton(
          // A button for continuing from unfinished path
          onPressed: () {}, // Add your logic here
          style: ElevatedButton.styleFrom(
              primary: Color.fromARGB(
                  255, 111, 173, 253)), // Use green color for this button
          child: Text(continuePath,
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold)), // Increase the font size to 20
        ),
      ),
      SizedBox(
        // Repeat for other buttons
        height: 60,
        width: 200,
        child: ElevatedButton(
          // A button for going back to main menu
          onPressed: () {
            context.go('/');
          }, // Add your logic here
          style: ElevatedButton.styleFrom(
              primary: Color.fromARGB(
                  255, 255, 111, 111)), // Use blue color for this button
          child: Text(backToMenu,
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold)), // Increase the font size to 20
        ),
      )
    ];
  }
}
