import 'package:flutter/material.dart';
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:reach_to_go/campaign_pages/notes_page.dart';
import 'package:reach_to_go/campaign_pages/devices_page.dart';
import 'package:reach_to_go/campaign_pages/keywords_page.dart';
import 'package:reach_to_go/campaign_pages/performance_page.dart';
import 'package:reach_to_go/campaign_pages/summary_page.dart';
import '../bottom_nav.dart';
import '../constants.dart';
// import 'package:http/http.dart' as http;
// import 'package:html/parser.dart' as parser;
// import 'package:html/dom.dart' as prefix;

Future<Map<String, dynamic>> handleDashboardRequest(
    String chosenValue,
    Map<String, dynamic> campaign,
    // Map<String, dynamic> responseData,
    Map<String, dynamic> returnObject) async {
  List<Map<String, dynamic>> adTables = [];
  List<Map<String, dynamic>> keywordTables = [];
  List<Map<String, dynamic>> deviceTables = [];
  // DateTime? firstDate;
  // DateTime? secondDate;

  // Map<String, dynamic> dates = findDateRange(chosenValue);
  // String apiFirstDate;
  // String apiSecondDate;
  // if (chosenValue != 'Custom') {
  //   apiFirstDate = dates['firstDate'];
  //   apiSecondDate = dates['secondDate'];
  // } else {
  //   apiFirstDate = formatDateYear(firstDate!);
  //   apiSecondDate = formatDateYear(secondDate!);
  // }

  // final String apiUrl;
  if ((campaign['platform'] == 'Google') &&
      (campaign['platformAccountId'] != null)) {
    var insertAccount = campaign['platformAccountId'].replaceAll('-', '');
    insertAccount = '&AccountID=$insertAccount';
    // apiUrl =
    //     '$urlRoot/Dashboard/AdsAccount?Dashboard=true$insertAccount&CampaignID=${campaign['platformCampaignId']}&Platform=${campaign['platform']}&DateStart=$apiFirstDate&DateStop=$apiSecondDate';
    // } else if (campaign['platformAccountId'] != null) {
    // apiUrl =
    //     '$urlRoot/Dashboard/AdsAccount?Dashboard=true&CampaignID=${campaign['platformCampaignId']}&Platform=${campaign['platform']}&DateStart=$apiFirstDate&DateStop=$apiSecondDate';
  } else {
    return returnObject;
  }
  List items = [
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
  ];
  // final http.Response response = await http.get(
  //   Uri.parse(apiUrl),
  //   headers: returnHeaders(responseData['authToken']),
  // );
  // if (response.statusCode == 200) {
  // final prefix.Document document = parser.parse(response.body);
  // final prefix.Element? printerPage = document.querySelector('.printer-page');
  // if (printerPage != null) {
  // final List<prefix.Element> rows = printerPage.querySelectorAll('tr');
  // final List<prefix.Element> name = printerPage.querySelectorAll('p');

  var i = 0;
  // for (final row in rows) {
  // final List<prefix.Element> cells = row.querySelectorAll('.kpi-val');
  // if (cells.isNotEmpty) {
  // items[0 + (i * 4)] = cells[0].text;
  // items[1 + (i * 4)] = cells[1].text;
  // items[2 + (i * 4)] = cells[2].text;
  // items[3 + (i * 4)] = cells[3].text;

  items[0 + (i * 4)] = '';
  items[1 + (i * 4)] = '';
  items[2 + (i * 4)] = '';
  items[3 + (i * 4)] = '';
  i = 1;
  // }
  // }

  // final List<prefix.Element> totalTables =
  //     document.querySelectorAll('.ad-table');

  // final prefix.Element adTable = totalTables[0];

  // final List<prefix.Element> adTableRows = adTable.querySelectorAll('tr');
  // for (final row in adTableRows) {
  // final List<prefix.Element> cells = row.querySelectorAll('td');
  // if (cells.isNotEmpty && cells.length > 2) {
  if (campaign['platform'] == 'Facebook') {
    Map<String, dynamic> readTable = {};
    // readTable['AdName'] = cells[2].querySelectorAll('strong')[0].text;
    // readTable['clicks'] = cells[3].text;
    // readTable['impr'] = cells[4].text;
    // readTable['leads'] = cells[5].text;
    // readTable['cpl'] = cells[6].text;
    // readTable['freq'] = cells[7].text;

    readTable['AdName'] = '';
    readTable['clicks'] = '';
    readTable['impr'] = '';
    readTable['leads'] = '';
    readTable['cpl'] = '';
    readTable['freq'] = '';

    adTables.add(readTable);
  }
  if (campaign['platform'] == 'Google') {
    Map<String, dynamic> readTable = {};
    // readTable['AdName'] = cells[1].querySelector('span')!.text;

    readTable['AdName'] = '';

    readTable['AdName'] = readTable['AdName']
        .substring(readTable['AdName'].indexOf(RegExp(r'[A-Z][a-z]')));
    // readTable['impr'] = cells[2].text;
    // readTable['clicks'] = cells[3].text;
    // readTable['ctr'] = cells[4].text;
    // readTable['cost'] = cells[5].text;
    // readTable['cpc'] = cells[6].text;
    // readTable['leads'] = cells[7].text;
    // readTable['rate'] = cells[8].text;

    readTable['impr'] = '';
    readTable['clicks'] = '';
    readTable['ctr'] = '';
    readTable['cost'] = '';
    readTable['cpc'] = '';
    readTable['leads'] = '';
    readTable['rate'] = '';

    adTables.add(readTable);
  }
  // }
  // }

  // final prefix.Element keywordTable = totalTables[1];
  // final List<prefix.Element> keyTableRows =
  //     keywordTable.querySelectorAll('tr');
  // for (final row in keyTableRows) {
  // final List<prefix.Element> cells = row.querySelectorAll('td');
  // if (cells.isNotEmpty && cells.length > 2) {
  if (campaign['platform'] == 'Facebook') {
    Map<String, dynamic> readTable = {};
    // readTable['age'] = cells[0].text;
    // readTable['gender'] = cells[1].text;
    // readTable['clicks'] = cells[2].text;
    // readTable['impr'] = cells[3].text;
    // readTable['cpc'] = cells[4].text;
    // readTable['leads'] = cells[5].text;
    // readTable['cpl'] = cells[6].text;

    readTable['age'] = '';
    readTable['gender'] = '';
    readTable['clicks'] = '';
    readTable['impr'] = '';
    readTable['cpc'] = '';
    readTable['leads'] = '';
    readTable['cpl'] = '';

    keywordTables.add(readTable);
  }
  if (campaign['platform'] == 'Google') {
    Map<String, dynamic> readTable = {};
    // readTable['word'] = cells[0].text;
    // readTable['impr'] = cells[1].text;
    // readTable['clicks'] = cells[2].text;
    // readTable['ctr'] = cells[3].text;
    // readTable['cost'] = cells[4].text;
    // readTable['cpc'] = cells[5].text;
    // readTable['leads'] = cells[6].text;
    // readTable['cpl'] = cells[7].text;
    // readTable['rate'] = cells[8].text;

    readTable['word'] = '';
    readTable['impr'] = '';
    readTable['clicks'] = '';
    readTable['ctr'] = '';
    readTable['cost'] = '';
    readTable['cpc'] = '';
    readTable['leads'] = '';
    readTable['cpl'] = '';
    readTable['rate'] = '';

    keywordTables.add(readTable);
  }
  // }
  // }

  // final prefix.Element deviceTable = totalTables[2];
  // final List<prefix.Element> deviceTableRows =
  //     deviceTable.querySelectorAll('tr');
  // for (final row in deviceTableRows) {
  // final List<prefix.Element> cells = row.querySelectorAll('td');
  // if (cells.isNotEmpty && cells.length > 2) {
  if (campaign['platform'] == 'Facebook') {
    Map<String, dynamic> readTable = {};
    // readTable['deviceType'] = cells[0].text;
    // readTable['impr'] = cells[1].text;
    // readTable['clicks'] = cells[2].text;
    // readTable['cost'] = cells[3].text;
    // readTable['cpc'] = cells[4].text;
    // readTable['leads'] =
    //     cells[5].text.substring(cells[5].text.indexOf(RegExp(r'[0-9]')));

    // readTable['cpl'] = cells[6].text;

    readTable['deviceType'] = '';
    readTable['impr'] = '';
    readTable['clicks'] = '';
    readTable['cost'] = '';
    readTable['cpc'] = '';
    readTable['leads'] = '';
    readTable['cpl'] = '';

    deviceTables.add(readTable);
  }
  if (campaign['platform'] == 'Google') {
    Map<String, dynamic> readTable = {};
    // readTable['deviceType'] = cells[0].text;
    // readTable['impr'] = cells[1].text;
    // readTable['clicks'] = cells[2].text;
    // readTable['ctr'] = cells[3].text;
    // readTable['cost'] = cells[4].text;
    // readTable['cpc'] = cells[5].text;
    // readTable['leads'] = cells[6].text;
    // readTable['rate'] = cells[7].text;

    readTable['deviceType'] = '';
    readTable['impr'] = '';
    readTable['clicks'] = '';
    readTable['ctr'] = '';
    readTable['cost'] = '';
    readTable['cpc'] = '';
    readTable['leads'] = '';
    readTable['rate'] = '';

    deviceTables.add(readTable);
  }
  // }
  // }
  // }

  returnObject['items'] = items;
  returnObject['adTables'] = adTables;
  returnObject['keywordTables'] = keywordTables;
  returnObject['deviceTables'] = deviceTables;
  // }
  return returnObject;
}

