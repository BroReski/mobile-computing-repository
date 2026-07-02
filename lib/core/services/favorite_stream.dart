import 'dart:async';

class FavoriteStream {

  static final StreamController<int>
  favoriteController =
  StreamController.broadcast();

  static void updateCount(
      int count) {

    favoriteController.add(count);
  }
}