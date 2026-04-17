class HealthInputFormState {
  final String? selectedSex;
  final String? selectedCp;
  final String? selectedSlope;
  final String? selectedThal;
  final String? selectedRestecg;
  final int ca;
  final bool fbs;
  final bool exang;

  const HealthInputFormState({
    this.selectedSex,
    this.selectedCp,
    this.selectedSlope,
    this.selectedThal,
    this.selectedRestecg,
    this.ca = 0,
    this.fbs = false,
    this.exang = false,
  });

  HealthInputFormState copyWith({
    String? selectedSex,
    String? selectedCp,
    String? selectedSlope,
    String? selectedThal,
    String? selectedRestecg,
    int? ca,
    bool? fbs,
    bool? exang,
  }) {
    return HealthInputFormState(
      selectedSex: selectedSex ?? this.selectedSex,
      selectedCp: selectedCp ?? this.selectedCp,
      selectedSlope: selectedSlope ?? this.selectedSlope,
      selectedThal: selectedThal ?? this.selectedThal,
      selectedRestecg: selectedRestecg ?? this.selectedRestecg,
      ca: ca ?? this.ca,
      fbs: fbs ?? this.fbs,
      exang: exang ?? this.exang,
    );
  }

  bool get isComplete =>
      selectedSex != null &&
      selectedCp != null &&
      selectedSlope != null &&
      selectedThal != null &&
      selectedRestecg != null;
}