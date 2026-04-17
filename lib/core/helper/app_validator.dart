enum FieldType { restingBP, cholesterol, maxHeartRate, stDepression, age }

String? fieldValidator(String? v, FieldType type) {
  if (v == null || v.isEmpty) return 'Required';

  final parsed = double.tryParse(v);
  if (parsed == null) return 'Enter a valid number';

  switch (type) {
    case FieldType.restingBP:
      if (parsed != parsed.truncateToDouble()) return 'Whole numbers only';
      final val = parsed.toInt();
      if (val < 50 || val > 250) return '50–250 mmHg';
      break;

    case FieldType.cholesterol:
      if (parsed != parsed.truncateToDouble()) return 'Whole numbers only ';
      final val = parsed.toInt();
      if (val < 100 || val > 600) return '100–600 mg/dl';
      break;

    case FieldType.maxHeartRate:
      if (parsed != parsed.truncateToDouble()) return 'Whole numbers only';
      final val = parsed.toInt();
      if (val < 50 || val > 250) return '50–250 bpm';
      break;

    case FieldType.stDepression:
      if (parsed < 0 || parsed > 10) return '0–10';
      break;

    case FieldType.age:
      if (parsed != parsed.truncateToDouble()) return 'Whole numbers only';
      final val = parsed.toInt();
      if (val < 1 || val > 120) return 'Must be 1–120';
      break;
  }

  return null;
}
