abstract class MovieEvent {}

class ToggleFavorite
    extends MovieEvent {

  final int index;

  ToggleFavorite(this.index);
}