class SingleCampaignPage extends StatefulWidget {
  // final Map<String, dynamic> responseData;
  final dynamic campaign;
  // final FlutterSecureStorage secureStorage;

  const SingleCampaignPage(
      {super.key,
      // required this.responseData,
      // required this.secureStorage,
      required Map<String, dynamic> this.campaign});

  @override
  SingleCampaignState createState() => SingleCampaignState();
}

class SingleCampaignState extends State<SingleCampaignPage> {
  Map<String, dynamic> returnObject = {
    'items': [],
    'adTables': [],
    'keywordTables': [],
    'deviceTables': []
  };

  bool showReport = false;
  bool doneLoading = false;

  TextEditingController dateRangeController = TextEditingController();

  String? selectedValueNew;
  bool isDropdownOpenNew = false;
  final GlobalKey dropdownKey = GlobalKey();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        title: Text('CAMPAIGNS',
            style: Theme.of(context)
                .textTheme
                .displayLarge!
                .copyWith(color: Colors.white)),
        backgroundColor: Theme.of(context).colorScheme.secondary,
      ),
      body: Dismissible(
        direction: DismissDirection.startToEnd,
        onDismissed: (direction) {
          if (direction == DismissDirection.startToEnd) {
            // Dismissed by sliding from right to left, navigate back
            Navigator.pop(context);
          }
        },
        key: const Key('slideToGoBack'),
        child: Column(
          children: [
            Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surface,
                ),
                child: Padding(
                    padding: (MediaQuery.of(context).size.height <= 932)
                        ? ((MediaQuery.of(context).orientation.name ==
                                'portrait')
                            ? const EdgeInsets.all(32.0)
                            : const EdgeInsets.fromLTRB(80, 32, 80, 32.0))
                        : const EdgeInsets.fromLTRB(32, 64, 32, 32),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.campaign['name'],
                            style: (MediaQuery.of(context).size.height <= 932)
                                ? Theme.of(context).textTheme.displayMedium!
                                : Theme.of(context).textTheme.headlineSmall,
                          ),
                          Padding(
                            padding: (MediaQuery.of(context).size.height <= 932)
                                ? const EdgeInsets.fromLTRB(0, 16, 0, 16)
                                : const EdgeInsets.fromLTRB(0, 32, 0, 64),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Status',
                                      style:
                                          (MediaQuery.of(context).size.height <=
                                                  932)
                                              ? Theme.of(context)
                                                  .textTheme
                                                  .bodySmall!
                                              : Theme.of(context)
                                                  .textTheme
                                                  .displayMedium,
                                    ),
                                    Text(
                                      getStageFromId(
                                          widget.campaign['stageId']),
                                      style:
                                          (MediaQuery.of(context).size.height <=
                                                  932)
                                              ? Theme.of(context)
                                                  .textTheme
                                                  .bodyMedium!
                                              : Theme.of(context)
                                                  .textTheme
                                                  .bodyMedium,
                                    )
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'DMS',
                                      style:
                                          (MediaQuery.of(context).size.height <=
                                                  932)
                                              ? Theme.of(context)
                                                  .textTheme
                                                  .bodySmall!
                                              : Theme.of(context)
                                                  .textTheme
                                                  .displayMedium,
                                    ),
                                    Text(
                                      (widget.campaign['dmsName'] !=
                                              'Digital Marketing Specialist')
                                          ? widget.campaign['dmsName']
                                          : 'DMS',
                                      style:
                                          (MediaQuery.of(context).size.height <=
                                                  932)
                                              ? Theme.of(context)
                                                  .textTheme
                                                  .bodyMedium!
                                              : Theme.of(context)
                                                  .textTheme
                                                  .bodyMedium,
                                    )
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Platform',
                                      style:
                                          (MediaQuery.of(context).size.height <=
                                                  932)
                                              ? Theme.of(context)
                                                  .textTheme
                                                  .bodySmall!
                                              : Theme.of(context)
                                                  .textTheme
                                                  .displayMedium,
                                    ),
                                    Text(
                                      widget.campaign['platform'],
                                      style:
                                          (MediaQuery.of(context).size.height <=
                                                  932)
                                              ? Theme.of(context)
                                                  .textTheme
                                                  .bodyMedium!
                                              : Theme.of(context)
                                                  .textTheme
                                                  .bodyMedium,
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
                                          .onSurface,
                                    ),
                                    bottom: BorderSide(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onSurface,
                                    )),
                                shape: BoxShape.rectangle),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: (MediaQuery.of(context)
                                              .size
                                              .height <=
                                          932)
                                      ? const EdgeInsets.fromLTRB(0, 16, 0, 16)
                                      : const EdgeInsets.fromLTRB(0, 32, 0, 32),
                                  child: ElevatedButton(
                                      onPressed: () async {
                                        if (!showReport) {
                                          var result = await Navigator.push(
                                            context,
                                            PageRouteBuilder(
                                              pageBuilder: (_, __, ___) =>
                                                  SummaryPage(
                                                      // responseData:
                                                      //     widget.responseData,
                                                      // secureStorage:
                                                      //     widget.secureStorage,
                                                      campaign: widget.campaign,
                                                      items:
                                                          (returnObject['items']
                                                                  .isNotEmpty)
                                                              ? returnObject[
                                                                  'items']
                                                              : [],
                                                      dropdownChoice:
                                                          selectedValueNew),
                                              transitionDuration:
                                                  const Duration(
                                                      seconds:
                                                          0), // No animation
                                            ),
                                          );
                                          if (result != null) {
                                            setState(() {
                                              returnObject = result;
                                              selectedValueNew =
                                                  result['dropdownChoice'];
                                              showReport = false;
                                              doneLoading = true;
                                            });
                                          }
                                        }
                                      },
                                      style: ElevatedButton.styleFrom(
                                        padding: const EdgeInsets.fromLTRB(
                                            0.0, 8, 0, 8),
                                        elevation: 0,
                                        backgroundColor: Theme.of(context)
                                            .colorScheme
                                            .surface, // Text color
                                        minimumSize:
                                            const Size(500, 0), // Button size
                                        alignment: Alignment.topLeft,
                                      ),
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            SizedBox(
                                              child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'Summary',
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodyMedium!,
                                                    ),
                                                    Text(
                                                      widget.campaign[
                                                              'platform'] +
                                                          ' campaign summary',
                                                      style: TextStyle(
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        color: Theme.of(context)
                                                            .colorScheme
                                                            .onSurface,
                                                      ),
                                                    ),
                                                  ]),
                                            ),
                                            Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  (!showReport)
                                                      ? Icon(
                                                          Icons
                                                              .arrow_forward_ios,
                                                          color:
                                                              Theme.of(context)
                                                                  .colorScheme
                                                                  .onSurface,
                                                        )
                                                      : CircularProgressIndicator(
                                                          // Show loading icon when isLoading is true
                                                          valueColor:
                                                              AlwaysStoppedAnimation<
                                                                  Color>(
                                                            Theme.of(context)
                                                                .colorScheme
                                                                .onSurface,
                                                          ), // Customize color
                                                        )
                                                ])
                                          ])),
                                ),
                                Padding(
                                  padding: (MediaQuery.of(context)
                                              .size
                                              .height <=
                                          932)
                                      ? const EdgeInsets.fromLTRB(0, 0, 0, 8)
                                      : const EdgeInsets.fromLTRB(0, 0, 0, 32),
                                  child: Column(
                                    children: <Widget>[
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width -
                                                245,
                                        decoration: BoxDecoration(
                                          color: const Color.fromARGB(
                                              48, 142, 142, 142),
                                          borderRadius: (!isDropdownOpenNew)
                                              ? BorderRadius.circular(8.0)
                                              : BorderRadius.circular(
                                                  2.0), // Rounded corners
                                        ),
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 16.0),
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
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.normal,
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .onSurface,
                                                ),
                                              ),
                                              const Icon(
                                                Icons.arrow_drop_down,
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
                                          key: dropdownKey,
                                          decoration: const BoxDecoration(
                                            color: Color.fromARGB(48, 142, 142,
                                                142), // Background color
                                            borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(8.0),
                                              bottomRight: Radius.circular(8.0),
                                            ),
                                          ),
                                          child: Column(
                                            children:
                                                itemsNew.map((String value) {
                                              return InkWell(
                                                onTap: () async {
                                                  setState(() {
                                                    isDropdownOpenNew = false;
                                                    doneLoading = false;
                                                    showReport = true;
                                                  });
                                                  returnObject =
                                                      await handleDashboardRequest(
                                                          value,
                                                          widget.campaign,
                                                          // widget.responseData,
                                                          returnObject);
                                                  setState(() {
                                                    if (returnObject['items']
                                                        .isNotEmpty) {
                                                      selectedValueNew = value;
                                                    }
                                                    doneLoading = true;
                                                    showReport = false;
                                                  });
                                                },
                                                child: Container(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width -
                                                      245,
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                    horizontal: 16.0,
                                                    vertical: 8.0,
                                                  ),
                                                  child: Text(
                                                    value,
                                                    style: TextStyle(
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      color: Theme.of(context)
                                                          .colorScheme
                                                          .onSurface,
                                                    ),
                                                  ),
                                                ),
                                              );
                                            }).toList(),
                                          ),
                                        ),
                                    ],
                                  ),
                                ),
                                (doneLoading && returnObject['items'].isEmpty)
                                    ? Padding(
                                        padding: const EdgeInsets.fromLTRB(
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
                                (!showReport && doneLoading)
                                    ? Column(
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
                                            child: SizedBox(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height /
                                                  10,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            const Text(
                                                                style:
                                                                    TextStyle(
                                                                  fontSize: 12,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                  color: Colors
                                                                      .grey,
                                                                ),
                                                                'Impressions'),
                                                            Text(
                                                              (returnObject[
                                                                          'items']
                                                                      .isNotEmpty)
                                                                  ? returnObject[
                                                                      'items'][0]
                                                                  : '-',
                                                              style: Theme.of(
                                                                      context)
                                                                  .textTheme
                                                                  .bodySmall!,
                                                            ),
                                                          ]),
                                                      Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            const Text(
                                                                style:
                                                                    TextStyle(
                                                                  fontSize: 12,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                  color: Colors
                                                                      .grey,
                                                                ),
                                                                'Avg. Daily Cost'),
                                                            Text(
                                                              (returnObject[
                                                                          'items']
                                                                      .isNotEmpty)
                                                                  ? returnObject[
                                                                      'items'][4]
                                                                  : '-',
                                                              style: Theme.of(
                                                                      context)
                                                                  .textTheme
                                                                  .bodySmall!,
                                                            ),
                                                          ]),
                                                    ],
                                                  ),
                                                  Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            const Text(
                                                                style:
                                                                    TextStyle(
                                                                  fontSize: 12,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                  color: Colors
                                                                      .grey,
                                                                ),
                                                                'Clicks'),
                                                            Text(
                                                              (returnObject[
                                                                          'items']
                                                                      .isNotEmpty)
                                                                  ? returnObject[
                                                                      'items'][1]
                                                                  : '-',
                                                              style: Theme.of(
                                                                      context)
                                                                  .textTheme
                                                                  .bodySmall!,
                                                            ),
                                                          ]),
                                                      Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            const Text(
                                                                style:
                                                                    TextStyle(
                                                                  fontSize: 12,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                  color: Colors
                                                                      .grey,
                                                                ),
                                                                'CPC'),
                                                            Text(
                                                              (returnObject[
                                                                          'items']
                                                                      .isNotEmpty)
                                                                  ? returnObject[
                                                                      'items'][5]
                                                                  : '-',
                                                              style: Theme.of(
                                                                      context)
                                                                  .textTheme
                                                                  .bodySmall!,
                                                            ),
                                                          ]),
                                                    ],
                                                  ),
                                                  Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            const Text(
                                                                style:
                                                                    TextStyle(
                                                                  fontSize: 12,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                  color: Colors
                                                                      .grey,
                                                                ),
                                                                'CTR'),
                                                            Text(
                                                              (returnObject[
                                                                          'items']
                                                                      .isNotEmpty)
                                                                  ? returnObject[
                                                                      'items'][2]
                                                                  : '-',
                                                              style: Theme.of(
                                                                      context)
                                                                  .textTheme
                                                                  .bodySmall!,
                                                            ),
                                                          ]),
                                                      Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            const Text(
                                                                style:
                                                                    TextStyle(
                                                                  fontSize: 12,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                  color: Colors
                                                                      .grey,
                                                                ),
                                                                'Leads'),
                                                            Text(
                                                              (returnObject[
                                                                          'items']
                                                                      .isNotEmpty)
                                                                  ? returnObject[
                                                                              'items']
                                                                          [6]
                                                                      .substring(
                                                                          0,
                                                                          returnObject['items'][6]
                                                                              .indexOf("\n"))
                                                                  : '-',
                                                              style: Theme.of(
                                                                      context)
                                                                  .textTheme
                                                                  .bodySmall!,
                                                            ),
                                                          ]),
                                                    ],
                                                  ),
                                                  Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            const Text(
                                                                style:
                                                                    TextStyle(
                                                                  fontSize: 12,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                  color: Colors
                                                                      .grey,
                                                                ),
                                                                'Cost'),
                                                            Text(
                                                              (returnObject[
                                                                          'items']
                                                                      .isNotEmpty)
                                                                  ? returnObject[
                                                                      'items'][3]
                                                                  : '-',
                                                              style: Theme.of(
                                                                      context)
                                                                  .textTheme
                                                                  .bodySmall!,
                                                            ),
                                                          ]),
                                                      Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            const Text(
                                                                style:
                                                                    TextStyle(
                                                                  fontSize: 12,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                  color: Colors
                                                                      .grey,
                                                                ),
                                                                'Cost/Lead'),
                                                            Text(
                                                              (returnObject[
                                                                          'items']
                                                                      .isNotEmpty)
                                                                  ? returnObject[
                                                                      'items'][7]
                                                                  : '-',
                                                              style: Theme.of(
                                                                      context)
                                                                  .textTheme
                                                                  .bodySmall!,
                                                            ),
                                                          ]),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      )
                                    : const SizedBox(height: 16),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 16, 0, 16),
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                    color:
                                        Theme.of(context).colorScheme.onSurface,
                                  )),
                                  shape: BoxShape.rectangle),
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(0, 0, 0, 16),
                                child: ElevatedButton(
                                    onPressed: () async {
                                      if (!showReport) {
                                        var result = await Navigator.push(
                                          context,
                                          PageRouteBuilder(
                                            pageBuilder: (_, __, ___) =>
                                                CampaignNotesPage(
                                              // responseData: widget.responseData,
                                              // secureStorage:
                                              //     widget.secureStorage,
                                              campaign: widget.campaign,
                                            ),
                                            transitionDuration: const Duration(
                                                seconds: 0), // No animation
                                          ),
                                        );
                                        if (result != null) {
                                          setState(() {
                                            returnObject = result;
                                            selectedValueNew =
                                                result['dropdownChoice'];
                                            showReport = false;
                                            doneLoading = true;
                                          });
                                        }
                                      }
                                    },
                                    style: ElevatedButton.styleFrom(
                                      padding:
                                          (MediaQuery.of(context).size.height <=
                                                  932)
                                              ? const EdgeInsets.fromLTRB(
                                                  0.0, 8, 0, 8)
                                              : const EdgeInsets.fromLTRB(
                                                  0, 32, 0, 32),
                                      elevation: 0,
                                      backgroundColor: Theme.of(context)
                                          .colorScheme
                                          .surface, // Text color
                                      minimumSize:
                                          const Size(500, 0), // Button size
                                      alignment: Alignment.topLeft,
                                    ),
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                1.5,
                                            child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Notes',
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodyMedium!,
                                                  ),
                                                  Text(
                                                    'Notes added in by your marketing team, updates and meeting notes.',
                                                    style: TextStyle(
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      color: Theme.of(context)
                                                          .colorScheme
                                                          .onSurface,
                                                    ),
                                                  ),
                                                ]),
                                          ),
                                          Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                (!showReport)
                                                    ? Icon(
                                                        Icons.arrow_forward_ios,
                                                        color: Theme.of(context)
                                                            .colorScheme
                                                            .onSurface,
                                                      )
                                                    : const SizedBox()
                                              ])
                                        ])),
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                  color:
                                      Theme.of(context).colorScheme.onSurface,
                                )),
                                shape: BoxShape.rectangle),
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 0, 16),
                              child: ElevatedButton(
                                  onPressed: () async {
                                    if (!showReport) {
                                      var result = await Navigator.push(
                                        context,
                                        PageRouteBuilder(
                                          pageBuilder: (_, __, ___) =>
                                              PerformancePage(
                                                  // responseData:
                                                  //     widget.responseData,
                                                  // secureStorage:
                                                  //     widget.secureStorage,
                                                  campaign: widget.campaign,
                                                  performanceTable:
                                                      (returnObject['adTables']
                                                              .isNotEmpty)
                                                          ? returnObject[
                                                              'adTables']
                                                          : [],
                                                  dropdownChoice:
                                                      selectedValueNew),
                                          transitionDuration: const Duration(
                                              seconds: 0), // No animation
                                        ),
                                      );
                                      if (result != null) {
                                        setState(() {
                                          returnObject = result;
                                          selectedValueNew =
                                              result['dropdownChoice'];
                                          showReport = false;
                                          doneLoading = true;
                                        });
                                      }
                                    }
                                  },
                                  style: ElevatedButton.styleFrom(
                                    padding:
                                        (MediaQuery.of(context).size.height <=
                                                932)
                                            ? const EdgeInsets.fromLTRB(
                                                0.0, 8, 0, 8)
                                            : const EdgeInsets.fromLTRB(
                                                0, 32, 0, 32),
                                    elevation: 0,
                                    backgroundColor: Theme.of(context)
                                        .colorScheme
                                        .surface, // Text color
                                    minimumSize:
                                        const Size(500, 0), // Button size
                                    alignment: Alignment.topLeft,
                                  ),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              1.5,
                                          child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Ad Performance',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyMedium!,
                                                ),
                                                Text(
                                                  'View the performance of specific advertisements.',
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    color: Theme.of(context)
                                                        .colorScheme
                                                        .onSurface,
                                                  ),
                                                ),
                                              ]),
                                        ),
                                        Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              (!showReport)
                                                  ? Icon(
                                                      Icons.arrow_forward_ios,
                                                      color: Theme.of(context)
                                                          .colorScheme
                                                          .onSurface,
                                                    )
                                                  : const SizedBox()
                                            ])
                                      ])),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                    color:
                                        Theme.of(context).colorScheme.onSurface,
                                  )),
                                  shape: BoxShape.rectangle),
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(0, 0, 0, 16),
                                child: ElevatedButton(
                                    onPressed: () async {
                                      if (!showReport) {
                                        var result = await Navigator.push(
                                          context,
                                          PageRouteBuilder(
                                            pageBuilder: (_, __, ___) =>
                                                KeywordsPage(
                                                    // responseData:
                                                    //     widget.responseData,
                                                    // secureStorage:
                                                    //     widget.secureStorage,
                                                    campaign: widget.campaign,
                                                    keywordsTable: (returnObject[
                                                                'keywordTables']
                                                            .isNotEmpty)
                                                        ? returnObject[
                                                            'keywordTables']
                                                        : [],
                                                    dropdownChoice:
                                                        selectedValueNew),
                                            transitionDuration: const Duration(
                                                seconds: 0), // No animation
                                          ),
                                        );
                                        if (result != null) {
                                          setState(() {
                                            returnObject = result;
                                            selectedValueNew =
                                                result['dropdownChoice'];
                                            showReport = false;
                                            doneLoading = true;
                                          });
                                        }
                                      }
                                    },
                                    style: ElevatedButton.styleFrom(
                                      padding:
                                          (MediaQuery.of(context).size.height <=
                                                  932)
                                              ? const EdgeInsets.fromLTRB(
                                                  0.0, 8, 0, 8)
                                              : const EdgeInsets.fromLTRB(
                                                  0, 32, 0, 32),
                                      elevation: 0,
                                      backgroundColor: Theme.of(context)
                                          .colorScheme
                                          .surface, // Text color
                                      minimumSize:
                                          const Size(500, 0), // Button size
                                      alignment: Alignment.topLeft,
                                    ),
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                1.5,
                                            child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    (widget.campaign[
                                                                'platform'] ==
                                                            'Google')
                                                        ? 'Keywords'
                                                        : 'Age Demographics',
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodyMedium!,
                                                  ),
                                                  Text(
                                                    (widget.campaign[
                                                                'platform'] ==
                                                            'Google')
                                                        ? 'View the performance of specific keywords.'
                                                        : 'View the performance based on specific Age Demographics.',
                                                    style: TextStyle(
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      color: Theme.of(context)
                                                          .colorScheme
                                                          .onSurface,
                                                    ),
                                                  ),
                                                ]),
                                          ),
                                          Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                (!showReport)
                                                    ? Icon(
                                                        Icons.arrow_forward_ios,
                                                        color: Theme.of(context)
                                                            .colorScheme
                                                            .onSurface,
                                                      )
                                                    : const SizedBox()
                                              ])
                                        ])),
                              ),
                            ),
                          ),
                          Container(
                            decoration: const BoxDecoration(
                                border: Border(), shape: BoxShape.rectangle),
                            child: Padding(
                              padding: (MediaQuery.of(context).size.height <=
                                      932)
                                  ? const EdgeInsets.fromLTRB(0, 16, 0, 0)
                                  : EdgeInsets.fromLTRB(0, 32, 0,
                                      (MediaQuery.of(context).size.height) / 7),
                              child: ElevatedButton(
                                  onPressed: () async {
                                    if (!showReport) {
                                      var result = await Navigator.push(
                                        context,
                                        PageRouteBuilder(
                                          pageBuilder: (_, __, ___) =>
                                              DevicesPage(
                                                  // responseData:
                                                  //     widget.responseData,
                                                  // secureStorage:
                                                  //     widget.secureStorage,
                                                  campaign: widget.campaign,
                                                  devicesTable: (returnObject[
                                                              'deviceTables']
                                                          .isNotEmpty)
                                                      ? returnObject[
                                                          'deviceTables']
                                                      : [],
                                                  dropdownChoice:
                                                      selectedValueNew),
                                          transitionDuration: const Duration(
                                              seconds: 0), // No animation
                                        ),
                                      );
                                      if (result != null) {
                                        setState(() {
                                          returnObject = result;
                                          selectedValueNew =
                                              result['dropdownChoice'];
                                          showReport = false;
                                          doneLoading = true;
                                        });
                                      }
                                    }
                                  },
                                  style: ElevatedButton.styleFrom(
                                    padding:
                                        (MediaQuery.of(context).size.height <=
                                                932)
                                            ? const EdgeInsets.fromLTRB(
                                                0.0, 8, 0, 8)
                                            : const EdgeInsets.fromLTRB(
                                                0, 32, 0, 32),
                                    elevation: 0,
                                    backgroundColor: Theme.of(context)
                                        .colorScheme
                                        .surface, // Text color
                                    minimumSize:
                                        const Size(500, 0), // Button size
                                    alignment: Alignment.topLeft,
                                  ),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              1.5,
                                          child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Devices',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyMedium!,
                                                ),
                                                Text(
                                                  'View impressions and analytics from different devices.',
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    color: Theme.of(context)
                                                        .colorScheme
                                                        .onSurface,
                                                  ),
                                                ),
                                              ]),
                                        ),
                                        Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              (!showReport)
                                                  ? Icon(
                                                      Icons.arrow_forward_ios,
                                                      color: Theme.of(context)
                                                          .colorScheme
                                                          .onSurface,
                                                    )
                                                  : const SizedBox()
                                            ])
                                      ])),
                            ),
                          )
                        ]))),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavigationBarWidget(
          // responseData: widget.responseData,
          // secureStorage: widget.secureStorage,
          ),
    );
  }
}
