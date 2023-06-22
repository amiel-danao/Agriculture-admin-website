import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';

class CreateCropModel extends FlutterFlowModel {
  ///  Local state fields for this page.

  List<String> variations = [];
  void addToVariations(String item) => variations.add(item);
  void removeFromVariations(String item) => variations.remove(item);
  void removeAtIndexFromVariations(int index) => variations.removeAt(index);
  void updateVariationsAtIndex(int index, Function(String) updateFn) =>
      variations[index] = updateFn(variations[index]);

  ///  State fields for stateful widgets in this page.
  final unfocusNode = FocusNode();
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

  // State field(s) for cropCount widget.
  TextEditingController? cropCountController;
  String? Function(BuildContext, String?)? cropCountControllerValidator;
  String? _cropCountControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 0) {
      return 'Requires at least 0 characters.';
    }

    return null;
  }

  // State field(s) for cropDescription widget.
  TextEditingController? cropDescriptionController;
  String? Function(BuildContext, String?)? cropDescriptionControllerValidator;
  // State field(s) for variationTextField widget.
  TextEditingController? variationTextFieldController;
  String? Function(BuildContext, String?)?
  variationTextFieldControllerValidator;
  // Stores action output result for [Custom Action - uniqueCropName] action in Button widget.
  bool? isCropNameUnique;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    cropNameControllerValidator = _cropNameControllerValidator;
    cropCountControllerValidator = _cropCountControllerValidator;
  }

  void dispose() {
    unfocusNode.dispose();
    cropNameController?.dispose();
    cropCountController?.dispose();
    cropDescriptionController?.dispose();
    variationTextFieldController?.dispose();
  }

/// Action blocks are added here.

/// Additional helper methods are added here.

}
