enum ReleaseType {
  event, notice, report }

abstract class CardListenerInterface {
  likeEvent(int id, ReleaseType releaseType, bool isLiked);
  subscribeCategory(int id, ReleaseType releaseType);

  subscribeEvent(int id);
}