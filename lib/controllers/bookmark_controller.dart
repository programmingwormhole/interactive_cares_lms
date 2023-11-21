import 'dart:convert';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BookmarkController extends GetxController {
  RxList bookmarks = [].obs;

  void retrieveBookmarks() async {
    // Retrieve the bookmarks from shared preferences
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey('bookmarks')) {
      bookmarks.value = List<Map<String, dynamic>>.from(
        json.decode(prefs.getString('bookmarks')!),
      );
      update();
      bookmarks.refresh();
    }
  }

  void deleteBookmark(int index) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<Map<String, dynamic>> updatedBookmarks =
        List<Map<String, dynamic>>.from(
      json.decode(prefs.getString('bookmarks')!),
    );

    // Remove the bookmark at the specified index
    updatedBookmarks.removeAt(index);

    // Save the updated bookmarks
    prefs.setString('bookmarks', json.encode(updatedBookmarks));

    // Refresh the state to reflect the changes in the UI
    bookmarks.value = updatedBookmarks;
    update();
    Get.snackbar('Deleted', 'Bookmark successfully deleted');
    bookmarks.refresh();
  }
}
