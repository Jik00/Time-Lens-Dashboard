import 'dart:io';

import 'package:flutter/material.dart';
import 'package:timelens_dashboard/core/widgets/custom_button.dart';
import 'package:timelens_dashboard/core/widgets/custom_form_text_field.dart';
import 'package:timelens_dashboard/core/widgets/image_field.dart';
import 'package:timelens_dashboard/features/add_era/domain/entities/add_era_entity.dart';

class AddEraViewBody extends StatefulWidget {
  const AddEraViewBody({super.key});

  @override
  State<AddEraViewBody> createState() => _AddEraViewBodyState();
}

GlobalKey<FormState> addEraFormKey = GlobalKey<FormState>();
AutovalidateMode autoValidateMode = AutovalidateMode.disabled;

late String eraName, eraPeriod, eraCode;
late File eraImage;

class _AddEraViewBodyState extends State<AddEraViewBody> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: addEraFormKey,
        autovalidateMode: autoValidateMode,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: SizedBox(
            width: double.infinity,
            child: Column(
              children: [
                CustomFormTextfield(
                  hintText: 'Era Name',
                  onSaved: (value) {
                    eraName = value!;
                  },
                ),
                const SizedBox(height: 20),
                CustomFormTextfield(
                  hintText: 'Era Period',
                  onSaved: (value) {
                    eraPeriod = value!;
                  },
                ),
                const SizedBox(height: 20),
                CustomFormTextfield(
                  hintText: 'Era Code',
                  onSaved: (value) {
                    eraCode = value!.toLowerCase();
                  },
                ),
                const SizedBox(height: 20),
                CustomImageField(
                  width: double.infinity,
                  height: 200,
                  onImageChanged: (value) {
                    eraImage = value!;
                  },
                ),
                const SizedBox(height: 40),
                CustomButton(
                  hint: 'Add Era',
                  w: 330,
                  borderColor: const Color(0xFFBC8729),
                  fillColor: const Color(0xFF614317),
                  onTap: () {
                    if (addEraFormKey.currentState!.validate()) {
                      addEraFormKey.currentState!.save();
                      AddEraEntity inputImage = AddEraEntity(
                        eraName: eraName,
                        eraCode: eraCode,
                        description: eraPeriod,
                        imagePath: eraImage.path,
                      );
                    } else {
                      setState(() {
                        autoValidateMode = AutovalidateMode.always;
                      });
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
