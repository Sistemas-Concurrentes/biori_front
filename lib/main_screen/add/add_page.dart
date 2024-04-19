import 'package:biori/style/javi_edit_text.dart';
import 'package:flutter/material.dart';

class AddPage extends StatefulWidget {
  const AddPage({Key? key}) : super(key: key);

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              createCardToAdd(context, "Añadir Evento", Icons.event, (){}),
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
        )
      ),
    );
  }
}
