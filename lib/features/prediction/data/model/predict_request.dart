class PredictRequest {
  final int age;
  final int trestbps;
  final int chol;
  final int thalch;
  final double oldpeak;
  final int ca;
  final String cp;
  final String slope;
  final String thal;
  final String sex;
  final bool fbs;
  final String restecg;
  final bool exang;

  const PredictRequest({
    required this.age,
    required this.trestbps,
    required this.chol,
    required this.thalch,
    required this.oldpeak,
    required this.ca,
    required this.cp,
    required this.slope,
    required this.thal,
    required this.sex,
    required this.fbs,
    required this.restecg,
    required this.exang,
  });

  Map<String, dynamic> toJson() {
    return {
      'age': age,
      'trestbps': trestbps,
      'chol': chol,
      'thalch': thalch,
      'oldpeak': oldpeak,
      'ca': ca,
      'cp': cp,
      'slope': slope,
      'thal': thal,
      'sex': sex,
      'fbs': fbs,
      'restecg': restecg,
      'exang': exang,
    };
  }
}
