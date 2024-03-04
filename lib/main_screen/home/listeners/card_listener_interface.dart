enum ReleaseType {
  event,
  advertisement,
}
abstract class CardListenerInterface {
  likeEvent(int id, ReleaseType releaseType);
  subscribeEvent(int id, ReleaseType releaseType);
}