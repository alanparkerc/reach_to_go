// import 'dart:convert';
import 'package:flutter/material.dart';
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:reach_to_go/single_pages/single_campaign_page.dart';
import '../single_pages/single_lead_page.dart';
import 'campaigns_page.dart';
import 'leads_page.dart';
import '../constants.dart';
// import 'package:http/http.dart' as http;
import '../bottom_nav.dart';

class HomePage extends StatefulWidget {
  // final Map<String, dynamic> responseData;
  // Removed Persistent Storage for Demo Purposes
  // final FlutterSecureStorage secureStorage;

  const HomePage({
    super.key,
    // required this.responseData,
    // required this.secureStorage,
  });

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  List<Map<String, dynamic>> leadsLabels = [];
  List<Map<String, dynamic>> buttonLabels = [];

  bool isLoading = false;

  TextEditingController searchController = TextEditingController();
  String searchLead = '';

  bool isDropdownOpen = false;
  String selectedValue = 'View';

  bool hidingInactive = false;
  bool hidingActive = false;

  @override
  void initState() {
    super.initState();
    isLoading = true;
    _fetchNumberCamps();
    _fetchNumberLeads();
    isLoading = false;
  }

  void _fetchNumberCamps() async {
    // Removed API Calls for Demo Purposes
    // final http.Response response = await http.post(
    //     Uri.parse('$urlRoot/campaigns/getallcampaigns'),
    //     headers: returnHeaders(widget.responseData['authToken']),
    //     body: jsonEncode({}));

    // if (response.statusCode == 200) {
    // final responseData = jsonDecode(response.body);
    setState(() {
      // buttonLabels = List<Map<String, dynamic>>.from(responseData['data']);
      buttonLabels = [];
      buttonLabels.sort((a, b) => a['stageId'].compareTo(b['stageId']));
    });
    // }
  }

