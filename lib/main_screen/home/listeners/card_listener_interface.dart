enum ReleaseType {
  event,
  advertisement,
}
abstract class CardListenerInterface {
  likeEvent(int id, ReleaseType releaseType);
  subscribeCategory(int id, ReleaseType releaseType);
}