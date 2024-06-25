import 'package:flutter/material.dart';

class ChipInput {
  final String label;
  final Function? onDeleted;
  final Function(bool)? onSelected;

  ChipInput({required this.label, this.onDeleted, this.onSelected});

  @override
  Widget build(BuildContext context) {
    return InputChip(
      label: Text(label),
      onDeleted: onDeleted != null
          ? () {
              onDeleted!();
            }
          : null,
      onSelected: onSelected,
    );
  }
}
