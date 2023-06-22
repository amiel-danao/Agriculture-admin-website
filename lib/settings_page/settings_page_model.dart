import '../backend/schema/settings_record.dart';
import '/components/side_bar_nav_widget.dart';
import '/components/top_nav1_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';

class SettingsPageModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // Stores action output result for [Custom Action - getWeatherSettings] action in settingsPage widget.
  SettingsRecord? currentWeatherSettings;
  // Model for sideBarNav component.
  late SideBarNavModel sideBarNavModel;
  // Model for TopNav1 component.
  late TopNav1Model topNav1Model;
  // State field(s) for temperatureTextField widget.
  TextEditingController? temperatureTextFieldController;
  String? Function(BuildContext, String?)?
  temperatureTextFieldControllerValidator;
  String? _temperatureTextFieldControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 1) {
      return 'Requires at least 1 characters.';
    }

    return null;
  }

  // State field(s) for weatherStatusDropDown widget.
  String? weatherStatusDropDownValue;
  FormFieldController<String>? weatherStatusDropDownValueController;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    sideBarNavModel = createModel(context, () => SideBarNavModel());
    topNav1Model = createModel(context, () => TopNav1Model());
    temperatureTextFieldControllerValidator =
        _temperatureTextFieldControllerValidator;
  }

  void dispose() {
    unfocusNode.dispose();
    sideBarNavModel.dispose();
    topNav1Model.dispose();
    temperatureTextFieldController?.dispose();
  }

/// Action blocks are added here.

/// Additional helper methods are added here.

}
