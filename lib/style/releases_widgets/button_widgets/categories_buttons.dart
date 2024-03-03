import 'package:biori/style/releases_widgets/constants/constants.dart';
import 'package:biori/theme/pallete.dart';
import 'package:flutter/material.dart';

import 'model/categories_button_model.dart';

class CategoriesButtons extends StatefulWidget {
  const CategoriesButtons({super.key});

  @override
  State<CategoriesButtons> createState() => _CategoriesButtonsState();
}

class _CategoriesButtonsState extends State<CategoriesButtons> {
  final scrollController = ScrollController();
  var backgroundColor = Pallete.scaffoldBackgroundColor;

  List<CategoriesButtonsModel> categories = [];

  void _getCategories() {
    categories = CategoriesButtonsModel.getCategoriesButtons();
  }

  @override
  void initState() {
    super.initState();
    _getCategories();
  }

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
              controller: scrollController,
              thumbVisibility: true,
              child: ListView.separated(
                controller: scrollController,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  backgroundColor = categories[index].isSelected
                      ? Pallete.primaryColor
                      : Pallete.scaffoldBackgroundColor;
                  return Container(
                    margin: const EdgeInsets.fromLTRB(
                        0, 0, 0, EventConstants.margin),
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          categories[index].changeSelected();
                        });
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
