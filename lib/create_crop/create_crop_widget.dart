import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/scheduler.dart';
import 'create_crop_model.dart';
export 'create_crop_model.dart';

class CreateCropWidget extends StatefulWidget {
  const CreateCropWidget({
    Key? key,
    this.cropToEdit,
  }) : super(key: key);

  final CropsRecord? cropToEdit;

  @override
  _CreateCropWidgetState createState() => _CreateCropWidgetState();
}

class _CreateCropWidgetState extends State<CreateCropWidget> {
  late CreateCropModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CreateCropModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (widget.cropToEdit != null) {
        setState(() {
          _model.variations =
              widget.cropToEdit!.variation.toList().cast<String>();
        });
        return;
      } else {
        return;
      }
    });

    _model.cropNameController ??=
        TextEditingController(text: widget.cropToEdit?.name??"");
    var count = "0";
    if(widget.cropToEdit != null){
      count = valueOrDefault<String>(
        widget.cropToEdit!.count.toString(),
        '0',
      );
    }
    _model.cropCountController ??= TextEditingController(
        text: count);
    _model.cropDescriptionController ??=
        TextEditingController(text: widget.cropToEdit?.description??"");
    _model.variationTextFieldController ??= TextEditingController();
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
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(120),
            child: AppBar(
              backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
              automaticallyImplyLeading: false,
              actions: [],
              flexibleSpace: FlexibleSpaceBar(
                title: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  12.0, 0.0, 0.0, 0.0),
                              child: FlutterFlowIconButton(
                                borderColor: Colors.transparent,
                                borderRadius: 30.0,
                                borderWidth: 1.0,
                                buttonSize: 50.0,
                                icon: Icon(
                                  Icons.arrow_back_rounded,
                                  color: FlutterFlowTheme.of(context).primaryText,
                                  size: 30.0,
                                ),
                                onPressed: () async {
                                  context.pop();
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                        EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 0.0, 0),
                        child: Text(
                          'Edit Crop Details',
                          style: FlutterFlowTheme.of(context)
                              .headlineMedium
                              .override(
                            fontFamily: FlutterFlowTheme.of(context)
                                .headlineMediumFamily,
                            color: FlutterFlowTheme.of(context).primaryText,
                            fontSize: 22.0,
                            useGoogleFonts: GoogleFonts.asMap().containsKey(
                                FlutterFlowTheme.of(context)
                                    .headlineMediumFamily),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                centerTitle: true,
                expandedTitleScale: 1.0,
              ),
              elevation: 0.0,
            ),
          ),
          body:

          SingleChildScrollView(
            child:
            Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Form(
                    key: _model.formKey,
                    autovalidateMode: AutovalidateMode.always,
                    child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [

                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 16.0),
                            child: TextFormField(
                              controller: _model.cropNameController,
                              textCapitalization: TextCapitalization.words,
                              obscureText: false,
                              decoration: InputDecoration(
                                labelText: 'Name',
                                labelStyle: FlutterFlowTheme.of(context).labelMedium,
                                hintStyle: FlutterFlowTheme.of(context).labelMedium,
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).alternate,
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).primary,
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).error,
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).error,
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                filled: true,
                                fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                contentPadding:
                                EdgeInsetsDirectional.fromSTEB(20.0, 24.0, 0.0, 24.0),
                              ),
                              style: FlutterFlowTheme.of(context).bodyMedium,
                              validator:
                              _model.cropNameControllerValidator.asValidator(context),
                            ),
                          ),

                          // Generated code for this cropCount Widget...
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 16),
                            child: TextFormField(
                              controller: _model.cropCountController,
                              textCapitalization: TextCapitalization.words,
                              obscureText: false,
                              decoration: InputDecoration(
                                labelText: 'Count',
                                labelStyle: FlutterFlowTheme.of(context).labelMedium,
                                hintStyle: FlutterFlowTheme.of(context).labelMedium,
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).alternate,
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).primary,
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).error,
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).error,
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                filled: true,
                                fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                contentPadding: EdgeInsetsDirectional.fromSTEB(20, 24, 0, 24),
                              ),
                              style: FlutterFlowTheme.of(context).bodyMedium,
                              keyboardType: TextInputType.number,
                              validator: _model.cropCountControllerValidator.asValidator(context),
                            ),
                          )

                        ])
                ),



                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 12.0),
                  child: TextFormField(
                    controller: _model.cropDescriptionController,
                    textCapitalization: TextCapitalization.sentences,
                    obscureText: false,
                    decoration: InputDecoration(
                      labelStyle: FlutterFlowTheme.of(context).labelMedium,
                      hintText: 'Description',
                      hintStyle: FlutterFlowTheme.of(context).labelMedium,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).alternate,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).primary,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).error,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).error,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      filled: true,
                      fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                      contentPadding:
                      EdgeInsetsDirectional.fromSTEB(20.0, 24.0, 0.0, 24.0),
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium,
                    textAlign: TextAlign.start,
                    maxLines: 3,
                    validator: _model.cropDescriptionControllerValidator
                        .asValidator(context),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Align(
                        alignment: AlignmentDirectional(-1, 0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 0),
                          child: Text(
                            'Variations',
                            style: FlutterFlowTheme.of(context).bodyMedium,
                          ),
                        ),
                      ),

            Flexible(
              flex: 1,
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
                          child: TextFormField(
                            controller: _model.variationTextFieldController,
                            onChanged: (_) => EasyDebounce.debounce(
                              '_model.variationTextFieldController',
                              Duration(milliseconds: 2000),
                                  () => setState(() {}),
                            ),
                            autofocus: true,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: 'New variation',
                              labelStyle: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .labelMediumFamily,
                                fontStyle: FontStyle.italic,
                                useGoogleFonts: GoogleFonts.asMap()
                                    .containsKey(FlutterFlowTheme.of(context)
                                    .labelMediumFamily),
                              ),
                              hintText: 'input variation name...',
                              hintStyle: FlutterFlowTheme.of(context).labelMedium,
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).alternate,
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).primary,
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              errorBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              focusedErrorBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              suffixIcon: _model.variationTextFieldController!
                                  .text.isNotEmpty
                                  ? InkWell(
                                onTap: () async {
                                  _model.variationTextFieldController
                                      ?.clear();
                                  setState(() {});
                                },
                                child: Icon(
                                  Icons.clear,
                                  size: 22,
                                ),
                              )
                                  : null,
                            ),
                            style: FlutterFlowTheme.of(context).bodyMedium,
                            minLines: 1,
                            validator: _model
                                .variationTextFieldControllerValidator
                                .asValidator(context),
                          ),
                        ),
                      ),

                      Flexible(
                        flex: 7,
                        child: Align(
                          alignment: AlignmentDirectional(-1, 0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                            child: FFButtonWidget(
                              onPressed: () async {
                                if (_model.variationTextFieldController.text !=
                                    null &&
                                    _model.variationTextFieldController.text !=
                                        '') {
                                  setState(() {
                                    _model.addToVariations(
                                        _model.variationTextFieldController.text);
                                  });
                                  setState(() {
                                    _model.variationTextFieldController?.text =
                                    '';
                                  });
                                  return;
                                } else {
                                  await showDialog(
                                    context: context,
                                    builder: (alertDialogContext) {
                                      return AlertDialog(
                                        title: Text('Invalid'),
                                        content: Text(
                                            'the variation name should not be blank!'),
                                        actions: [
                                          TextButton(
                                            onPressed: () =>
                                                Navigator.pop(alertDialogContext),
                                            child: Text('Ok'),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                  return;
                                }
                              },
                              text: '',
                              icon: Icon(
                                Icons.add_box,
                                size: 15,
                              ),
                              options: FFButtonOptions(
                                height: 40,
                                padding:
                                EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
                                iconPadding:
                                EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                                color: FlutterFlowTheme.of(context).primary,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .titleSmallFamily,
                                  color: Colors.white,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(
                                      FlutterFlowTheme.of(context)
                                          .titleSmallFamily),
                                ),
                                elevation: 3,
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 20),
                  child: Builder(
                    builder: (context) {
                      final variationListView = _model.variations.toList();
                      return ListView.builder(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: variationListView.length,
                        itemBuilder: (context, variationListViewIndex) {
                          final variationListViewItem =
                          variationListView[variationListViewIndex];
                          return Padding(
                            padding:
                            EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Text(
                                    variationListViewItem,
                                    style:
                                    FlutterFlowTheme.of(context).bodyMedium,
                                  ),
                                ),
                                Flexible(
                                  flex: 2,
                                  child: FFButtonWidget(
                                    onPressed: () async {
                                      setState(() {
                                        _model.removeAtIndexFromVariations(
                                            variationListViewIndex);
                                      });
                                    },
                                    text: '',
                                    icon: Icon(
                                      Icons.delete_forever,
                                      size: 15,
                                    ),
                                    options: FFButtonOptions(
                                      height: 40,
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          24, 0, 24, 0),
                                      iconPadding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 0, 0),
                                      color: FlutterFlowTheme.of(context).error,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
                                        fontFamily:
                                        FlutterFlowTheme.of(context)
                                            .titleSmallFamily,
                                        color: Colors.white,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .titleSmallFamily),
                                      ),
                                      elevation: 3,
                                      borderSide: BorderSide(
                                        color: Colors.transparent,
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0, 0.05),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        if (_model.formKey.currentState == null ||
                            !_model.formKey.currentState!.validate()) {
                          return;
                        }
                        _model.isCropNameUnique = await actions.uniqueCropName(
                          _model.cropNameController.text,
                        );
                        if (widget.cropToEdit != null) {
                          if (_model.isCropNameUnique! ||
                              (widget.cropToEdit!.name ==
                                  _model.cropNameController.text)) {
                            final cropsUpdateData = {
                              ...createCropsRecordData(
                                name: _model.cropNameController.text,
                                description:
                                _model.cropDescriptionController.text,
                                count:
                                int.tryParse(_model.cropCountController.text),
                              ),
                              'variation': _model.variations,
                            };
                            await widget.cropToEdit!.reference
                                .update(cropsUpdateData);
                            await showDialog(
                              context: context,
                              builder: (alertDialogContext) {
                                return AlertDialog(
                                  title: Text('Updated'),
                                  content: Text('Crop was updated successfully'),
                                  actions: [
                                    TextButton(
                                      onPressed: () =>
                                          Navigator.pop(alertDialogContext),
                                      child: Text('Ok'),
                                    ),
                                  ],
                                );
                              },
                            );

                            context.pushNamed(
                              'cropsPage',
                              extra: <String, dynamic>{
                                kTransitionInfoKey: TransitionInfo(
                                  hasTransition: true,
                                  transitionType: PageTransitionType.fade,
                                  duration: Duration(milliseconds: 0),
                                ),
                              },
                            );
                          } else {
                            await showDialog(
                              context: context,
                              builder: (alertDialogContext) {
                                return AlertDialog(
                                  title: Text('Record Already Exist!'),
                                  content: Text('Crop Name already exist'),
                                  actions: [
                                    TextButton(
                                      onPressed: () =>
                                          Navigator.pop(alertDialogContext),
                                      child: Text('Dismiss'),
                                    ),
                                  ],
                                );
                              },
                            );
                          }
                        } else {
                          if (_model.isCropNameUnique!) {
                            final cropsCreateData = {
                              ...createCropsRecordData(
                                name: _model.cropNameController.text,
                                description:
                                _model.cropDescriptionController.text,
                                count:
                                int.tryParse(_model.cropCountController.text),
                              ),
                              'dateCreated': FieldValue.serverTimestamp(),
                              'variation': _model.variations,
                            };
                            await CropsRecord.collection.doc().set(cropsCreateData);
                            await showDialog(
                              context: context,
                              builder: (alertDialogContext) {
                                return AlertDialog(
                                  title: Text('Saved'),
                                  content: Text('New crop was added successfully'),
                                  actions: [
                                    TextButton(
                                      onPressed: () =>
                                          Navigator.pop(alertDialogContext),
                                      child: Text('Ok'),
                                    ),
                                  ],
                                );
                              },
                            );

                            context.pushNamed(
                              'cropsPage',
                              extra: <String, dynamic>{
                                kTransitionInfoKey: TransitionInfo(
                                  hasTransition: true,
                                  transitionType: PageTransitionType.fade,
                                  duration: Duration(milliseconds: 0),
                                ),
                              },
                            );
                          } else {
                            await showDialog(
                              context: context,
                              builder: (alertDialogContext) {
                                return AlertDialog(
                                  title: Text('Record Already Exist!'),
                                  content: Text('Crop Name already exist'),
                                  actions: [
                                    TextButton(
                                      onPressed: () =>
                                          Navigator.pop(alertDialogContext),
                                      child: Text('Dismiss'),
                                    ),
                                  ],
                                );
                              },
                            );
                          }
                        }

                        setState(() {});
                      },
                      text: widget.cropToEdit == null? 'Add crop': 'Save Changes',
                      options: FFButtonOptions(
                        width: 270.0,
                        height: 50.0,
                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).primary,
                        textStyle: FlutterFlowTheme.of(context)
                            .titleMedium
                            .override(
                          fontFamily:
                          FlutterFlowTheme.of(context).titleMediumFamily,
                          color: Colors.white,
                          useGoogleFonts: GoogleFonts.asMap().containsKey(
                              FlutterFlowTheme.of(context).titleMediumFamily),
                        ),
                        elevation: 2.0,
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )

      ),
    );
  }
}
