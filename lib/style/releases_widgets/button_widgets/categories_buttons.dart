import 'package:biori/style/releases_widgets/constants/constants.dart';
import 'package:biori/theme/pallete.dart';
import 'package:flutter/material.dart';

import 'model/categories_button_model.dart';

class CategoriesButtons extends StatelessWidget {
  final Function subscribeEvent;
  final List<CategoriesButtonsModel> categories;

  CategoriesButtons({super.key, required this.categories, required this.subscribeEvent});


  @override
  Widget build(BuildContext context) {

    return Row(
      children: [
        Expanded(
          child: Container(
            height: EventConstants.heightButtons,
            margin: const EdgeInsets.fromLTRB(
                EventConstants.margin, 0, EventConstants.margin, 0),
            child: Scrollbar(
              thumbVisibility: true,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  Color backgroundColor = categories[index].isFollowed
                      ? Pallete.primaryColor
                      : Pallete.scaffoldBackgroundColor;
                  return Container(
                    margin: const EdgeInsets.fromLTRB(
                        0, 0, 0, EventConstants.margin),
                    child: ElevatedButton(
                      onPressed: () {
                        subscribeEvent(categories[index].id);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: backgroundColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              EventConstants.borderRadius),
                        ),
                      ),
                      child: Text(categories[index].name),
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    width: 10,
                  );
                },
                itemCount: categories.length,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
