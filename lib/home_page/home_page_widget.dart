import '/backend/backend.dart';
import '/components/side_bar_nav_widget.dart';
import '/components/top_nav1_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_charts.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'home_page_model.dart';
export 'home_page_model.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({
    Key? key
  }) : super(key: key);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget>
    with TickerProviderStateMixin {
  late HomePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  late int customerCount = 0;
  late List<int> genderCount = [];
  late List<String> genderLabels = ["Female", "Male"];
  late int employeeCount = 0;
  late int cropsCount = 0;

  List<_ChartData> chartData = <_ChartData>[];

  final animationsMap = {
    'containerOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(0.0, 90.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
    'containerOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(0.0, 90.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
    'containerOnPageLoadAnimation3': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(0.0, 90.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageModel());

    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));

    fetchCounts();

    getDataFromFireStore()
    .then((results) {
      SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
        setState(() {});
      });
    });
  }

  Future<void> getDataFromFireStore() async {
    var minDate;

    await FirebaseFirestore.instance.collection("Profiles").orderBy("dateCreated").limit(1).get().then((value) {
      minDate = value.docs[0].data()['dateCreated'];
    });

    print(minDate);

    List<_ChartData> list = [];

    var result = await countDocumentsByDate();

    result.forEach((date, count) {
      var newChartData = _ChartData(
          // x: DateTime.fromMicrosecondsSinceEpoch(date.millisecondsSinceEpoch),
          x: date,
          y: count);
      list.add(newChartData);
      // Perform additional operations with the date and count
    });

    setState(() {
      chartData = list;
    });
  }

  Future<Map<String, int>> countDocumentsByDate() async {
    // Get a reference to the Firestore collection
    CollectionReference<Map<String, dynamic>> collection =
    FirebaseFirestore.instance.collection('Profiles');

    // Retrieve all documents from the collection
    QuerySnapshot<Map<String, dynamic>> querySnapshot = await collection.get();

    // Initialize a map to store the counts per date
    Map<String, int> countsByDate = {};

    // Process the query results
    List<QueryDocumentSnapshot<Map<String, dynamic>>> documents =
        querySnapshot.docs;

    for (var doc in documents) {
      // Access the document data using doc.data()
      // Example: String documentId = doc.id;
      //          Timestamp createdAt = doc.data()['dateCreated'];
      //          ...

      // Get the dateCreated field value as a DateTime object
      Timestamp timestamp = doc.data()['dateCreated'];
      DateTime createdDate = timestamp.toDate();
      String dateString = DateFormat('yyyy-MM-dd').format(createdDate);

      countsByDate.update(
        dateString,
            (value) => ++value,
        ifAbsent: () => 1,
      );
      // Increment the count for the respective date
      // if (countsByDate.containsKey(timestamp)) {
      //   var count = countsByDate[dateString];
      //   countsByDate[dateString] = count + 1;
      //
      // } else {
      //   countsByDate[dateString] = 1;
      // }
    }

    return countsByDate;
  }



  void fetchCounts() async{
    await FirebaseFirestore.instance.collection("Profiles").count().get().then((value) {
      setState(() {
        customerCount = value.count;
      });
    });

    await FirebaseFirestore.instance.collection("users").count().get().then((value) {
      setState(() {
        employeeCount = value.count;
      });
    });

    await FirebaseFirestore.instance.collection("Crops").count().get().then((value) {
      setState(() {
        cropsCount = value.count;
      });
    });

    var male = 0;
    var female = 0;

    await FirebaseFirestore.instance.collection("Profiles").where("gender", isEqualTo: "male").count().get().then((value) {
      male = value.count;
    });

    await FirebaseFirestore.instance.collection("Profiles").where("gender", isEqualTo: "female").count().get().then((value) {
      female = value.count;
    });

    setState(() {
      genderCount = [female, male];
    });
  }

  @override
  void dispose() {
    _model.dispose();

    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final pieChartColorsList = [Color(0xFFCB0AAF), Color(0xFF0E0ACB)];
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
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
                  oneBG: FlutterFlowTheme.of(context).primaryBackground,
                  oneIcon: Icon(
                    Icons.bar_chart_rounded,
                    color: FlutterFlowTheme.of(context).primary,
                  ),
                  twoBG: FlutterFlowTheme.of(context).secondaryBackground,
                  twoIcon: FaIcon(
                    FontAwesomeIcons.userGear,
                    color: FlutterFlowTheme.of(context).primaryText,
                  ),
                  threeColor: FlutterFlowTheme.of(context).secondaryBackground,
                  threeIcon: FaIcon(
                    FontAwesomeIcons.carrot,
                    color: FlutterFlowTheme.of(context).primaryText,
                  ),
                  fourIcon: FaIcon(
                    FontAwesomeIcons.userGroup,
                  ),
                ),
              ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 24.0, 0.0, 16.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          wrapWithModel(
                            model: _model.topNav1Model,
                            updateCallback: () => setState(() {}),
                            child: TopNav1Widget(),
                          ),
                          Text(
                            'Dashboard',
                            style: FlutterFlowTheme.of(context).headlineSmall,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                      child: Wrap(
                        spacing: 8.0,
                        runSpacing: 8.0,
                        alignment: WrapAlignment.start,
                        crossAxisAlignment: WrapCrossAlignment.start,
                        direction: Axis.horizontal,
                        runAlignment: WrapAlignment.start,
                        verticalDirection: VerticalDirection.down,
                        clipBehavior: Clip.none,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                constraints: BoxConstraints(
                                  maxWidth:
                                      MediaQuery.of(context).size.width * 0.2,
                                ),
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 4.0,
                                      color: Color(0x33000000),
                                      offset: Offset(0.0, 2.0),
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(16.0),
                                ),
                                alignment: AlignmentDirectional(0.0, -1.0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 16.0, 16.0, 16.0),
                                  child: SingleChildScrollView(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Users',
                                          textAlign: TextAlign.start,
                                          style: FlutterFlowTheme.of(context)
                                              .headlineSmall,
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 12.0),
                                          child: Text(
                                            'An overview of all your users on your platform.',
                                            textAlign: TextAlign.start,
                                            style: FlutterFlowTheme.of(context)
                                                .bodySmall,
                                          ),
                                        ),
                                        Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.4,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            borderRadius:
                                                BorderRadius.circular(24.0),
                                          ),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Icon(
                                                Icons
                                                    .supervisor_account_rounded,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                size: 44.0,
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        16.0, 0.0, 0.0, 0.0),
                                                child: Text(
                                                    customerCount.toString(),
                                                  textAlign: TextAlign.center,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .displaySmall,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ).animateOnPageLoad(animationsMap[
                                            'containerOnPageLoadAnimation1']!),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                constraints: BoxConstraints(
                                  maxWidth:
                                      MediaQuery.of(context).size.width * 0.2,
                                ),
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 4.0,
                                      color: Color(0x33000000),
                                      offset: Offset(0.0, 2.0),
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(16.0),
                                ),
                                alignment: AlignmentDirectional(0.0, -1.0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 16.0, 16.0, 16.0),
                                  child: SingleChildScrollView(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Employees',
                                          textAlign: TextAlign.start,
                                          style: FlutterFlowTheme.of(context)
                                              .headlineSmall,
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 12.0),
                                          child: Text(
                                            'An overview of all your employees on your platform.',
                                            textAlign: TextAlign.start,
                                            style: FlutterFlowTheme.of(context)
                                                .bodySmall,
                                          ),
                                        ),
                                        Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.4,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            borderRadius:
                                                BorderRadius.circular(24.0),
                                          ),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              FaIcon(
                                                FontAwesomeIcons.usersGear,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                size: 44.0,
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        16.0, 0.0, 0.0, 0.0),
                                                child: Text(
                                                  employeeCount.toString(),
                                                  textAlign: TextAlign.center,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .displaySmall,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ).animateOnPageLoad(animationsMap[
                                            'containerOnPageLoadAnimation2']!),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                constraints: BoxConstraints(
                                  maxWidth:
                                      MediaQuery.of(context).size.width * 0.2,
                                ),
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 4.0,
                                      color: Color(0x33000000),
                                      offset: Offset(0.0, 2.0),
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(16.0),
                                ),
                                alignment: AlignmentDirectional(0.0, -1.0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 16.0, 16.0, 16.0),
                                  child: SingleChildScrollView(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Crops details',
                                          textAlign: TextAlign.start,
                                          style: FlutterFlowTheme.of(context)
                                              .headlineSmall,
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 12.0),
                                          child: Text(
                                            'An overview of all your crops on your platform.',
                                            textAlign: TextAlign.start,
                                            style: FlutterFlowTheme.of(context)
                                                .bodySmall,
                                          ),
                                        ),
                                        Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.4,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            borderRadius:
                                                BorderRadius.circular(24.0),
                                          ),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              FaIcon(
                                                FontAwesomeIcons.carrot,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                size: 44.0,
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        16.0, 0.0, 0.0, 0.0),
                                                child: Text(
                                                  cropsCount.toString(),
                                                  textAlign: TextAlign.center,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .displaySmall,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ).animateOnPageLoad(animationsMap[
                                            'containerOnPageLoadAnimation3']!),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            height: 300.0,
                            child:
                            SfCartesianChart(
                                title: ChartTitle(text: 'Registration chart'),
                                primaryXAxis: CategoryAxis(),
                                primaryYAxis: NumericAxis(
                                    interval: 1,
                                    title: AxisTitle(text: 'New users'),
                                    rangePadding: ChartRangePadding.additional,
                                    // Assigned a name for the y-axis for customization purposes
                                    name: 'primaryYAxis'
                                ),
                                series: <ChartSeries<_ChartData, String>>[
                                  LineSeries<_ChartData, String>(
                                    // Assigned the data source for the chart series.
                                      dataSource: chartData,
                                      xValueMapper: (_ChartData data, _) => data.x,
                                      yValueMapper: (_ChartData data, _) {
                                        // Converted the date time y-values from the chart data source to millisecondSinceEpoch
                                        // integer values and then mapped to numeric y-axis.
                                        return data.y;
                                      },
                                      dataLabelSettings: DataLabelSettings(isVisible: true),
                                      markerSettings: MarkerSettings(isVisible: true))
                                ]
                            )

                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Column(children: [
                                Text("Customers", style: TextStyle(color: Colors.black)),
                                Text("Male", style: TextStyle(color: Colors.white, backgroundColor: pieChartColorsList[1])),
                                Text("Female", style: TextStyle(color: Colors.white, backgroundColor: pieChartColorsList[0])),
                                Container(
                                  width: MediaQuery.of(context).size.width * 0.5,
                                  height: 300.0,
                                  child: FlutterFlowPieChart(
                                    data: FFPieChartData(
                                      values: genderCount,
                                      colors: pieChartColorsList,
                                      radius: [130.0],
                                      borderWidth: [2.0],
                                      borderColor: [
                                        FlutterFlowTheme.of(context)
                                            .secondaryBackground
                                      ]                            ,
                                    ),

                                    donutHoleRadius: 0.0,
                                    donutHoleColor: Colors.transparent,
                                    sectionLabelType:
                                    PieChartSectionLabelType.percent,
                                    sectionLabelStyle:
                                    FlutterFlowTheme.of(context)
                                        .headlineSmall
                                        .override(
                                      fontFamily:
                                      FlutterFlowTheme.of(context)
                                          .headlineSmallFamily,
                                      color: FlutterFlowTheme.of(context)
                                          .accent3,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                          FlutterFlowTheme.of(context)
                                              .headlineSmallFamily),
                                    ),
                                  ),
                                ),
                              ],)
                            ],
                          ),

                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Class for chart data source, this can be modified based on the data in Firestore
class _ChartData {
  _ChartData({this.x, this.y});
  final String? x;
  final int? y;
}