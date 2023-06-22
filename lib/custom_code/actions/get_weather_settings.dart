// Automatic FlutterFlow imports
import '../../backend/schema/settings_record.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<SettingsRecord?> getWeatherSettings() async {
  var ref =
  await FirebaseFirestore.instance.collection("settings").doc("weather");

  var snapshot = await ref.get();

  if (snapshot.exists) {
    return SettingsRecord.fromSnapshot(snapshot);
  }

  await ref.set({"status": "cloudy", "temperature": 30});

  var snapshot2 = await ref.get();

  if (snapshot.exists) {
    return SettingsRecord.fromSnapshot(snapshot2);
  }

  return null;
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the button on the right!
