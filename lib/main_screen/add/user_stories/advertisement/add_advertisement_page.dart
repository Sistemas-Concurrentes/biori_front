import 'package:biori/main_screen/add/constants/add_constants.dart';
import 'package:flutter/material.dart';

class AddAdvertisementPage extends StatefulWidget {
  const AddAdvertisementPage({super.key});

  @override
  State<AddAdvertisementPage> createState() => _AddAdvertisementPageState();}

class _AddAdvertisementPageState extends State<AddAdvertisementPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Hero(
          tag: AddConstants().advertisementTag,
          child: const Text('Add Advertisement'),
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