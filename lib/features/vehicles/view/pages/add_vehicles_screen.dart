import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rakna/core/helper/enums.dart';
import 'package:rakna/core/helper/keys.dart';
import 'package:rakna/core/networking/dio_helpers.dart';
import 'package:rakna/core/routing/page_name.dart';
import 'package:rakna/core/services/cache_service.dart';
import 'package:rakna/core/theme/manager/text_style_manager.dart';
import 'package:rakna/core/widgets/custom_elevated_button.dart';
import 'package:rakna/core/widgets/custom_snak_bar.dart';
import 'package:rakna/core/widgets/custom_text_form_fieild.dart';
import 'package:rakna/features/vehicles/model/vehicles_model.dart';

class AddVehiclesScreen extends StatefulWidget {
  const AddVehiclesScreen({Key? key}) : super(key: key);

  @override
  State<AddVehiclesScreen> createState() => _AddVehiclesScreenState();
}

class _AddVehiclesScreenState extends State<AddVehiclesScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  TextEditingController licencePlateController = TextEditingController();
  TextEditingController nicknameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Vehicles"),
        leading: BackButton(
          onPressed: () {
            context.pushReplacement(PageName.kVehiclesView);
          },
        ),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const SizedBox(height: 50),
              CustomTextFormFeild(
                text: "LICENCE PLATE NUMBER",
                keyboardType: TextInputType.phone,
                controller: licencePlateController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'License plate number cannot be empty';
                  }
                  return null;
                },
                prefixIcon: Icons.local_parking_outlined,
              ),
              const SizedBox(height: 50),
              CustomTextFormFeild(
                text: "LICENCE PLATE LATTER",
                controller: nicknameController,
                keyboardType: TextInputType.name,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'License plate latter cannot be empty';
                  }
                  return null;
                },
                prefixIcon: Icons.abc_outlined,
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Make Sure the vehicle you're parking matches your booking or you could be towed",
                style: TextStyleManager.textStyle14w600,
              ),
              const SizedBox(height: 20),
              CustomElevatedButton(
                child: const Text("SAVE"),
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    DioHelper.postData(
                      token: CacheService.getDataString(key: Keys.token),
                      url: "/api/Driver/AddVehicle",
                      data: VehiclesModel(
                        vehicleNumber: licencePlateController.text,
                        vehicleLetter: nicknameController.text,
                      ).toJson(),
                    ).then((value) {
                      ScaffoldMessenger.of(context).showSnackBar(customSnackBar(
                        text: value.data["Message"],
                        colorState: ColorState.sucess,
                      ));
                    }).onError((error, stackTrace) {
                      ScaffoldMessenger.of(context).showSnackBar(customSnackBar(
                        text: error.toString(),
                        colorState: ColorState.failure,
                      ));
                    });
                  }
                },
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
