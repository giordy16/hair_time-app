import 'package:flutter/material.dart';
import 'package:hair_time/ui/select_user_type/select_user_type_enum.dart';
import 'package:hair_time/utils/custom_colors.dart';

class SelectUserCard extends StatelessWidget {
  final UserTypeEnum type;
  final bool isSelected;
  final Function(UserTypeEnum) callback;

  const SelectUserCard({
    Key? key,
    required this.type,
    required this.isSelected,
    required this.callback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    String title = type == UserTypeEnum.CLIENT ? "CLIENTE" : "ESERCENTE";
    String message = type == UserTypeEnum.CLIENT ? "Vuoi trovare il parrucchiere/barbiere più vicino a te e prenotare con pochi click" : "Sei un parrucchiere/barbiere e vuoi semplificare le prenotazioni per la tua attività";

    return GestureDetector(
      onTap: () {
        callback(type);
      },
      child: Container(
        margin: const EdgeInsets.fromLTRB(16, 8, 16, 8),
        width: double.infinity,
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 3), // changes position of shadow
              ),
            ],
            color: CustomColors.backgroundLightGray,
            border: Border.all(color: CustomColors.primaryColor, width: 3, style: isSelected ? BorderStyle.solid : BorderStyle.none),
            borderRadius: BorderRadius.all(Radius.circular(25.0))),
        child: Padding(
          padding: EdgeInsets.all(32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: TextStyle(color: CustomColors.primaryColor, fontSize: 20, fontWeight: FontWeight.bold)),
              SizedBox(
                height: 16,
              ),
              Text(message),
            ],
          ),
        ),
      ),
    );
  }
}
