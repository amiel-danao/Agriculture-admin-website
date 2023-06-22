import '/backend/backend.dart';
import '/components/side_bar_nav_widget.dart';
import '/components/top_nav1_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'crops_page_model.dart';
export 'crops_page_model.dart';

class CropsPageWidget extends StatefulWidget {
  const CropsPageWidget({Key? key}) : super(key: key);

  @override
  _CropsPageWidgetState createState() => _CropsPageWidgetState();
}

class _CropsPageWidgetState extends State<CropsPageWidget> {
  late CropsPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CropsPageModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            if (responsiveVisibility(
              context: context,
              phone: false,
              tablet: false,
            ))
              wrapWithModel(
                model: _model.sideBarNavModel,
                updateCallback: () => setState(() {}),
                child: SideBarNavWidget(
                  oneBG: FlutterFlowTheme.of(context).secondaryBackground,
                  oneIcon: Icon(
                    Icons.bar_chart_rounded,
                    color: FlutterFlowTheme.of(context).primaryText,
                  ),
                  twoBG: FlutterFlowTheme.of(context).secondaryBackground,
                  twoIcon: FaIcon(
                    FontAwesomeIcons.usersGear,
                    color: FlutterFlowTheme.of(context).primaryText,
                  ),
                  threeColor: FlutterFlowTheme.of(context).primaryBackground,
                  threeIcon: FaIcon(
                    FontAwesomeIcons.carrot,
                    color: FlutterFlowTheme.of(context).primary,
                  ),
                  fourIcon: FaIcon(
                    FontAwesomeIcons.userGroup,
                  ),
                  fiveIcon: FaIcon(
                    FontAwesomeIcons.gear,
                  ),
                ),
              ),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      wrapWithModel(
                        model: _model.topNav1Model,
                        updateCallback: () => setState(() {}),
                        child: TopNav1Widget(),
                      ),
                    ],
                  ),
                  Padding(
                    padding:
                    EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 4.0, 24.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 1.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 4.0,
                            color: Color(0x33000000),
                            offset: Offset(0.0, 2.0),
                          )
                        ],
                        borderRadius: BorderRadius.circular(16.0),
                        border: Border.all(
                          color:
                          FlutterFlowTheme.of(context).secondaryBackground,
                          width: 1.0,
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            0.0, 16.0, 0.0, 12.0),
                        child:
                        SingleChildScrollView(
                          child:
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 1.0, 0.0, 0.0),
                                child: Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 0.0,
                                        color: FlutterFlowTheme.of(context)
                                            .lineColor,
                                        offset: Offset(0.0, 1.0),
                                      )
                                    ],
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(0.0),
                                      bottomRight: Radius.circular(0.0),
                                      topLeft: Radius.circular(16.0),
                                      topRight: Radius.circular(16.0),
                                    ),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 16.0, 16.0, 16.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                          MainAxisAlignment.center,
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Manage Crops',
                                              style: FlutterFlowTheme.of(context)
                                                  .headlineSmall,
                                            ),
                                            Padding(
                                              padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 4.0, 0.0, 0.0),
                                              child: Text(
                                                'Below you will find a list of crops',
                                                style:
                                                FlutterFlowTheme.of(context)
                                                    .bodySmall,
                                              ),
                                            ),
                                          ],
                                        ),
                                        FFButtonWidget(
                                          onPressed: () async {
                                            context.pushNamed(
                                              'CreateCrop',
                                              extra: <String, dynamic>{
                                                kTransitionInfoKey:
                                                TransitionInfo(
                                                  hasTransition: true,
                                                  transitionType:
                                                  PageTransitionType
                                                      .bottomToTop,
                                                ),
                                              },
                                            );
                                          },
                                          text: 'Add Crop',
                                          icon: Icon(
                                            Icons.add_rounded,
                                            size: 15.0,
                                          ),
                                          options: FFButtonOptions(
                                            width: 150.0,
                                            height: 40.0,
                                            padding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                            iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            textStyle: FlutterFlowTheme.of(
                                                context)
                                                .titleSmall
                                                .override(
                                              fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmallFamily,
                                              color: Colors.white,
                                              useGoogleFonts: GoogleFonts
                                                  .asMap()
                                                  .containsKey(
                                                  FlutterFlowTheme.of(
                                                      context)
                                                      .titleSmallFamily),
                                            ),
                                            elevation: 3.0,
                                            borderSide: BorderSide(
                                              color: Colors.transparent,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                            BorderRadius.circular(50.0),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    12.0, 12.0, 12.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      flex: 2,
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            8.0, 0.0, 0.0, 0.0),
                                        child: Text(
                                          'Name',
                                          style: FlutterFlowTheme.of(context)
                                              .bodySmall,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            8.0, 0.0, 0.0, 0.0),
                                        child: Text(
                                          'Description',
                                          style: FlutterFlowTheme.of(context)
                                              .bodySmall,
                                        ),
                                      ),
                                    ),
                                    if (responsiveVisibility(
                                      context: context,
                                      phone: false,
                                      tablet: false,
                                    ))
                                      Expanded(
                                        flex: 2,
                                        child: Text(
                                          'Date Created',
                                          style: FlutterFlowTheme.of(context)
                                              .bodySmall,
                                        ),
                                      ),
                                    if (responsiveVisibility(
                                      context: context,
                                      phone: false,
                                      tablet: false,
                                    ))
                                      Expanded(
                                        flex: 2,
                                        child: Text(
                                          'Action',
                                          style: FlutterFlowTheme.of(context)
                                              .bodySmall,
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 16.0, 0.0, 0.0),
                                child: PagedListView<DocumentSnapshot<Object?>?,
                                    CropsRecord>(
                                  pagingController: () {
                                    final Query<Object?> Function(
                                        Query<Object?>) queryBuilder =
                                        (cropsRecord) => cropsRecord.orderBy(
                                        'dateCreated',
                                        descending: true);
                                    if (_model.pagingController != null) {
                                      final query =
                                      queryBuilder(CropsRecord.collection);
                                      if (query != _model.pagingQuery) {
                                        // The query has changed
                                        _model.pagingQuery = query;
                                        _model.streamSubscriptions
                                            .forEach((s) => s?.cancel());
                                        _model.streamSubscriptions.clear();
                                        _model.pagingController!.refresh();
                                      }
                                      return _model.pagingController!;
                                    }

                                    _model.pagingController =
                                        PagingController(firstPageKey: null);
                                    _model.pagingQuery =
                                        queryBuilder(CropsRecord.collection);
                                    _model.pagingController!
                                        .addPageRequestListener(
                                            (nextPageMarker) {
                                          queryCropsRecordPage(
                                            queryBuilder: (cropsRecord) =>
                                                cropsRecord.orderBy('dateCreated',
                                                    descending: true),
                                            nextPageMarker: nextPageMarker,
                                            pageSize: 25,
                                            isStream: true,
                                          ).then((page) {
                                            _model.pagingController!.appendPage(
                                              page.data,
                                              page.nextPageMarker,
                                            );
                                            final streamSubscription =
                                            page.dataStream?.listen((data) {
                                              data.forEach((item) {
                                                final itemIndexes = _model
                                                    .pagingController!.itemList!
                                                    .asMap()
                                                    .map((k, v) => MapEntry(
                                                    v.reference.id, k));
                                                final index =
                                                itemIndexes[item.reference.id];
                                                final items = _model
                                                    .pagingController!.itemList!;
                                                if (index != null) {
                                                  items.replaceRange(
                                                      index, index + 1, [item]);
                                                  _model.pagingController!
                                                      .itemList = {
                                                    for (var item in items)
                                                      item.reference: item
                                                  }.values.toList();
                                                }
                                              });
                                              setState(() {});
                                            });
                                            _model.streamSubscriptions
                                                .add(streamSubscription);
                                          });
                                        });
                                    return _model.pagingController!;
                                  }(),
                                  padding: EdgeInsets.zero,
                                  shrinkWrap: true,
                                  reverse: false,
                                  scrollDirection: Axis.vertical,
                                  builderDelegate:
                                  PagedChildBuilderDelegate<CropsRecord>(
                                    // Customize what your widget looks like when it's loading the first page.
                                    firstPageProgressIndicatorBuilder: (_) =>
                                        Center(
                                          child: SizedBox(
                                            width: 50,
                                            height: 50,
                                            child: CircularProgressIndicator(
                                              color: FlutterFlowTheme.of(context)
                                                  .primary,
                                            ),
                                          ),
                                        ),

                                    itemBuilder: (context, _, listViewIndex) {
                                      final listViewCropsRecord = _model
                                          .pagingController!
                                          .itemList![listViewIndex];
                                      return Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 2.0),
                                        child: Container(
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            boxShadow: [
                                              BoxShadow(
                                                blurRadius: 0.0,
                                                color:
                                                FlutterFlowTheme.of(context)
                                                    .lineColor,
                                                offset: Offset(0.0, 1.0),
                                              )
                                            ],
                                          ),
                                          child: Padding(
                                            padding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                12.0, 12.0, 12.0, 12.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Expanded(
                                                  flex: 1,
                                                  child: AutoSizeText(
                                                    listViewCropsRecord.name
                                                        .maybeHandleOverflow(
                                                      maxChars: 32,
                                                      replacement: '…',
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                        context)
                                                        .titleMedium,
                                                  ),
                                                ),
                                                if (responsiveVisibility(
                                                  context: context,
                                                  phone: false,
                                                  tablet: false,
                                                ))
                                                  Expanded(
                                                    flex: 1,
                                                    child: Text(
                                                      listViewCropsRecord
                                                          .description,
                                                      style: FlutterFlowTheme.of(
                                                          context)
                                                          .bodyMedium,
                                                    ),
                                                  ),
                                                if (responsiveVisibility(
                                                  context: context,
                                                  phone: false,
                                                  tablet: false,
                                                ))
                                                  Expanded(
                                                    flex: 1,
                                                    child: Text(
                                                      dateTimeFormat(
                                                          'yMMMd',
                                                          listViewCropsRecord
                                                              .dateCreated!),
                                                      style: FlutterFlowTheme.of(
                                                          context)
                                                          .bodyMedium,
                                                    ),
                                                  ),
                                                Flexible(
                                                  flex: 1,
                                                  child: FFButtonWidget(
                                                    onPressed: () async {
                                                      context.pushNamed(
                                                        'CreateCrop',
                                                        queryParameters: {
                                                          'cropToEdit':
                                                          serializeParam(
                                                            listViewCropsRecord,
                                                            ParamType.Document,
                                                          ),
                                                        }.withoutNulls,
                                                        extra: <String,
                                                            dynamic>{
                                                          'cropToEdit':
                                                          listViewCropsRecord,
                                                        },
                                                      );
                                                    },
                                                    text: 'Edit',
                                                    options: FFButtonOptions(
                                                      height: 40.0,
                                                      padding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(24.0, 0.0,
                                                          24.0, 0.0),
                                                      iconPadding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(0.0, 0.0,
                                                          0.0, 0.0),
                                                      color: FlutterFlowTheme.of(
                                                          context)
                                                          .tertiary,
                                                      textStyle: FlutterFlowTheme
                                                          .of(context)
                                                          .titleSmall
                                                          .override(
                                                        fontFamily:
                                                        FlutterFlowTheme.of(
                                                            context)
                                                            .titleSmallFamily,
                                                        color: Colors.white,
                                                        useGoogleFonts: GoogleFonts
                                                            .asMap()
                                                            .containsKey(
                                                            FlutterFlowTheme.of(context)
                                                                .titleSmallFamily),
                                                      ),
                                                      elevation: 3,
                                                      borderSide: BorderSide(
                                                        color:
                                                        Colors.transparent,
                                                        width: 1,
                                                      ),
                                                      borderRadius:
                                                      BorderRadius.circular(
                                                          8),
                                                    ),
                                                  ),
                                                ),
                                                Flexible(
                                                  flex: 1,
                                                  child: FFButtonWidget(
                                                    onPressed: () async {
                                                      var confirmDialogResponse =
                                                          await showDialog<
                                                              bool>(
                                                            context:
                                                            context,
                                                            builder:
                                                                (alertDialogContext) {
                                                              return AlertDialog(
                                                                title: Text(
                                                                    'Confirm delete?'),
                                                                content: Text(
                                                                    'Are you sure you want to delete this record?'),
                                                                actions: [
                                                                  TextButton(
                                                                    onPressed: () => Navigator.pop(
                                                                        alertDialogContext,
                                                                        false),
                                                                    child: Text(
                                                                        'Cancel'),
                                                                  ),
                                                                  TextButton(
                                                                    onPressed: () => Navigator.pop(
                                                                        alertDialogContext,
                                                                        true),
                                                                    child: Text(
                                                                        'Confirm'),
                                                                  ),
                                                                ],
                                                              );
                                                            },
                                                          ) ??
                                                              false;
                                                      if (confirmDialogResponse) {
                                                        await listViewCropsRecord
                                                            .reference
                                                            .delete();
                                                        ScaffoldMessenger.of(
                                                            context)
                                                            .showSnackBar(
                                                          SnackBar(
                                                            content: Text(
                                                              'The record has been deleted successfully',
                                                              style: TextStyle(
                                                                color: FlutterFlowTheme.of(
                                                                    context)
                                                                    .primaryText,
                                                              ),
                                                            ),
                                                            duration: Duration(
                                                                milliseconds:
                                                                4000),
                                                            backgroundColor:
                                                            FlutterFlowTheme.of(
                                                                context)
                                                                .secondary,
                                                          ),
                                                        );

                                                        context.pushNamed(
                                                            'cropsPage');

                                                        return;
                                                      } else {
                                                        return;
                                                      }
                                                    },
                                                    text: 'Delete',
                                                    icon: Icon(
                                                      Icons.delete_forever,
                                                      size: 15,
                                                    ),
                                                    options: FFButtonOptions(
                                                      height: 40,
                                                      padding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(
                                                          24, 0, 24, 0),
                                                      iconPadding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(
                                                          0, 0, 0, 0),
                                                      color:
                                                      FlutterFlowTheme.of(
                                                          context)
                                                          .error,
                                                      textStyle:
                                                      FlutterFlowTheme.of(
                                                          context)
                                                          .titleSmall
                                                          .override(
                                                        fontFamily: FlutterFlowTheme.of(
                                                            context)
                                                            .titleSmallFamily,
                                                        color: Colors
                                                            .white,
                                                        useGoogleFonts: GoogleFonts
                                                            .asMap()
                                                            .containsKey(
                                                            FlutterFlowTheme.of(context)
                                                                .titleSmallFamily),
                                                      ),
                                                      elevation: 3.0,
                                                      borderSide: BorderSide(
                                                        color: Colors.transparent,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
