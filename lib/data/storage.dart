import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';
import 'package:firebase_storage/firebase_storage.dart';

import '../model/story_part.dart';
import '../model/image_urls.dart';

class Storage {
  static Future<StoryPart?> getStoryData(
      String storyId, String segmentId) async {
    try {
      final storageRef = FirebaseStorage.instance.ref();
      final pathReference =
          storageRef.child("/" + storyId + "/story/" + segmentId + ".json");

      const oneMegabyte = 1024 * 1024;
      final Uint8List? data = await pathReference.getData(oneMegabyte);
      if (data != null) {
        final dynamic jsonData = jsonDecode(utf8.decode(data));
        final ImageUrls? imageUrls = await getImageUrls(
            storyId,
            List<String>.from(jsonData["imageIds"] as List),
            List<String>.from(jsonData["optionImageIds"] as List));
        if (imageUrls != null) {
          return new StoryPart(segmentId, jsonData, imageUrls);
        } else {
          print("Couldn't fetch images");
        }
      } else {
        print("Unexpected data");
      }
    } catch (e) {
      print(e);
    }
    return null;
  }

  static Future<ImageUrls?> getImageUrls(String storyId,
      List<String> paragraphImageIds, List<String> optionImageIds) async {
    List<String> paragraphImages =
        await extractUrls(storyId, paragraphImageIds);
    List<String> optionImages = await extractUrls(storyId, optionImageIds);
    return new ImageUrls(paragraphImages, optionImages);
  }

  static Future<List<String>> extractUrls(
      String storyId, List<String> imageIds) async {
    final storageRef = FirebaseStorage.instance.ref();
    final images = imageIds
        .map((e) => storageRef
            .child("/" + storyId + "/images_compressed/" + e + ".png"))
        .map((e) async => await e.getDownloadURL());
    return Future.wait(images);
  }
}
