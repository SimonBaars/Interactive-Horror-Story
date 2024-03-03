import 'dart:async';
import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;

import '../model/story_part.dart';
import '../model/image_urls.dart';

class Storage {
  static Future<StoryPart?> getStoryData(String storyId, String segmentId) async {
    try {
      final pathReference = storyId + "/story/" + segmentId + ".json";
      final data = await rootBundle.loadString(pathReference);
      final dynamic jsonData = jsonDecode(data);
      final ImageUrls? imageUrls = getImageUrls(
        storyId,
        List<String>.from(jsonData["imageIds"] as List),
        List<String>.from(jsonData["optionImageIds"] as List)
      );
      if (imageUrls != null) {
        return new StoryPart(segmentId, jsonData, imageUrls);
      } else {
        print("Couldn't fetch images");
      }
    } catch (e) {
      print(e);
    }
    return null;
  }

  static ImageUrls getImageUrls(String storyId, List<String> paragraphImageIds, List<String> optionImageIds) {
    List<String> paragraphImages = extractUrls(storyId, paragraphImageIds);
    List<String> optionImages = extractUrls(storyId, optionImageIds);
    return new ImageUrls(paragraphImages, optionImages);
  }

  static List<String> extractUrls(String storyId, List<String> imageIds) {
    return imageIds.map((e) => storyId + "/images_compressed/" + e + ".png").toList();
  }
}