  void _fetchNumberLeads() async {
    // Removed API Calls for Demo Purposes
    // final http.Response response =
    //     await http.post(Uri.parse('$urlRoot/leads/all'),
    //         headers: returnHeaders(widget.responseData['authToken']),
    //         body: jsonEncode({
    //           'page': 0,
    //         }));

    // if (response.statusCode == 200) {
    //   final responseData = jsonDecode(response.body);
    setState(() {
      // leadsLabels = List<Map<String, dynamic>>.from(responseData['leads']);
      leadsLabels = [];
    });
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HOME',
            style: Theme.of(context)
                .textTheme
                .displayLarge!
                .copyWith(color: Colors.white)),
        automaticallyImplyLeading: false,
        backgroundColor: Theme.of(context).colorScheme.secondary,
      ),
      body: Stack(clipBehavior: Clip.none, children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              SizedBox(
                height: ((MediaQuery.of(context).size.height - 215) * 0.05),
                child: Row(children: [
                  SizedBox(
                    width: (MediaQuery.of(context).size.width * 0.65),
                    child: TextField(
                      textAlignVertical: TextAlignVertical.center,
                      onSubmitted: (value) {
                        setState(() {
                          searchLead = value;
                        });
                      },
                      controller: searchController,
                      decoration: const InputDecoration(
                        fillColor: Color.fromARGB(87, 255, 255, 255),
                        hintText: 'Search...',
                        hintStyle: TextStyle(
                          inherit: false,
                          color: Colors.white,
                        ),
                        prefixIcon: Icon(Icons.search),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(32.0)),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: (MediaQuery.of(context).size.width * 0.35) - 16,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          elevation: 0,
                          backgroundColor: const Color.fromARGB(
                              87, 255, 255, 255), // Text color
                          alignment: Alignment.center,
                          shape: const RoundedRectangleBorder(
                              side: BorderSide(color: Colors.grey, width: 0.1),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(150)))),
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
                                  color:
                                      Theme.of(context).colorScheme.onSurface),
                            )
                          : Text(
                              selectedValue,
                              style: TextStyle(
                                  fontSize: 10,
                                  color:
                                      Theme.of(context).colorScheme.onSurface),
                            ),
                    ),
                  )
                ]),
              ),
              titleSection(
                context,
                isLoading,
                'Campaigns',
                PageRouteBuilder(
                  pageBuilder: (_, __, ___) => const CampaignsPage(
                      // responseData: widget.responseData,
                      // secureStorage: widget.secureStorage,
                      ),
                  transitionDuration:
                      const Duration(seconds: 0), // No animation
                ),
                // widget.responseData,
                // widget.secureStorage
              ),
              campaignsSection(
                context,
                buttonLabels,
                hidingInactive,
                hidingActive,
                searchLead,
                // widget.responseData,
                // widget.secureStorage
              ),
              titleSection(
                context,
                isLoading,
                'Leads',
                PageRouteBuilder(
                  pageBuilder: (_, __, ___) => const LeadsPage(
                      // responseData: widget.responseData,
                      // secureStorage: widget.secureStorage,
                      ),
                  transitionDuration:
                      const Duration(seconds: 0), // No animation
                ),
                // widget.responseData,
                // widget.secureStorage
              ),
              leadsContainer(
                context, leadsLabels, searchLead,
                // widget.responseData, widget.secureStorage
              ),
            ],
          ),
        ),
        if (isDropdownOpen)
          Positioned(
            top: 0,
            right: 0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: dropdownItems.map((item) {
                return (item != 'View')
                    ? ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.grey,
                            alignment: Alignment.center,
                            shape: const RoundedRectangleBorder(
                                side:
                                    BorderSide(color: Colors.grey, width: 0.1),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(150)))),
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
                              fontSize: 8,
                              color: Theme.of(context).colorScheme.onSurface),
                        ),
                      )
                    : const SizedBox();
              }).toList(),
            ),
          ),
      ]),
      bottomNavigationBar: const BottomNavigationBarWidget(
          // responseData: widget.responseData,
          // secureStorage: widget.secureStorage,
          ),
    );
  }
}

Widget campaignButton(
  BuildContext context,
  Map<String, dynamic> buttonLabel,
  // Map<String, dynamic> responseData, FlutterSecureStorage secureStorage
) {
  return ElevatedButton(
    onPressed: () {
      Navigator.push(
        context,
        PageRouteBuilder(
          pageBuilder: (_, __, ___) => SingleCampaignPage(
            // responseData: responseData,
            campaign: buttonLabel,
            // secureStorage: secureStorage,
          ),
          transitionDuration: const Duration(seconds: 0), // No animation
        ),
      );
    },
    style: ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(
          side: const BorderSide(), borderRadius: BorderRadius.circular(25.0)),
      backgroundColor: Theme.of(context).colorScheme.surface, // Text color
      alignment: Alignment.center,
      side: const BorderSide(),
      elevation: 1,
    ),
    child: SizedBox(
        width: (MediaQuery.of(context).size.height <= 932)
            ? ((MediaQuery.of(context).orientation.name == 'portrait')
                ? (MediaQuery.of(context).size.width / 1.5)
                : (MediaQuery.of(context).size.width / 3))
            : (MediaQuery.of(context).size.width / 3),
        child: Padding(
          padding: const EdgeInsets.all(4),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${buttonLabel['name']}',
                style: Theme.of(context).textTheme.bodyMedium!,
                textAlign: TextAlign.start,
                overflow: TextOverflow
                    .ellipsis, // Add this line to set the overflow behavior
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Status',
                        style: Theme.of(context).textTheme.bodySmall!,
                      ),
                      Text(
                        getStageFromId(buttonLabel['stageId']),
                        style: Theme.of(context).textTheme.bodyMedium!,
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'DMS',
                        style: Theme.of(context).textTheme.bodySmall!,
                      ),
                      Text(
                        (buttonLabel['dmsName'] !=
                                'Digital Marketing Specialist')
                            ? buttonLabel['dmsName']
                            : 'DMS',
                        style: Theme.of(context).textTheme.bodyMedium!,
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Platform',
                        style: Theme.of(context).textTheme.bodySmall!,
                      ),
                      Text(
                        buttonLabel['platform'],
                        style: Theme.of(context).textTheme.bodyMedium!,
                      )
                    ],
                  )
                ],
              ),
              Row(
                children: [
                  Text(
                    'View More',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.normal,
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                  ),
                ],
              ),
            ],
          ),
        )),
  );
}

