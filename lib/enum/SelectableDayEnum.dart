enum SelectableDayEnum {
  PRIMA_POSSIBILE(order: 2, value: 'PRIMA POSSIBILE', id: 0),
  WEEKEND(order: 4, value: 'WEEKEND', id: 1),
  LUN_VEN(order: 3, value: 'TRA LUNEDÌ E VENERDÌ', id: 2),
  SPECIF_DAY(order: 0, value: 'SELEZIONA DATA', id: 3);
  // RANGE_DAY(order: 1, value: 'SELEZIONA INTERVALLO DI DATE', id: 4);


  const SelectableDayEnum({
    required this.id,
    required this.order,
    required this.value,
  });

  final int id;
  final int order;
  final String value;
}