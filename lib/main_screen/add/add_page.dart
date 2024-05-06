import 'package:biori/main_screen/add/constants/add_constants.dart';
import 'package:biori/router/custom_router.dart';
import 'package:biori/router/route_constants.dart';
import 'package:biori/style/javi_edit_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AddPage extends StatefulWidget {
  const AddPage({Key? key}) : super(key: key);

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  @override
  Widget build(BuildContext context) {
    String evento = AppLocalizations.of(context)!.evento,
        anadir = AppLocalizations.of(context)!.anadir,
        advertisement = AppLocalizations.of(context)!.advertisement,
        report = AppLocalizations.of(context)!.report;

    return Scaffold(
      appBar: AppBar(
        title: Text(anadir),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(JaviPaddings.L),
          child: SingleChildScrollView(
            child: Column(
              children: [
                createCardToAdd(
                  context,
                  AddConstants().eventTag,
                  "$anadir $evento",
                  Icons.event,
                  () {
                    CustomRouter.router
                        .push("$addReleasesRoute/$addEventRoute")
                        .then((value) => null);
                  },
                ),
                createCardToAdd(
                  context,
                  AddConstants().advertisementTag,
                  "$anadir $advertisement",
                  Icons.note_add,
                  () {
                    CustomRouter.router
                        .push("$addReleasesRoute/$addAdvertisementRoute")
                        .then((value) => null);
                  },
                ),
                createCardToAdd(
                  context,
                  AddConstants().reportTag,
                  "$anadir $report",
                  Icons.folder_open,
                  () {
                    CustomRouter.router
                        .push("$addReleasesRoute/$addReportRoute")
                        .then((value) => null);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget createCardToAdd(
      context, tagHero, text, icon, Function pushNewPageFunction) {
    return Hero(
      tag: tagHero,
      child: Card(
          child: ListTile(
        title: Text(text, style: JaviStyle.tituloEvento),
        trailing: Icon(icon),
        onTap: () => pushNewPageFunction(),
      )),
    );
  }
}
