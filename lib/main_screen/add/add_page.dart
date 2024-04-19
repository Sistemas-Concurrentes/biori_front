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
        child: SingleChildScrollView(
          child: Column(
            children: [
              createCardToAdd(context, "$anadir $evento", Icons.event, () {}),
              createCardToAdd(context, "$anadir $advertisement", Icons.note_add, () {}),
              createCardToAdd(context, "$anadir $report", Icons.folder_open, () {}),
            ],
          ),
        ),
      ),
    );
  }

  Widget createCardToAdd(context, text, icon, Function pushNewPageFunction) {
    return Hero(
      tag: "name-tile",
      child: Card(
          child: ListTile(
        title: Text(text, style: JaviStyle.tituloEvento),
        trailing: Icon(icon),
        onTap: () => pushNewPageFunction,
      )),
    );
  }
}
