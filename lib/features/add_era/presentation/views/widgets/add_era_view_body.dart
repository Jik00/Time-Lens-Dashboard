import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timelens_dashboard/core/widgets/custom_button.dart';
import 'package:timelens_dashboard/core/widgets/custom_form_text_field.dart';
import 'package:timelens_dashboard/core/widgets/image_field.dart';
import 'package:timelens_dashboard/features/add_era/domain/entities/era_entity.dart';
import 'package:timelens_dashboard/features/add_era/presentation/cubit/add_era_cubit.dart';

class AddEraViewBody extends StatefulWidget {
  final AddEraCubitState state;
  const AddEraViewBody({super.key, required this.state});

  @override
  State<AddEraViewBody> createState() => _AddEraViewBodyState();
}

final GlobalKey<FormState> addEraFormKey = GlobalKey<FormState>();
AutovalidateMode autoValidateMode = AutovalidateMode.disabled;

late String eraName, eraPeriod, eraCode;
File? eraImage;
final TextEditingController eraNameController = TextEditingController();
final TextEditingController eraCodeController = TextEditingController();

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
                  controller: eraNameController,
                  readOnly: false,
                  hintText: 'Era Name',
                  onSaved: (value) {
                    eraName = value!;
                  },
                ),
                const SizedBox(height: 20),
                CustomFormTextfield(
                  readOnly: false,
                  hintText: 'Era Period',
                  onSaved: (value) {
                    eraPeriod = value!;
                  },
                ),
                const SizedBox(height: 20),
                CustomFormTextfield(
                  controller: eraCodeController,
                  readOnly: true,
                  hintText: 'Era Code',
                  onSaved: (value) {
                    eraCode = value!;
                  },
                ),
                const SizedBox(height: 20),
                CustomImageField(
                  width: double.infinity,
                  height: 200,
                  onImageChanged: (value) {
                    eraImage = value;
                  },
                ),
                const SizedBox(height: 40),
                CustomButton(
                  hint: 'Add Era',
                  w: 330,
                  borderColor: const Color(0xFFBC8729),
                  fillColor: const Color(0xFF614317),
                  onTap: () async {
                    if (addEraFormKey.currentState!.validate() &&
                        eraImage != null) {
                      addEraFormKey.currentState!.save();

                      final eraEntity = EraEntity(
                        eraName: eraName,
                        eraCode: eraCode,
                        eraPeriod: eraPeriod,
                        imageFile: eraImage!,
                      );

                      context.read<AddEraCubit>().addEra(eraEntity);
                    } else {
                      setState(() {
                        autoValidateMode = AutovalidateMode.always;
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Please pick all the fields!'),
                            backgroundColor: Colors.red,
                          ),
                        );
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

  @override
  void initState() {
    super.initState();

    eraNameController.addListener(_updateCode);
  }

  void _updateCode() {
    if (!mounted) return; // <--- prevents using after dispose
    eraCodeController.text =
        eraNameController.text.toLowerCase().replaceAll(RegExp(r'\s+'), '_');
  }

  @override
  void dispose() {
    eraNameController.removeListener(_updateCode);
    eraNameController.dispose();
    eraCodeController.dispose();
    super.dispose();
  }

  void clearForm() {
    addEraFormKey.currentState?.reset();
    eraNameController.clear();
    eraCodeController.clear();
    setState(() {
      eraName = '';
      eraCode = '';
      eraPeriod = '';
      autoValidateMode = AutovalidateMode.disabled;
    });
  }

  @override
  void didUpdateWidget(AddEraViewBody oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.state is AddEraCubitInitial &&
        oldWidget.state is AddEraCubitSuccess) {
      clearForm();
    }
  }
}
