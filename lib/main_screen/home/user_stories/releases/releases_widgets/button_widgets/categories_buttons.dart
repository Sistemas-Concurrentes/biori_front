import 'package:biori/main_screen/home/listeners/card_listener_interface.dart';
import 'package:biori/theme/pallete.dart';
import 'package:flutter/material.dart';

import '../constants/constants.dart';
import 'model/categories_button_model.dart';

class CategoriesButtons extends StatelessWidget {
  final Function subscribeEvent;
  final List<TagsButtonsModel> categories;
  final ReleaseType releaseType;
  final scrollController = ScrollController();
  final bool isEventDetailPage;

  CategoriesButtons(
      {super.key,
      required this.categories,
      required this.subscribeEvent,
      required this.releaseType,
      this.isEventDetailPage = false});

  @override
  Widget build(BuildContext context) {

    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(ReleasesConstants.padding),
            child: isEventDetailPage
                  ? _filterChip()
                  : _showCategoriesWithScrollBar(),
          ),
          ),
      ],
    );
  }

  Widget _showCategoriesWithScrollBar() {
    return Scrollbar(
      controller: scrollController,
      thumbVisibility: true,
      child: _filterShipWithScrollBar(),
    );
  }

  Widget _filterShipWithScrollBar() {
    return SingleChildScrollView(
      controller: scrollController,
      scrollDirection: Axis.horizontal,
      child: _filterChip(),
    );
  }

  Widget _filterChip() {
    return Wrap(
      spacing: 5.0,
      children: categories.map((category) {
        return FilterChip(
          label: Text(category.name),
          selected: category.isFollowed,
          onSelected: (bool selected) {
            subscribeEvent(category.id, releaseType);
          },
        );
      }).toList(),
    );
  }
}
