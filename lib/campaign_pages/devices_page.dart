import 'package:flutter/material.dart';
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:reach_to_go/constants.dart';
import 'package:reach_to_go/single_pages/single_campaign_page.dart';
import '../bottom_nav.dart';

class DevicesPage extends StatefulWidget {
  // final Map<String, dynamic> responseData;
  final dynamic campaign;
  // final FlutterSecureStorage secureStorage;
  final List<Map<String, dynamic>> devicesTable;
  final String? dropdownChoice;

  const DevicesPage(
      {super.key,
      // required this.responseData,
      // required this.secureStorage,
      required Map<String, dynamic> this.campaign,
      required this.devicesTable,
      required this.dropdownChoice});

  @override
  DevicesPageState createState() => DevicesPageState();
}

class DevicesPageState extends State<DevicesPage> {
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
    returnObject['deviceTables'] = widget.devicesTable;
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
                : const EdgeInsets.fromLTRB(80, 16, 80, 16),
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
                                const SizedBox(
                                  height: 16,
                                ),
                                Row(
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
                                const SizedBox(
                                  height: 16,
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
                                                          'Devices',
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
                                          ? Text(
                                              'Unable To Load Campaign\n(Contact DMS For More Information)',
                                              style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.normal,
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .onSurface,
                                              ),
                                            )
                                          : const SizedBox(),
                                      (returnObjectChanged &&
                                              returnObject['items'].isEmpty)
                                          ? const SizedBox(
                                              height: 8,
                                            )
                                          : const SizedBox(),
                                      (returnObject['deviceTables'].isEmpty)
                                          ? Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  '-',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodySmall!,
                                                ),
                                                const SizedBox(height: 12),
                                                Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        const Text(
                                                            style: TextStyle(
                                                              fontSize: 12,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .normal,
                                                              color:
                                                                  Colors.grey,
                                                            ),
                                                            'Impressions'),
                                                        Text(
                                                          '-',
                                                          style:
                                                              Theme.of(context)
                                                                  .textTheme
                                                                  .bodySmall!,
                                                        ),
                                                        const Text(
                                                            style: TextStyle(
                                                              fontSize: 12,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .normal,
                                                              color:
                                                                  Colors.grey,
                                                            ),
                                                            'Cost'),
                                                        Text(
                                                          '-',
                                                          style:
                                                              Theme.of(context)
                                                                  .textTheme
                                                                  .bodySmall!,
                                                        ),
                                                        const Text(
                                                            style: TextStyle(
                                                              fontSize: 12,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .normal,
                                                              color:
                                                                  Colors.grey,
                                                            ),
                                                            'Conv. Rate'),
                                                        Text(
                                                          '-',
                                                          style:
                                                              Theme.of(context)
                                                                  .textTheme
                                                                  .bodySmall!,
                                                        ),
                                                      ],
                                                    ),
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        const Text(
                                                            style: TextStyle(
                                                              fontSize: 12,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .normal,
                                                              color:
                                                                  Colors.grey,
                                                            ),
                                                            'Clicks'),
                                                        Text(
                                                          '-',
                                                          style:
                                                              Theme.of(context)
                                                                  .textTheme
                                                                  .bodySmall!,
                                                        ),
                                                        const Text(
                                                            style: TextStyle(
                                                              fontSize: 12,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .normal,
                                                              color:
                                                                  Colors.grey,
                                                            ),
                                                            'CPC'),
                                                        Text(
                                                          '-',
                                                          style:
                                                              Theme.of(context)
                                                                  .textTheme
                                                                  .bodySmall!,
                                                        ),
                                                      ],
                                                    ),
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        const Text(
                                                            style: TextStyle(
                                                              fontSize: 12,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .normal,
                                                              color:
                                                                  Colors.grey,
                                                            ),
                                                            'CTR'),
                                                        Text(
                                                          '-',
                                                          style:
                                                              Theme.of(context)
                                                                  .textTheme
                                                                  .bodySmall!,
                                                        ),
                                                        const Text(
                                                            style: TextStyle(
                                                              fontSize: 12,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .normal,
                                                              color:
                                                                  Colors.grey,
                                                            ),
                                                            'Leads'),
                                                        Text(
                                                          '-',
                                                          style:
                                                              Theme.of(context)
                                                                  .textTheme
                                                                  .bodySmall!,
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                                const SizedBox(height: 16),
                                              ],
                                            )
                                          : const SizedBox(),
                                      for (int deviceIndex = 0;
                                          deviceIndex <
                                              returnObject['deviceTables']
                                                  .length;
                                          deviceIndex++)
                                        (widget.campaign['platform'] ==
                                                'Google')
                                            ? Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                      style: const TextStyle(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        color: Colors.grey,
                                                      ),
                                                      returnObject['deviceTables']
                                                                  [deviceIndex]
                                                              ['deviceType']
                                                          .toString()),
                                                  const SizedBox(height: 12),
                                                  Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          const Text(
                                                              style: TextStyle(
                                                                fontSize: 12,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                                color:
                                                                    Colors.grey,
                                                              ),
                                                              'Impressions'),
                                                          Text(
                                                            returnObject[
                                                                        'deviceTables']
                                                                    [
                                                                    deviceIndex]
                                                                ['impr'],
                                                            style: Theme.of(
                                                                    context)
                                                                .textTheme
                                                                .bodySmall!,
                                                          ),
                                                          const Text(
                                                              style: TextStyle(
                                                                fontSize: 12,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                                color:
                                                                    Colors.grey,
                                                              ),
                                                              'Cost'),
                                                          Text(
                                                            returnObject[
                                                                        'deviceTables']
                                                                    [
                                                                    deviceIndex]
                                                                ['cost'],
                                                            style: Theme.of(
                                                                    context)
                                                                .textTheme
                                                                .bodySmall!,
                                                          ),
                                                          const Text(
                                                              style: TextStyle(
                                                                fontSize: 12,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                                color:
                                                                    Colors.grey,
                                                              ),
                                                              'Conv. Rate'),
                                                          Text(
                                                            returnObject[
                                                                        'deviceTables']
                                                                    [
                                                                    deviceIndex]
                                                                ['rate'],
                                                            style: Theme.of(
                                                                    context)
                                                                .textTheme
                                                                .bodySmall!,
                                                          ),
                                                        ],
                                                      ),
                                                      Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          const Text(
                                                              style: TextStyle(
                                                                fontSize: 12,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                                color:
                                                                    Colors.grey,
                                                              ),
                                                              'Clicks'),
                                                          Text(
                                                            returnObject[
                                                                        'deviceTables']
                                                                    [
                                                                    deviceIndex]
                                                                ['clicks'],
                                                            style: Theme.of(
                                                                    context)
                                                                .textTheme
                                                                .bodySmall!,
                                                          ),
                                                          const Text(
                                                              style: TextStyle(
                                                                fontSize: 12,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                                color:
                                                                    Colors.grey,
                                                              ),
                                                              'CPC'),
                                                          Text(
                                                            returnObject[
                                                                    'deviceTables']
                                                                [
                                                                deviceIndex]['cpc'],
                                                            style: Theme.of(
                                                                    context)
                                                                .textTheme
                                                                .bodySmall!,
                                                          ),
                                                        ],
                                                      ),
                                                      Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          const Text(
                                                              style: TextStyle(
                                                                fontSize: 12,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                                color:
                                                                    Colors.grey,
                                                              ),
                                                              'CTR'),
                                                          Text(
                                                            returnObject[
                                                                    'deviceTables']
                                                                [
                                                                deviceIndex]['ctr'],
                                                            style: Theme.of(
                                                                    context)
                                                                .textTheme
                                                                .bodySmall!,
                                                          ),
                                                          const Text(
                                                              style: TextStyle(
                                                                fontSize: 12,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                                color:
                                                                    Colors.grey,
                                                              ),
                                                              'Leads'),
                                                          Text(
                                                            returnObject[
                                                                        'deviceTables']
                                                                    [
                                                                    deviceIndex]
                                                                ['leads'],
                                                            style: Theme.of(
                                                                    context)
                                                                .textTheme
                                                                .bodySmall!,
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                  const SizedBox(height: 16),
                                                ],
                                              )
                                            : Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                      style: const TextStyle(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        color: Colors.grey,
                                                      ),
                                                      returnObject['deviceTables']
                                                                  [deviceIndex]
                                                              ['deviceType']
                                                          .toString()),
                                                  const SizedBox(height: 12),
                                                  Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          const Text(
                                                              style: TextStyle(
                                                                fontSize: 12,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                                color:
                                                                    Colors.grey,
                                                              ),
                                                              'Impressions'),
                                                          Text(
                                                            returnObject[
                                                                        'deviceTables']
                                                                    [
                                                                    deviceIndex]
                                                                ['impr'],
                                                            style: Theme.of(
                                                                    context)
                                                                .textTheme
                                                                .bodySmall!,
                                                          ),
                                                          const Text(
                                                              style: TextStyle(
                                                                fontSize: 12,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                                color:
                                                                    Colors.grey,
                                                              ),
                                                              'CPC'),
                                                          Text(
                                                            returnObject[
                                                                    'deviceTables']
                                                                [
                                                                deviceIndex]['cpc'],
                                                            style: Theme.of(
                                                                    context)
                                                                .textTheme
                                                                .bodySmall!,
                                                          ),
                                                        ],
                                                      ),
                                                      Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          const Text(
                                                              style: TextStyle(
                                                                fontSize: 12,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                                color:
                                                                    Colors.grey,
                                                              ),
                                                              'Clicks'),
                                                          Text(
                                                            returnObject[
                                                                        'deviceTables']
                                                                    [
                                                                    deviceIndex]
                                                                ['clicks'],
                                                            style: Theme.of(
                                                                    context)
                                                                .textTheme
                                                                .bodySmall!,
                                                          ),
                                                          const Text(
                                                              style: TextStyle(
                                                                fontSize: 12,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                                color:
                                                                    Colors.grey,
                                                              ),
                                                              'Leads'),
                                                          Text(
                                                            returnObject[
                                                                        'deviceTables']
                                                                    [
                                                                    deviceIndex]
                                                                ['leads'],
                                                            style: Theme.of(
                                                                    context)
                                                                .textTheme
                                                                .bodySmall!,
                                                          ),
                                                        ],
                                                      ),
                                                      Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          const Text(
                                                              style: TextStyle(
                                                                fontSize: 12,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                                color:
                                                                    Colors.grey,
                                                              ),
                                                              'Cost'),
                                                          Text(
                                                            returnObject[
                                                                        'deviceTables']
                                                                    [
                                                                    deviceIndex]
                                                                ['cost'],
                                                            style: Theme.of(
                                                                    context)
                                                                .textTheme
                                                                .bodySmall!,
                                                          ),
                                                          const Text(
                                                              style: TextStyle(
                                                                fontSize: 12,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                                color:
                                                                    Colors.grey,
                                                              ),
                                                              'CPL'),
                                                          Text(
                                                            returnObject[
                                                                    'deviceTables']
                                                                [
                                                                deviceIndex]['cpl'],
                                                            style: Theme.of(
                                                                    context)
                                                                .textTheme
                                                                .bodySmall!,
                                                          ),
                                                        ],
                                                      )
                                                    ],
                                                  ),
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