Widget leadsButton(
  BuildContext context,
  int index,
  Map<String, dynamic> leadsLabel,
  // Map<String, dynamic> responseData,
  // FlutterSecureStorage secureStorage
) {
  return ElevatedButton(
    onPressed: () {
      Navigator.push(
        context,
        PageRouteBuilder(
          pageBuilder: (_, __, ___) => SingleLeadPage(
            // responseData: responseData,
            lead: leadsLabel,
            // secureStorage: secureStorage,
          ),
          transitionDuration: const Duration(seconds: 0), // No animation
        ),
      );
    },
    style: ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
      backgroundColor: (index % 2 != 0)
          ? Theme.of(context).colorScheme.surface
          : const Color.fromARGB(150, 211, 211, 211), // Text color
      elevation: 0,
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width / 2.25,
                child: Text(
                  leadsLabel['firstName'] + ' ' + leadsLabel['lastName'] ?? '',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 2.5,
                child: Text(
                  leadsLabel['campaignName'],
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                  overflow: TextOverflow
                      .ellipsis, // Add this line to set the overflow behavior
                ),
              )
            ]),
        SizedBox(
            width: MediaQuery.of(context).size.width / 2.75,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    formatDateWithHours(leadsLabel['createdAt']),
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.normal,
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                    overflow: TextOverflow
                        .ellipsis, // Add this line to set the overflow behavior
                  ),
                  Row(
                    children: [
                      Text(
                        'Referral: ',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                      ),
                      Text(
                        leadsLabel['referralSource'] ?? '',

                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                        overflow: TextOverflow
                            .ellipsis, // Add this line to set the overflow behavior
                      ),
                    ],
                  ),
                ])),
      ],
    ),
  );
}

Widget leadsContainer(
  BuildContext context,
  List<Map<String, dynamic>> leadsLabels,
  String searchLead,
  // Map<String, dynamic> responseData,
  // FlutterSecureStorage secureStorage
) {
  return SizedBox(
    height: ((MediaQuery.of(context).size.height - 215) * 0.45) - 16,
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(),
        color: Theme.of(context).colorScheme.surface,
      ),
      child: Padding(
          padding: const EdgeInsets.all(2),
          child: (leadsLabels.isNotEmpty)
              ? ListView.separated(
                  clipBehavior: Clip.hardEdge,
                  separatorBuilder: (context, index) {
                    return const SizedBox();
                  },
                  itemCount: leadsLabels.length,
                  itemBuilder: (context, index) {
                    if ((searchLead == '') |
                        leadsLabels[index]['firstName']
                            .toString()
                            .toLowerCase()
                            .contains(searchLead.toLowerCase()) |
                        leadsLabels[index]['lastName']
                            .toString()
                            .toLowerCase()
                            .contains(searchLead.toLowerCase()) |
                        leadsLabels[index]['campaignName']
                            .toString()
                            .toLowerCase()
                            .contains(searchLead.toLowerCase())) {
                      return leadsButton(
                        context, index, leadsLabels[index],
                        // responseData, secureStorage
                      );
                    }
                    return const SizedBox();
                  },
                )
              : SizedBox(
                  child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 16, 0, 16),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Lead Information Unavailable',
                            style: Theme.of(context).textTheme.headlineSmall,
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Text(
                            'Your campaign has either not generated leads yet, or your brand does not authorize personally identifiable information (PII) to be saved in this system.',
                            style: Theme.of(context).textTheme.bodySmall,
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Text(
                            'Contact your DMS with questions.',
                            style: Theme.of(context).textTheme.bodyMedium,
                            textAlign: TextAlign.center,
                          ),
                        ],
                      )))),
    ),
  );
}

