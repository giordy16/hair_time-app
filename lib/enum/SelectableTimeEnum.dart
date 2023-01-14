enum SelectableTimeEnum {
  INDIFFERENTE(order: 0, value: 'INDIFFERENTE', id: 0),
  MATTINA(order: 1, value: 'MATTINA', id: 1),
  POMERIGGIO(order: 2, value: 'POMERIGGIO', id: 2);
  // DOPO_LE(order: 3, value: 'DOPO LE ...', id: 3),
  // ENTRO_LE(order: 4, value: 'ENTRO LE ...', id: 4);

  const SelectableTimeEnum({
    required this.order,
    required this.value,
    required this.id
  });

  final int id;
  final int order;
  final String value;
}