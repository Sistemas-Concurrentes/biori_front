import 'package:flutter/material.dart';

import '../../constants/add_constants.dart';

class AddReportPage extends StatefulWidget {
  const AddReportPage({super.key});

  @override
  State<AddReportPage> createState() => _AddReportPageState();}

class _AddReportPageState extends State<AddReportPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Hero(
          tag: AddConstants().reportTag,
          child: const Text('Add Report'),
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