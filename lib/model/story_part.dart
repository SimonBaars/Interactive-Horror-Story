import 'package:consequences/model/paragraph.dart';

import 'image_urls.dart';
import 'option.dart';

class StoryPart {
  final String id;
  final String name;
  final List<StoryParagraph> paragraphs;
  final List<StoryOption> options;
  final int ending;

  StoryPart(String partId, Map json, ImageUrls imageUrls)
      : this.id = partId,
        this.name = json['name'],
        this.paragraphs = getParagraphs(
            toList(json['paragraphs']), imageUrls.paragraphImages),
        this.options = getOptions(
            toList(json['optionNames']),
            toList(json['optionDescriptions']),
            toList(json['optionIds']),
            imageUrls.optionImages),
        this.ending = json['ending'] as int;

  static List<String> toList(dynamic obj) {
    return List<String>.from(obj as List);
  }

  static List<StoryParagraph> getParagraphs(
      List<String> paragraphs, List<String> paragraphImages) {
    List<StoryParagraph> pars = [];
    for (var i = 0; i < paragraphs.length; i++) {
      pars.add(new StoryParagraph(paragraphs[i], paragraphImages[i]));
    }
    return pars;
  }

  static List<StoryOption> getOptions(
      List<String> optionNames,
      List<String> optionDescriptions,
      List<String> optionIds,
      List<String> optionImages) {
    List<StoryOption> options = [];
    for (var i = 0; i < optionIds.length; i++) {
      options.add(new StoryOption(optionNames[i], optionDescriptions[i],
          optionIds[i], optionImages[i]));
    }
    return options;
  }
}
