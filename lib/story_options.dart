import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'model/option.dart';
import 'model/story.dart';

class StoryOptionsWidget extends StatelessWidget {
  const StoryOptionsWidget(this.story, this.options);
  final Story story;
  final List<StoryOption> options;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Choose your path:")),
      ),
      body: SingleChildScrollView(
        // Use SingleChildScrollView to make it scrollable
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Center(
            // Use Center to center the Wrap widget
            child: Wrap(
              // Use Wrap instead of GridView.builder
              direction: Axis.horizontal, // Set direction to horizontal
              alignment: WrapAlignment.center, // Set alignment to center
              spacing: 20, // Add some horizontal spacing between items
              runSpacing: 20, // Add some vertical spacing between rows/columns
              children: options
                  .map((option) => _buildOptionCard(context, option))
                  .toList(), // Map each option to a card widget
            ),
          ),
        ),
      ),
    );
  }

// A helper method to build each option card
  Widget _buildOptionCard(BuildContext context, StoryOption option) {
    return Container(
      // Use Container to set constraints
      constraints: BoxConstraints(
        // Use BoxConstraints to specify maxWidth
        maxWidth: 300, // Set maxWidth to 200
      ),
      child: Card(
        child: InkWell(
          onTap: () => _showPopup(context, option),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipRRect(
                // Use ClipRRect to clip the image
                borderRadius: BorderRadius.only(
                  // Use BorderRadius.only to make only top corners rounded
                  topLeft: Radius.circular(8), // Set topLeft radius to 8
                  topRight: Radius.circular(8), // Set topRight radius to 8
                ),
                child: Image.network(option.imageUrl),
              ),
              Padding(
                padding: EdgeInsets.all(8),
                child: Text(
                  option.name,
                  style: TextStyle(fontSize: 24),
                  softWrap: true,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

// A helper method to show popup dialog
  void _showPopup(BuildContext context, StoryOption option) {
    showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(option.name),
          content: SingleChildScrollView(
            // Use SingleChildScrollView to make it scrollable
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  // Use Container to set constraints
                  constraints: BoxConstraints(
                    // Use BoxConstraints to specify maxWidth
                    maxWidth: 400, // Set maxWidth to 200
                  ),
                  child: Image.network(option.imageUrl),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 8),
                  child:
                      Text(option.description, style: TextStyle(fontSize: 18)),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
                onPressed: () => Navigator.pop(context), child: Text('Back')),
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  context
                      .go('/' + story.name + "/" + option.destinationId + "/0");
                },
                child: Text('Choose this option')),
          ],
        );
      },
    );
  }
}
