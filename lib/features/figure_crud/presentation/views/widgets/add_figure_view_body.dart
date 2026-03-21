import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timelens_dashboard/core/widgets/custom_button.dart';
import 'package:timelens_dashboard/core/widgets/custom_form_text_field.dart';
import 'package:timelens_dashboard/core/widgets/image_field.dart';
import 'package:timelens_dashboard/features/figure_crud/presentation/views/widgets/select_eras_bloc_builder.dart';

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

late String figureName, dynasty, reignPeriod, figureCode;
File? figureImage;

final TextEditingController figureNameController = TextEditingController();
final TextEditingController figureCodeController = TextEditingController();
final TextEditingController belongEraController = TextEditingController();

class _AddFigureViewBodyState extends State<AddFigureViewBody> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: addFigureFormKey,
        autovalidateMode: autoValidateMode,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
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
              SizedBox(height: 24.h),
              CustomFormTextfield(
                readOnly: false,
                hintText: 'Dynasty ~ 18',
                onSaved: (value) {
                  dynasty = value!;
                },
              ),
              SizedBox(height: 24.h),
              CustomFormTextfield(
                readOnly: false,
                hintText: '(Reign Period ~ (1100 - 1200)',
                onSaved: (value) {
                  reignPeriod = value!;
                },
              ),
              SizedBox(height: 24.h),
              CustomFormTextfield(
                controller: figureCodeController,
                readOnly: true,
                hintText: 'Figure Code',
                onSaved: (value) {
                  figureCode = value!;
                },
              ),
              SizedBox(height: 24.h),
              SelectErasBlocBuilder(
                belongEracontroller: belongEraController,
              ),
              SizedBox(height: 24.h),
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
                      figureImage != null &&
                      belongEraController.text.isNotEmpty) {
                    addFigureFormKey.currentState!.save();

                    final figureEntity = FigureEntity(
                      figureName: figureName,
                      dynasty: dynasty,
                      reignPeriod: reignPeriod,
                      figureCode: figureCode,
                      belongEra: belongEraController.text,
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
    belongEraController.clear();
    setState(() {
      figureName = '';
      figureCode = '';
      reignPeriod = '';
      dynasty = '';
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