Widget campaignsSection(
  BuildContext context,
  List<Map<String, dynamic>> buttonLabels,
  bool hidingInactive,
  bool hidingActive,
  String searchLead,
  // Map<String, dynamic> responseData,
  // FlutterSecureStorage secureStorage
) {
  return SizedBox(
      height: ((MediaQuery.of(context).size.height - 215) * 0.3),
      child: ListView.separated(
          clipBehavior: Clip.none,
          scrollDirection: Axis.horizontal,
          separatorBuilder: (context, index) {
            if ((((buttonLabels[index]['stageId'] == 8) &&
                    (hidingInactive == false))) |
                (((buttonLabels[index]['stageId'] == 6) &&
                    (hidingActive == false)))) {
              if ((searchLead == '') |
                  buttonLabels[index]['name']
                      .toString()
                      .toLowerCase()
                      .contains(searchLead.toLowerCase()) |
                  buttonLabels[index]['platform']
                      .toString()
                      .toLowerCase()
                      .contains(searchLead.toLowerCase()) |
                  buttonLabels[index]['dmsName']
                      .toString()
                      .toLowerCase()
                      .contains(searchLead.toLowerCase()) |
                  getStageFromId(buttonLabels[index]['stageId'])
                      .toLowerCase()
                      .contains(searchLead.toLowerCase())) {
                return const SizedBox(width: 32);
              }
              return const SizedBox();
            }
            return const SizedBox();
          },
          itemCount: buttonLabels.length,
          itemBuilder: (context, index) {
            if ((((buttonLabels[index]['stageId'] == 8) &&
                    (hidingInactive == false))) |
                (((buttonLabels[index]['stageId'] == 6) &&
                    (hidingActive == false)))) {
              if ((searchLead == '') |
                  buttonLabels[index]['name']
                      .toString()
                      .toLowerCase()
                      .contains(searchLead.toLowerCase()) |
                  buttonLabels[index]['platform']
                      .toString()
                      .toLowerCase()
                      .contains(searchLead.toLowerCase()) |
                  buttonLabels[index]['dmsName']
                      .toString()
                      .toLowerCase()
                      .contains(searchLead.toLowerCase()) |
                  getStageFromId(buttonLabels[index]['stageId'])
                      .toLowerCase()
                      .contains(searchLead.toLowerCase())) {
                return campaignButton(
                  context, buttonLabels[index],
                  // responseData, secureStorage
                );
              }
              return const SizedBox();
            }
            return const SizedBox();
          }));
}

Widget titleSection(
  BuildContext context,
  bool isLoading,
  String title,
  PageRouteBuilder page,
  // Map<String, dynamic> responseData,
  // FlutterSecureStorage secureStorage
) {
  return SizedBox(
    height: ((MediaQuery.of(context).size.height - 215) * 0.1),
    child: Row(children: [
      Text(
        title, // Customize the table cell content
        style: Theme.of(context).textTheme.headlineSmall!,
      ),
      ElevatedButton(
          onPressed: () {
            Navigator.push(context, page);
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent, // Text color
            alignment: Alignment.center,
            elevation: 0,
          ),
          child: isLoading
              ? CircularProgressIndicator(
                  // Show loading icon when isLoading is true
                  valueColor: AlwaysStoppedAnimation<Color>(Theme.of(context)
                      .colorScheme
                      .onSurface), // Customize color
                )
              : Text(
                  'View All',
                  style: Theme.of(context).textTheme.bodySmall!,
                ))
    ]),
  );
}
