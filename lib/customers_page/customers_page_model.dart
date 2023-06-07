import '/components/side_bar_nav_widget.dart';
import '/components/top_nav1_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';

class CustomersPageModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // Model for sideBarNav component.
  late SideBarNavModel sideBarNavModel;
  // Model for TopNav1 component.
  late TopNav1Model topNav1Model;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    sideBarNavModel = createModel(context, () => SideBarNavModel());
    topNav1Model = createModel(context, () => TopNav1Model());
  }

  void dispose() {
    sideBarNavModel.dispose();
    topNav1Model.dispose();
  }

  /// Additional helper methods are added here.

}
