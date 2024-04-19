import 'package:biori/main_screen/add/constants/add_constants.dart';
import 'package:flutter/material.dart';

class AddEventPage extends StatefulWidget {
  const AddEventPage({super.key});

  @override
  State<AddEventPage> createState() => _AddEventPageState();}

class _AddEventPageState extends State<AddEventPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Hero(
          tag: AddConstants().eventTag,
          child: const Text('Add Event'),
        ),
      ),
      body: Form(
        key: _formKey,
        child: const Column(
          children: <Widget>[
            // Add TextFormFields and ElevatedButton here.
          ],
        ),
      ),
    );
  }
}