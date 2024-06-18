enum ReleaseType { event, notice, report, eventGroup }

abstract class CardListenerInterface {
  likeEvent(int id, bool isLiked);
  subscribeCategory(int id, ReleaseType releaseType);

  subscribeEvent(int id);
}