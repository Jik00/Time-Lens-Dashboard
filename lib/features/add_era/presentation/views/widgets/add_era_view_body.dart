import 'package:flutter/material.dart';

class AddEraViewBody extends StatefulWidget {
  const AddEraViewBody({super.key});

  @override
  State<AddEraViewBody> createState() => _AddEraViewBodyState();
}

GlobalKey<FormState> addEraFormKey = GlobalKey<FormState>();
AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
class _AddEraViewBodyState extends State<AddEraViewBody> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: addEraFormKey,
        autovalidateMode: autoValidateMode,
        child: const Column(
        children: [
          // Add your form fields and other widgets here
        ],
      )),
    );
  }
}