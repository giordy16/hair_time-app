import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hair_time/ui/common/text_field/app_text_field_with_label.dart';
import 'package:hair_time/ui/b2b/registration/bloc/shop_registration_flow/shop_registration_bloc.dart';
import 'package:hair_time/ui/b2b/registration/bloc/shop_registration_flow/shop_registration_event.dart';
import 'package:hair_time/ui/b2b/registration/bloc/shop_registration_flow/shop_registration_state.dart';
import 'package:hair_time/utils/custom_colors.dart';

class ShopRegistrationStepOne extends StatefulWidget {
  ShopRegistrationState state;

  ShopRegistrationStepOne(this.state, {super.key});

  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<ShopRegistrationStepOne> {
  final _nameController = TextEditingController();

  @override
  void initState() {
    _nameController.addListener(onTextChange);
    super.initState();
  }

  @override
  void dispose() {
    _nameController.removeListener(onTextChange);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
          const SizedBox(height: 16),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: AppTextFieldWithLabel(
                hint: 'Name',
                controller: _nameController,
                topLabel: 'Inserisci il nome del tuo negozio',
              )),
        ],
      ),
    );
  }

  void onTextChange() {
    context.read<ShopRegistrationBloc>().add(SetShopNameEvent(_nameController.text));
  }
}
