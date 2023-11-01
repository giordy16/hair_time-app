import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hair_time/ui/client/booking_flow/bloc/booking_flow_bloc.dart';
import 'package:hair_time/ui/client/booking_flow/enum/sex_enum.dart';
import 'package:hair_time/ui/client/booking_flow/widgets/services_list.dart';
import 'package:hair_time/utils/custom_colors.dart';

import '../../../models/domain/client_booking/BookingServiceModel.dart';

class BookingStepThreeRecap extends StatefulWidget {
  BookingFlowState state;

  BookingStepThreeRecap(this.state, {super.key});

  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<BookingStepThreeRecap> with SingleTickerProviderStateMixin {
  late TabController _controller;

  @override
  void initState() {
    _controller = TabController(length: 2, vsync: this);
    _controller.addListener(_onTabChange);

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final manServices = (widget.state.serviceList?.where((element) => element.sex == Sex.MAN) ?? []).toList();
    final womanServices = (widget.state.serviceList?.where((element) => element.sex == Sex.WOMAN) ?? []).toList();

    return ListView(
      padding: EdgeInsets.only(bottom: 32),
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      children: [
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            'Prenota il tuo appuntamento',
            style: TextStyle(fontSize: 24, color: CustomColors.primaryColor, fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            'Cosa?',
            style: TextStyle(fontSize: 18),
          ),
        ),
        const SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            'Seleziona il tipo di servizio.',
            style: TextStyle(fontSize: 14),
          ),
        ),
        const SizedBox(height: 8),
        TabBar(
          unselectedLabelColor: Colors.black,
          labelColor: Colors.black,
          controller: _controller,
          tabs: const [
            Tab(
              child: Text("Donna"),
            ),
            Tab(
              child: Text("Uomo"),
            ),
          ],
        ),
        [
          ServicesList(servicesList: womanServices, onServiceClick: _onServiceClick, selectedService: widget.state.serviceSelected),
          ServicesList(servicesList: manServices, onServiceClick: _onServiceClick, selectedService: widget.state.serviceSelected),
        ][_controller.index],
      ],
    );
  }

  void _onServiceClick(BuildContext context, BookingServiceModel service) {
    context.read<BookingFlowBloc>().add(ServiceSelectedEvent(service as BookingServiceModel));
  }

  void _onTabChange() {
    if (_controller.indexIsChanging) {
      setState(() {});
    }
  }
}
