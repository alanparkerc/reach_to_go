// import 'dart:convert';
import 'package:flutter/material.dart';
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../single_pages/single_campaign_page.dart';
// import 'package:http/http.dart' as http;
import '../constants.dart';
import '../bottom_nav.dart';

class CampaignsPage extends StatefulWidget {
  // final Map<String, dynamic> responseData;
  // final FlutterSecureStorage secureStorage;

  const CampaignsPage({
    super.key,
    // required this.responseData,
    // required this.secureStorage,
  });

  @override
  CampaignsPageState createState() => CampaignsPageState();
}

class CampaignsPageState extends State<CampaignsPage> {
  List<Map<String, dynamic>> buttonLabels = [];
  TextEditingController searchController = TextEditingController();
  String searchCampaign = '';
  bool isLoading = true;
  bool isDropdownOpen = false;
  String selectedValue = 'View';
  bool hidingInactive = false;
  bool hidingActive = false;

  @override
  void initState() {
    super.initState();
    setState(() {
      isLoading = true;
    });
    _fetchCamps();
  }

  void _fetchCamps() async {
    // final http.Response response =
    //     await http.post(Uri.parse('$urlRoot/campaigns/getallcampaigns'),
    //         headers: returnHeaders(widget.responseData['authToken']),
    //         body: jsonEncode({
    //           'page': 0,
    //         }));
    // if (response.statusCode == 200) {
    //   final responseData = jsonDecode(response.body);
    setState(() {
      // buttonLabels = List<Map<String, dynamic>>.from(responseData['data']);
      buttonLabels = [];
      buttonLabels.sort((a, b) => a['stageId'].compareTo(b['stageId']));
    });
    // }
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        title: Text('CAMPAIGNS',
            style: Theme.of(context)
                .textTheme
                .displayLarge!
                .copyWith(color: Colors.white)),
        backgroundColor: Colors.black,
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
          child: Stack(clipBehavior: Clip.none, children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8),
              child: Column(children: [
                SizedBox(
                  height: ((MediaQuery.of(context).size.height - 215) * 0.05),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: (MediaQuery.of(context).size.width * 0.65),
                          // height: (MediaQuery.of(context).orientation.name ==
                          //         'portrait')
                          //     ? (MediaQuery.of(context).size.height * 0.035)
                          //     : (MediaQuery.of(context).size.height * 0.075),
                          child: TextField(
                            textAlignVertical: TextAlignVertical.center,
                            onSubmitted: (value) {
                              setState(() {
                                searchCampaign = value;
                              });
                            },
                            controller: searchController,
                            decoration: const InputDecoration(
                              fillColor: Color.fromARGB(87, 255, 255, 255),
                              hintText: 'Search...',
                              hintStyle: TextStyle(
                                  inherit: false, color: Colors.white),
                              prefixIcon: Icon(Icons.search),
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(32.0)),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width:
                              (MediaQuery.of(context).size.width * 0.35) - 16,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: const Color.fromARGB(
                                    87, 255, 255, 255), // Text color
                                alignment: Alignment.center,
                                elevation: 0,
                                shape: const RoundedRectangleBorder(
                                    side: BorderSide(
                                        color: Colors.grey, width: 0.1),
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(150)))),
                            onPressed: () {
                              if (isDropdownOpen) {
                                setState(() {
                                  hidingActive = false;
                                  hidingInactive = false;
                                });
                              }
                              setState(() {
                                isDropdownOpen = !isDropdownOpen;
                                selectedValue = 'View';
                              });
                            },
                            child: (isDropdownOpen)
                                ? Text(
                                    'View All',
                                    style: TextStyle(
                                        fontSize: 10,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onSurface),
                                  )
                                : Text(
                                    selectedValue,
                                    style: TextStyle(
                                        fontSize: 10,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onSurface),
                                  ),
                          ),
                        )
                      ]),
                ),
                isLoading
                    ? CircularProgressIndicator(
                        // Show loading icon when isLoading is true
                        valueColor: AlwaysStoppedAnimation<Color>(
                            Theme.of(context)
                                .colorScheme
                                .onSurface), // Customize color
                      )
                    : Expanded(
                        child: ListView.separated(
                            clipBehavior: Clip.hardEdge,
                            padding: const EdgeInsets.fromLTRB(
                                0.0, 16.0, 0.0, 128.0),
                            itemCount: buttonLabels.length,
                            separatorBuilder: (context, index) {
                              return const SizedBox();
                            }, // Add space between buttons
                            itemBuilder: (context, index) {
                              if ((((buttonLabels[index]['stageId'] == 8) &&
                                      (hidingInactive == false))) |
                                  (((buttonLabels[index]['stageId'] == 6) &&
                                      (hidingActive == false)))) {
                                if ((searchCampaign == '') |
                                    buttonLabels[index]['name']
                                        .toString()
                                        .toLowerCase()
                                        .contains(
                                            searchCampaign.toLowerCase()) |
                                    buttonLabels[index]['platform']
                                        .toString()
                                        .toLowerCase()
                                        .contains(
                                            searchCampaign.toLowerCase()) |
                                    buttonLabels[index]['dmsName']
                                        .toString()
                                        .toLowerCase()
                                        .contains(
                                            searchCampaign.toLowerCase())) {
                                  return Padding(
                                      padding: (MediaQuery.of(context)
                                                  .orientation
                                                  .name ==
                                              'portrait')
                                          ? (const EdgeInsets.fromLTRB(
                                              0, 0, 0, 16))
                                          : (const EdgeInsets.fromLTRB(
                                              80, 0, 80, 16)),
                                      child: ElevatedButton(
                                          onPressed: () {
                                            // Navigate to the Campaigns page
                                            Navigator.push(
                                              context,
                                              PageRouteBuilder(
                                                pageBuilder: (_, __, ___) =>
                                                    SingleCampaignPage(
                                                  // responseData:
                                                  //     widget.responseData,
                                                  campaign: buttonLabels[index],
                                                  // secureStorage:
                                                  //     widget.secureStorage,
                                                ),
                                                transitionDuration:
                                                    const Duration(
                                                        seconds:
                                                            0), // No animation
                                              ),
                                            );
                                          },
                                          style: ElevatedButton.styleFrom(
                                              backgroundColor: Theme.of(context)
                                                  .colorScheme
                                                  .surface, // Text color
                                              alignment: Alignment.center,
                                              shape:
                                                  const RoundedRectangleBorder(
                                                      side: BorderSide(),
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  16.0)))),
                                          child: Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                0, 16, 0, 16),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  '${buttonLabels[index]['name']}',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyMedium!,
                                                  textAlign: TextAlign.start,
                                                  overflow: TextOverflow
                                                      .ellipsis, // Add this line to set the overflow behavior
                                                ),
                                                SizedBox(
                                                  height:
                                                      (MediaQuery.of(context)
                                                                  .orientation
                                                                  .name ==
                                                              'portrait')
                                                          ? 16
                                                          : 8,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          'Status',
                                                          style:
                                                              Theme.of(context)
                                                                  .textTheme
                                                                  .bodySmall!,
                                                        ),
                                                        Text(
                                                          getStageFromId(
                                                              buttonLabels[
                                                                      index]
                                                                  ['stageId']),
                                                          style:
                                                              Theme.of(context)
                                                                  .textTheme
                                                                  .bodyMedium!,
                                                        )
                                                      ],
                                                    ),
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          'DMS',
                                                          style:
                                                              Theme.of(context)
                                                                  .textTheme
                                                                  .bodySmall!,
                                                        ),
                                                        Text(
                                                          (buttonLabels[index][
                                                                      'dmsName'] !=
                                                                  'Digital Marketing Specialist')
                                                              ? buttonLabels[
                                                                      index]
                                                                  ['dmsName']
                                                              : 'DMS',
                                                          style:
                                                              Theme.of(context)
                                                                  .textTheme
                                                                  .bodyMedium!,
                                                        )
                                                      ],
                                                    ),
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          'Platform',
                                                          style:
                                                              Theme.of(context)
                                                                  .textTheme
                                                                  .bodySmall!,
                                                        ),
                                                        Text(
                                                          buttonLabels[index]
                                                              ['platform'],
                                                          style:
                                                              Theme.of(context)
                                                                  .textTheme
                                                                  .bodyMedium!,
                                                        )
                                                      ],
                                                    )
                                                  ],
                                                ),
                                                SizedBox(
                                                  height:
                                                      (MediaQuery.of(context)
                                                                  .orientation
                                                                  .name ==
                                                              'portrait')
                                                          ? 32
                                                          : 16,
                                                ),
                                                Row(
                                                  children: [
                                                    Text(
                                                      'View More',
                                                      style: TextStyle(
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        color: Theme.of(context)
                                                            .colorScheme
                                                            .onSurface,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          )));
                                }
                                return const SizedBox();
                              }
                              return const SizedBox();
                            }),
                      ),
              ]),
            ),
            if (isDropdownOpen)
              Positioned(
                top: 60,
                right: (MediaQuery.of(context).orientation.name == 'portrait')
                    ? 16.0
                    : 64,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: dropdownItems.map((item) {
                    return (item != 'View')
                        ? ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.grey,
                                alignment: Alignment.center,
                                shape: const RoundedRectangleBorder(
                                    side: BorderSide(
                                        color: Colors.grey, width: 0.1),
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(150)))),
                            onPressed: () {
                              if (item == 'Inactive') {
                                setState(() {
                                  hidingInactive = false;
                                  hidingActive = true;
                                });
                              } else if (item == 'Active') {
                                setState(() {
                                  hidingInactive = true;
                                  hidingActive = false;
                                });
                              }
                              setState(() {
                                selectedValue = item;
                                isDropdownOpen = false;
                              });
                            },
                            child: Text(
                              item,
                              style: TextStyle(
                                  fontSize: 9,
                                  color:
                                      Theme.of(context).colorScheme.onSurface),
                            ),
                          )
                        : const SizedBox();
                  }).toList(),
                ),
              ),
          ])),
      bottomNavigationBar: const BottomNavigationBarWidget(
          // responseData: widget.responseData,
          // secureStorage: widget.secureStorage,
          ),
    );
  }
}
