import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../models/domain/client_booking/BookingDataModel.dart';
import '../../../../models/domain/client_booking/BookingServiceModel.dart';
import '../bloc/booking_flow_bloc.dart';
import 'booking_card_widget.dart';

class ServicesList extends StatelessWidget {
  List<BookingServiceModel> servicesList;
  Function(BuildContext, BookingServiceModel) onServiceClick;
  BookingServiceModel? selectedService;

  ServicesList({
    required this.servicesList,
    required this.onServiceClick,
    this.selectedService,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: NeverScrollableScrollPhysics(),
      separatorBuilder: (context, index) => const SizedBox(height: 16),
      padding: EdgeInsets.only(top: 16, left: 16, right: 16),
      itemCount: servicesList.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return BookingCardWidget(
          model: servicesList[index],
          isSelected: selectedService == servicesList[index],
          callback: (BookingDataModel service) {
            context.read<BookingFlowBloc>().add(ServiceSelectedEvent(service as BookingServiceModel));
          },
        );
      },
    );
  }
}
