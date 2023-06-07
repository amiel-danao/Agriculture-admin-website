import '/backend/backend.dart';
import '/components/side_bar_nav_widget.dart';
import '/components/top_nav1_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_charts.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomePageModel extends FlutterFlowModel {
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
