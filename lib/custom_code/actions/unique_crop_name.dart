// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
// Imports other custom actions
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the button on the right!
Future<bool> uniqueCropName(String cropName) async {
  var result = await FirebaseFirestore.instance
      .collection("Crops")
      .where("name", isEqualTo: cropName)
      .get();
  return result.size <= 0;
}
