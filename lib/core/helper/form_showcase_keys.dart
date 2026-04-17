import 'package:flutter/material.dart';

class FormShowcaseKeys {
  final age         = GlobalKey();
  final sex         = GlobalKey();
  final restingBp   = GlobalKey();
  final cholesterol = GlobalKey();
  final maxHeartRate= GlobalKey();
  final stDepression= GlobalKey();
  final chestPain   = GlobalKey();
  final restingEcg  = GlobalKey();
  final stSlope     = GlobalKey();
  final thal        = GlobalKey();
  final vessels     = GlobalKey();
  final fbs         = GlobalKey();
  final exang       = GlobalKey();

  List<GlobalKey> get allKeys => [
    age, sex, restingBp, cholesterol, maxHeartRate,
    stDepression, chestPain, restingEcg, stSlope,
    thal, vessels, fbs, exang,
  ];
}