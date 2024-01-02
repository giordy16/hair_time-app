import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hair_time/ui/b2b/registration/bloc/shop_registration_flow/shop_registration_state.dart';
import 'package:hair_time/ui/common/text_field/app_text_field_with_label.dart';
import 'package:hair_time/utils/custom_colors.dart';

import 'bloc/step_2/step_2_bloc.dart';
import 'bloc/step_2/step_2_event.dart';
import 'bloc/step_2/step_2_state.dart';

class ShopRegistrationStepTwo extends StatefulWidget {
  ShopRegistrationState state;

  ShopRegistrationStepTwo(this.state, {super.key});

  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<ShopRegistrationStepTwo> {
  final _predictionController = TextEditingController();
  final _countryController = TextEditingController();
  final _provinceController = TextEditingController();
  final _addressController = TextEditingController();
  final _houseNumberController = TextEditingController();
  final _zipCodeController = TextEditingController();

  @override
  void initState() {
    _predictionController.addListener(onTextChange);

    super.initState();
  }

  @override
  void dispose() {
    _predictionController.removeListener(onTextChange);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<Step2Bloc, ShopRegistrationStep2State>(builder: (context, state) {
      return GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: ListView(
          physics: const ClampingScrollPhysics(),
          children: [
            const SizedBox(height: 16),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Registra il tuo negozio',
                style: TextStyle(fontSize: 24, color: CustomColors.primaryColor, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                'Dove ti trovi?',
                style: TextStyle(fontSize: 14),
              ),
            ),
            if (state.placeFullAddress == null) ...buildEmptyPage(state) else ...buildFullPage(state),
          ],
        ),
      );
    });
  }

  List<Widget> buildEmptyPage(ShopRegistrationStep2State state) {
    return [
      Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: AppTextFieldWithLabel(hint: 'Inserisci l\'indirizzo', controller: _predictionController)),
      SizedBox(
        height: 16,
      ),
      ...buildPredictionsList(state.predictions ?? {})
    ];
  }

  List<Widget> buildFullPage(ShopRegistrationStep2State state) {
    _countryController.text = state.country ?? "";
    _addressController.text = state.address ?? "";
    _zipCodeController.text = state.zipCode ?? "";
    _provinceController.text = state.province ?? "";
    _houseNumberController.text = state.houseNumber ?? "";

    return [
      Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: AppTextFieldWithLabel(
            hint: 'Stato',
            controller: _countryController,
          )),
      SizedBox(height: 16),
      Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: AppTextFieldWithLabel(
            hint: 'Provincia',
            controller: _provinceController,
          )),
      SizedBox(height: 16),
      Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: AppTextFieldWithLabel(
            hint: 'Codice postate',
            controller: _zipCodeController,
          )),
      SizedBox(height: 16),
      Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: AppTextFieldWithLabel(
            hint: 'Indirizzo',
            controller: _addressController,
          )),
      SizedBox(height: 16),
      Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: AppTextFieldWithLabel(
            hint: 'Numero civico',
            controller: _houseNumberController,
          )),
    ];
  }

  List<Widget> buildPredictionsList(Map<String, String> predictions) {
    return predictions.entries
        .map((e) => InkWell(
              onTap: () {
                FocusScope.of(context).unfocus();
                context.read<Step2Bloc>().add(SelectedPlaceEvent(e.key));
              },
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 16),
                    Text(e.value),
                    const SizedBox(height: 16),
                    Container(
                      height: 1,
                      color: Colors.black.withOpacity(0.1),
                    )
                  ],
                ),
              ),
            ))
        .toList();
  }

  void onTextChange() {
    context.read<Step2Bloc>().add(SearchPlaceEvent(_predictionController.text));
  }
}
