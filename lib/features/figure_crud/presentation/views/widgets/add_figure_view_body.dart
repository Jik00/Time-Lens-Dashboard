import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timelens_dashboard/core/widgets/custom_button.dart';
import 'package:timelens_dashboard/core/widgets/custom_form_text_field.dart';
import 'package:timelens_dashboard/core/widgets/image_field.dart';

import '../../../domain/entities/figure_entity.dart';
import '../../cubit/add_figure_cubit/add_figure_cubit.dart';

class AddFigureViewBody extends StatefulWidget {
  const AddFigureViewBody({super.key, required this.state});

  final AddFigureState state;

  @override
  State<AddFigureViewBody> createState() => _AddFigureViewBodyState();
}

final GlobalKey<FormState> addFigureFormKey = GlobalKey<FormState>();
AutovalidateMode autoValidateMode = AutovalidateMode.disabled;

late String figureName, reignYears, reignPeriod, figureCode;
File? figureImage;

final TextEditingController figureNameController = TextEditingController();
final TextEditingController figureCodeController = TextEditingController();

class _AddFigureViewBodyState extends State<AddFigureViewBody> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: addFigureFormKey,
        autovalidateMode: autoValidateMode,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: SizedBox(
            width: double.infinity,
            child: Column(
              children: [
                CustomFormTextfield(
                  controller: figureNameController,
                  readOnly: false,
                  hintText: 'Figure Name',
                  onSaved: (value) {
                    figureName = value!;
                  },
                ),
                const SizedBox(height: 20),
                CustomFormTextfield(
                  readOnly: false,
                  hintText: 'Reign Years ~ 66',
                  onSaved: (value) {
                    figureName = value!;
                  },
                ),
                const SizedBox(height: 20),
                CustomFormTextfield(
                  readOnly: false,
                  hintText: '(Reign Period ~ (1100 - 1200)',
                  onSaved: (value) {
                    reignPeriod = value!;
                  },
                ),
                const SizedBox(height: 20),
                CustomFormTextfield(
                  controller: figureCodeController,
                  readOnly: true,
                  hintText: 'Figure Code',
                  onSaved: (value) {
                    figureCode = value!;
                  },
                ),
                const SizedBox(height: 20),
                CustomImageField(
                  width: double.infinity,
                  height: 200,
                  onImageChanged: (value) {
                    figureImage = value;
                  },
                ),
                const SizedBox(height: 40),
                CustomButton(
                  hint: 'Add Figure',
                  w: 330,
                  borderColor: const Color(0xFFBC8729),
                  fillColor: const Color(0xFF614317),
                  onTap: () async {
                    if (addFigureFormKey.currentState!.validate() &&
                        figureImage != null) {
                      addFigureFormKey.currentState!.save();

                      final figureEntity = FigureEntity(
                        figureName: figureName,
                        reignYears: reignYears,
                        reignPeriod: reignPeriod,
                        figureCode: figureCode,
                        imageFile: figureImage!,
                      );

                      context.read<AddFigureCubit>().addFigure(figureEntity);
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

    figureNameController.addListener(_updateCode);
  }

  void _updateCode() {
    figureCodeController.text =
        figureNameController.text.toLowerCase().replaceAll(RegExp(r'\s+'), '_');
  }

  void clearForm() {
    addFigureFormKey.currentState?.reset();
    figureNameController.clear();
    figureCodeController.clear();
    setState(() {
      figureName = '';
      figureCode = '';
      reignPeriod = '';
      reignYears = '';
      autoValidateMode = AutovalidateMode.disabled;
    });
  }

  @override
  void didUpdateWidget(AddFigureViewBody oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.state is AddFigureInitial &&
        oldWidget.state is AddFigureSuccess) {
      clearForm();
    }
  }
}
