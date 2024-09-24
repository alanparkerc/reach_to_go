import 'package:flutter/material.dart';
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:reach_to_go/constants.dart';
import 'package:reach_to_go/single_pages/single_campaign_page.dart';
import '../bottom_nav.dart';

class SummaryPage extends StatefulWidget {
  // final Map<String, dynamic> responseData;
  final dynamic campaign;
  // final FlutterSecureStorage secureStorage;
  final List items;
  final String? dropdownChoice;

  const SummaryPage(
      {super.key,
      // required this.responseData,
      // required this.secureStorage,
      required Map<String, dynamic> this.campaign,
      required this.items,
      required this.dropdownChoice});

  @override
  SummaryPageState createState() => SummaryPageState();
}

class SummaryPageState extends State<SummaryPage> {
  String? selectedValueNew;
  bool isDropdownOpenNew = false;
  bool returnObjectChanged = false;
  bool showReport = false;
  final GlobalKey dropdownKey = GlobalKey();
  Map<String, dynamic> returnObject = {
    'items': [],
    'adTables': [],
    'keywordTables': [],
    'deviceTables': []
  };

  @override
  void initState() {
    super.initState();
    returnObject['items'] = widget.items;
    selectedValueNew = widget.dropdownChoice;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CAMPAIGNS',
            style: Theme.of(context)
                .textTheme
                .displayLarge!
                .copyWith(color: Colors.white)),
        backgroundColor: Theme.of(context).colorScheme.secondary,
        leading: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            minimumSize: const Size(50, 50), // Button size
            alignment: Alignment.center,
            side: const BorderSide(),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.zero, // Set borderRadius to zero
            ),
          ),
          onPressed: () {
            if (!showReport) {
              if (returnObjectChanged) {
                Navigator.pop(context, returnObject);
              } else {
                Navigator.pop(context);
              }
            }
          },
          child: const Icon(Icons.arrow_back_ios, color: Colors.white),
        ),
      ),
      body: Dismissible(
        direction: DismissDirection.startToEnd,
        onDismissed: (direction) {
          if (direction == DismissDirection.startToEnd) {
            // Dismissed by sliding from right to left, navigate back
            if (!showReport) {
              if (returnObjectChanged) {
                Navigator.pop(context, returnObject);
              } else {
                Navigator.pop(context);
              }
            }
          }
        },
        key: const Key('slideToGoBack'),
        child: SingleChildScrollView(
          child: Padding(
            padding: (MediaQuery.of(context).orientation.name == 'portrait')
                ? const EdgeInsets.all(16.0)
                : const EdgeInsets.fromLTRB(80, 16, 80.0, 16),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(16.0)),
                color: Theme.of(context).colorScheme.surface,

                border: Border.all(
                    color: Colors.black,
                    width: 1.0), // Add border to the ListTile
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                      padding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
                      child: Container(
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.surface,
                          ),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.campaign['name'],
                                  style: Theme.of(context)
                                      .textTheme
                                      .displayMedium!,
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 16, 0, 16),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Status',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodySmall!,
                                          ),
                                          Text(
                                            getStageFromId(
                                                widget.campaign['stageId']),
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyMedium!,
                                          )
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'DMS',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodySmall!,
                                          ),
                                          Text(
                                            (widget.campaign['dmsName'] !=
                                                    'Digital Marketing Specialist')
                                                ? widget.campaign['dmsName']
                                                : 'DMS',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyMedium!,
                                          )
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Platform',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodySmall!,
                                          ),
                                          Text(
                                            widget.campaign['platform'],
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyMedium!,
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      border: Border(
                                        top: BorderSide(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .onSurface),
                                      ),
                                      shape: BoxShape.rectangle),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const SizedBox(
                                        height: 16,
                                      ),
                                      ElevatedButton(
                                          onPressed: () {},
                                          style: ElevatedButton.styleFrom(
                                            padding: const EdgeInsets.fromLTRB(
                                                0.0, 8, 0, 8),
                                            elevation: 0,
                                            backgroundColor: Theme.of(context)
                                                .colorScheme
                                                .surface, // Text color
                                            minimumSize: const Size(
                                                500, 0), // Button size
                                            alignment: Alignment.topLeft,
                                          ),
                                          child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                SizedBox(
                                                  width: (MediaQuery.of(context)
                                                              .orientation
                                                              .name ==
                                                          'portrait')
                                                      ? (MediaQuery.of(context)
                                                              .size
                                                              .width -
                                                          75)
                                                      : (MediaQuery.of(context)
                                                              .size
                                                              .width /
                                                          1.3),
                                                  child: Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          'Summary',
                                                          style:
                                                              Theme.of(context)
                                                                  .textTheme
                                                                  .bodyMedium!,
                                                        ),
                                                        (showReport)
                                                            ? CircularProgressIndicator(
                                                                // Show loading icon when isLoading is true
                                                                valueColor:
                                                                    AlwaysStoppedAnimation<
                                                                        Color>(
                                                                  Theme.of(
                                                                          context)
                                                                      .colorScheme
                                                                      .onSurface,
                                                                ), // Customize color
                                                              )
                                                            : const SizedBox(),
                                                        Column(
                                                          children: <Widget>[
                                                            Container(
                                                              width: (MediaQuery.of(
                                                                              context)
                                                                          .orientation
                                                                          .name ==
                                                                      'portrait')
                                                                  ? (MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .width -
                                                                      245)
                                                                  : (MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .width /
                                                                      3),
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: const Color
                                                                    .fromARGB(
                                                                    48,
                                                                    142,
                                                                    142,
                                                                    142),
                                                                borderRadius: (!isDropdownOpenNew)
                                                                    ? BorderRadius
                                                                        .circular(
                                                                            8.0)
                                                                    : BorderRadius
                                                                        .circular(
                                                                            2.0), // Rounded corners
                                                              ),
                                                              padding:
                                                                  const EdgeInsets
                                                                      .symmetric(
                                                                      horizontal:
                                                                          16.0),
                                                              child: InkWell(
                                                                onTap: () {
                                                                  setState(() {
                                                                    isDropdownOpenNew =
                                                                        !isDropdownOpenNew;
                                                                  });
                                                                },
                                                                child: Row(
                                                                  children: <Widget>[
                                                                    Text(
                                                                      selectedValueNew ??
                                                                          '--Run Report--',
                                                                      style:
                                                                          TextStyle(
                                                                        fontSize:
                                                                            12,
                                                                        fontWeight:
                                                                            FontWeight.normal,
                                                                        color: Theme.of(context)
                                                                            .colorScheme
                                                                            .onSurface,
                                                                      ),
                                                                    ),
                                                                    const Icon(
                                                                      Icons
                                                                          .arrow_drop_down,
                                                                      color: Color.fromARGB(
                                                                          235,
                                                                          142,
                                                                          142,
                                                                          142), // Customize the arrow icon color
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                            if (isDropdownOpenNew)
                                                              Container(
                                                                key:
                                                                    dropdownKey,
                                                                decoration:
                                                                    const BoxDecoration(
                                                                  color: Color
                                                                      .fromARGB(
                                                                          48,
                                                                          142,
                                                                          142,
                                                                          142), // Background color
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .only(
                                                                    bottomLeft:
                                                                        Radius.circular(
                                                                            8.0),
                                                                    bottomRight:
                                                                        Radius.circular(
                                                                            8.0),
                                                                  ),
                                                                ),
                                                                child: Column(
                                                                  children: itemsNew
                                                                      .map((String
                                                                          value) {
                                                                    return InkWell(
                                                                      onTap:
                                                                          () async {
                                                                        setState(
                                                                            () {
                                                                          isDropdownOpenNew =
                                                                              false;
                                                                          showReport =
                                                                              true;
                                                                        });
                                                                        returnObject = await handleDashboardRequest(
                                                                            value,
                                                                            widget.campaign,
                                                                            // widget.responseData,
                                                                            returnObject);
                                                                        setState(
                                                                            () {
                                                                          returnObjectChanged =
                                                                              true;
                                                                          showReport =
                                                                              false;
                                                                          if (returnObject['items']
                                                                              .isNotEmpty) {
                                                                            selectedValueNew =
                                                                                value;
                                                                            returnObject['dropdownChoice'] =
                                                                                selectedValueNew;
                                                                          }
                                                                        });
                                                                      },
                                                                      child:
                                                                          Container(
                                                                        width: (MediaQuery.of(context).orientation.name == 'portrait')
                                                                            ? (MediaQuery.of(context).size.width -
                                                                                245)
                                                                            : (MediaQuery.of(context).size.width /
                                                                                3),
                                                                        padding:
                                                                            const EdgeInsets.symmetric(
                                                                          horizontal:
                                                                              16.0,
                                                                          vertical:
                                                                              8.0,
                                                                        ),
                                                                        child:
                                                                            Text(
                                                                          value,
                                                                          style:
                                                                              TextStyle(
                                                                            fontSize:
                                                                                12,
                                                                            fontWeight:
                                                                                FontWeight.normal,
                                                                            color:
                                                                                Theme.of(context).colorScheme.onSurface,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    );
                                                                  }).toList(),
                                                                ),
                                                              ),
                                                          ],
                                                        ),
                                                      ]),
                                                ),
                                              ])),
                                      const SizedBox(
                                        height: 8,
                                      ),
                                      (returnObjectChanged &&
                                              returnObject['items'].isEmpty)
                                          ? Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      0, 0, 0, 8),
                                              child: Text(
                                                'Unable To Load Campaign\n(Contact DMS For More Information)',
                                                style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.normal,
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .onSurface,
                                                ),
                                              ))
                                          : const SizedBox(),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                              style: const TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.normal,
                                                color: Colors.grey,
                                              ),
                                              widget.campaign['platform']
                                                  .toString()),
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                0, 12, 0, 16),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    const Text(
                                                        style: TextStyle(
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          color: Colors.grey,
                                                        ),
                                                        'Impressions'),
                                                    Text(
                                                      (returnObject['items']
                                                              .isNotEmpty)
                                                          ? returnObject[
                                                              'items'][0]
                                                          : '-',
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodySmall!,
                                                    ),
                                                  ],
                                                ),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    const Text(
                                                        style: TextStyle(
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          color: Colors.grey,
                                                        ),
                                                        'CTR'),
                                                    Text(
                                                      (returnObject['items']
                                                              .isNotEmpty)
                                                          ? returnObject[
                                                              'items'][2]
                                                          : '-',
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodySmall!,
                                                    ),
                                                  ],
                                                ),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    const Text(
                                                        style: TextStyle(
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          color: Colors.grey,
                                                        ),
                                                        'Avg. Daily Cost'),
                                                    Text(
                                                      (returnObject['items']
                                                              .isNotEmpty)
                                                          ? returnObject[
                                                              'items'][4]
                                                          : '-',
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodySmall!,
                                                    ),
                                                  ],
                                                ),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    const Text(
                                                        style: TextStyle(
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          color: Colors.grey,
                                                        ),
                                                        'Leads'),
                                                    Text(
                                                      (returnObject['items']
                                                              .isNotEmpty)
                                                          ? returnObject['items']
                                                                      [6]
                                                                  .substring(
                                                                      0,
                                                                      returnObject['items']
                                                                              [
                                                                              6]
                                                                          .indexOf(
                                                                              "\n")) ??
                                                              '-'
                                                          : '-',
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodySmall!,
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  const Text(
                                                      style: TextStyle(
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        color: Colors.grey,
                                                      ),
                                                      'Clicks'),
                                                  Text(
                                                    (returnObject['items']
                                                            .isNotEmpty)
                                                        ? returnObject['items']
                                                            [1]
                                                        : '-',
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodySmall!,
                                                  ),
                                                ],
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  const Text(
                                                      style: TextStyle(
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        color: Colors.grey,
                                                      ),
                                                      'Cost'),
                                                  Text(
                                                    (returnObject['items']
                                                            .isNotEmpty)
                                                        ? returnObject['items']
                                                            [3]
                                                        : '-',
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodySmall!,
                                                  ),
                                                ],
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  const Text(
                                                      style: TextStyle(
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        color: Colors.grey,
                                                      ),
                                                      'CPC'),
                                                  Text(
                                                    (returnObject['items']
                                                            .isNotEmpty)
                                                        ? returnObject['items']
                                                            [5]
                                                        : '-',
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodySmall!,
                                                  ),
                                                ],
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  const Text(
                                                      style: TextStyle(
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        color: Colors.grey,
                                                      ),
                                                      'Cost/Lead'),
                                                  Text(
                                                    (returnObject['items']
                                                            .isNotEmpty)
                                                        ? returnObject['items']
                                                            [7]
                                                        : '-',
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodySmall!,
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: 16),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ]))),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: const BottomNavigationBarWidget(
          // responseData: widget.responseData,
          // secureStorage: widget.secureStorage,
          ),
    );
  }
}
