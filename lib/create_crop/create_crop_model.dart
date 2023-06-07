import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';

class CreateCropModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for cropName widget.
  TextEditingController? cropNameController;
  String? Function(BuildContext, String?)? cropNameControllerValidator;
  String? _cropNameControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 1) {
      return 'Empty name is not allowed';
    }

    return null;
  }

  // State field(s) for cropDescription widget.
  TextEditingController? cropDescriptionController;
  String? Function(BuildContext, String?)? cropDescriptionControllerValidator;
  // Stores action output result for [Custom Action - uniqueCropName] action in Button widget.
  bool? isCropNameUnique;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    cropNameControllerValidator = _cropNameControllerValidator;
  }

  void dispose() {
    cropNameController?.dispose();
    cropDescriptionController?.dispose();
  }

  /// Additional helper methods are added here.

}
