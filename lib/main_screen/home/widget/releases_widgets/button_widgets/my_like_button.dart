import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';

class MyLikeButton extends StatelessWidget {
  final int numberLikes;
  final bool isLiked;
  final int id;
  final Function(int, bool) likeEvent;

  const MyLikeButton(
      {super.key,
      required this.numberLikes,
      required this.isLiked,
      required this.id,
      required this.likeEvent});

  Future<bool> onLikeButtonTapped(bool isLiked) async {
    likeEvent(id, !isLiked);
    return !isLiked;
  }

  @override
  Widget build(BuildContext context) {
    return LikeButton(
      size: 30,
      circleColor: const CircleColor(
        start: Color(0xff00ddff),
        end: Color(0xff0099cc),
      ),
      bubblesColor: const BubblesColor(
        dotPrimaryColor: Color(0xff33b5e5),
        dotSecondaryColor: Color(0xff0099cc),
      ),
      likeBuilder: (bool isLiked) {
        return isLiked
            ? const Icon(
                Icons.favorite,
                color: Colors.red,
              )
            : const Icon(
                Icons.favorite_border,
              );
      },
      likeCount: numberLikes,
      isLiked: isLiked,
      countBuilder: (int? count, bool isLiked, String text) {
        var color = isLiked ? Colors.red : Colors.grey;
        return Text(
          text,
          style: TextStyle(color: color),
        );
      },
      onTap: onLikeButtonTapped,
    );
  }
}
