class PredictionInputData {
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

  const PredictionInputData({
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

  factory PredictionInputData.fromJson(Map<String, dynamic> json) {
    return PredictionInputData(
      age: json['age'] as int,
      trestbps: json['trestbps'] as int,
      chol: json['chol'] as int,
      thalch: json['thalch'] as int,
      oldpeak: (json['oldpeak'] as num).toDouble(),
      ca: json['ca'] as int,
      cp: json['cp'] as String,
      slope: json['slope'] as String,
      thal: json['thal'] as String,
      sex: json['sex'] as String,
      fbs: json['fbs'] as bool,
      restecg: json['restecg'] as String,
      exang: json['exang'] as bool,
    );
  }

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
