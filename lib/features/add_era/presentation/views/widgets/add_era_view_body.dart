import 'package:flutter/material.dart';
import 'package:timelens_dashboard/core/widgets/custom_form_text_field.dart';
import 'package:timelens_dashboard/core/widgets/image_field.dart';

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
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: SizedBox(
              width: double.infinity,
              child: Column(
                children: [
                  CustomFormTextfield(hintText: 'Era Name'),
                  SizedBox(height: 20),
                  CustomFormTextfield(hintText: 'Era Period'),
                  SizedBox(height: 20),
                  CustomFormTextfield(hintText: 'Era Code'),
                  SizedBox(height: 20),
                  CustomImageField(
                    width: double.infinity,
                    height: 200,
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
