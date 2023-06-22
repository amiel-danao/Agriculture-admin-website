import '/backend/backend.dart';
import '/components/side_bar_nav_widget.dart';
import '/components/top_nav1_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class CropsPageModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for sideBarNav component.
  late SideBarNavModel sideBarNavModel;
  // Model for TopNav1 component.
  late TopNav1Model topNav1Model;
  // State field(s) for ListView widget.
  PagingController<DocumentSnapshot?, CropsRecord>? pagingController;
  Query? pagingQuery;
  List<StreamSubscription?> streamSubscriptions = [];

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    sideBarNavModel = createModel(context, () => SideBarNavModel());
    topNav1Model = createModel(context, () => TopNav1Model());
  }

  void dispose() {
    unfocusNode.dispose();
    sideBarNavModel.dispose();
    topNav1Model.dispose();
    streamSubscriptions.forEach((s) => s?.cancel());
  }

/// Additional helper methods are added here.

}
