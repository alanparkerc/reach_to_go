// import 'dart:convert';
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../constants.dart';
import 'package:flutter/material.dart';
import '../bottom_nav.dart';
// import 'package:http/http.dart' as http;
import '../single_pages/single_lead_page.dart';

class LeadsPage extends StatefulWidget {
  // final Map<String, dynamic> responseData;
  // final FlutterSecureStorage secureStorage;

  const LeadsPage({
    super.key,
    // required this.responseData,
    // required this.secureStorage,
  });

  @override
  LeadsPageState createState() => LeadsPageState();
}

class LeadsPageState extends State<LeadsPage> {
  List<Map<String, dynamic>> leadsLabels = [];
  TextEditingController searchController =
      TextEditingController(); // Add this line
  String searchLead = '';
  bool isLoading = true;

  @override
  void initState() {
    setState(() {
      isLoading = true;
    });
    super.initState();
    _fetchLeads();
  }

  void _fetchLeads() async {
    // final http.Response response = await http.post(
    //   Uri.parse('$urlRoot/leads/all'),
    //   headers: returnHeaders(widget.responseData['authToken']),
    //   body: jsonEncode({
    //     'page': 0,
    //   }),
    // );
    // if (response.statusCode == 200) {
    // final responseData = jsonDecode(response.body);
    setState(() {
      // leadsLabels = List<Map<String, dynamic>>.from(responseData['leads']);
      leadsLabels = [];
      isLoading = false;
    });
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('LEADS',
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
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 0.0),
          child: Column(children: [
            SizedBox(
              height: (MediaQuery.of(context).orientation.name == 'portrait')
                  ? (MediaQuery.of(context).size.height * 0.035)
                  : (MediaQuery.of(context).size.height * 0.075),
              child: TextField(
                textAlignVertical: TextAlignVertical.bottom,
                onSubmitted: (value) {
                  setState(() {
                    searchLead = value;
                  });
                },
                controller: searchController,
                decoration: const InputDecoration(
                  fillColor: Color.fromARGB(87, 255, 255, 255),
                  hintText: 'Search...',
                  hintStyle: TextStyle(inherit: false, color: Colors.white),
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  ),
                ),
              ),
            ),
            ((leadsLabels.isEmpty) && (isLoading == false))
                ? SizedBox(
                    width: MediaQuery.of(context).size.width - 60,
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 16,
                        ),
                        Text(
                          'Lead Information Unavailable',
                          style: Theme.of(context).textTheme.headlineSmall,
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Text(
                          'Your campaign has either not generated leads yet, or your brand does not authorize personally identifiable information (PII) to be saved in this system.',
                          style: Theme.of(context).textTheme.bodySmall,
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Text(
                          'Contact your DMS with questions.',
                          style: Theme.of(context).textTheme.bodyMedium,
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                      ],
                    ))
                : const SizedBox(),
            isLoading
                ? CircularProgressIndicator(
                    // Show loading icon when isLoading is true
                    valueColor: AlwaysStoppedAnimation<Color>(Theme.of(context)
                        .colorScheme
                        .onSurface), // Customize color
                  )
                : Expanded(
                    child: ListView.separated(
                    separatorBuilder: (context, index) {
                      return const SizedBox();
                    },
                    itemCount: leadsLabels.length,
                    padding: (MediaQuery.of(context).orientation.name ==
                            'portrait')
                        ? (const EdgeInsets.fromLTRB(0, 16, 0, 128))
                        : (const EdgeInsets.fromLTRB(80.0, 0.0, 80.0, 128.0)),
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
                          leadsLabels[index]['email']
                              .toString()
                              .toLowerCase()
                              .contains(searchLead.toLowerCase()) |
                          leadsLabels[index]['campaignName']
                              .toString()
                              .toLowerCase()
                              .contains(searchLead.toLowerCase()) |
                          leadsLabels[index]['phone']
                              .toString()
                              .toLowerCase()
                              .contains(searchLead.toLowerCase())) {
                        return Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 16),
                            child: ElevatedButton(
                              onPressed: () {
                                // Navigate to the Campaigns page
                                Navigator.push(
                                  context,
                                  PageRouteBuilder(
                                    pageBuilder: (_, __, ___) => SingleLeadPage(
                                      // responseData: widget.responseData,
                                      lead: leadsLabels[index],
                                      // secureStorage: widget.secureStorage,
                                    ),
                                    transitionDuration: const Duration(
                                        seconds: 0), // No animation
                                  ),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Theme.of(context)
                                      .colorScheme
                                      .surface, // Text color
                                  alignment: Alignment.center,
                                  shape: const RoundedRectangleBorder(
                                      side: BorderSide(),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(16.0)))),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 16, 0, 16),
                                    child: Text(
                                      leadsLabels[index]['campaignName'],
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onSurface,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 0, 0, 32),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(children: [
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'Name',
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodySmall!,
                                                    ),
                                                    Text(
                                                      'Email',
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodySmall!,
                                                    ),
                                                    Text(
                                                      'Phone Number',
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodySmall!,
                                                    ),
                                                  ],
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.fromLTRB(
                                                          16, 0, 0, 0),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        leadsLabels[index][
                                                                    'firstName'] +
                                                                ' ' +
                                                                leadsLabels[
                                                                        index][
                                                                    'lastName'] ??
                                                            '',
                                                        style: const TextStyle(
                                                          fontSize: 18,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          color: Colors.grey,
                                                        ),
                                                        overflow: TextOverflow
                                                            .ellipsis, // Add this line to set the overflow behavior
                                                      ),
                                                      Text(
                                                        leadsLabels[index]
                                                                ['email'] ??
                                                            '',

                                                        style: const TextStyle(
                                                          fontSize: 18,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          color: Colors.grey,
                                                        ),
                                                        overflow: TextOverflow
                                                            .ellipsis, // Add this line to set the overflow behavior
                                                      ),
                                                      Text(
                                                        leadsLabels[index]
                                                                ['phone'] ??
                                                            '',
                                                        style: const TextStyle(
                                                          fontSize: 18,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          color: Colors.grey,
                                                        ),
                                                        overflow: TextOverflow
                                                            .ellipsis, // Add this line to set the overflow behavior
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ]),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        0, 12, 0, 8),
                                                child: Row(
                                                  children: [
                                                    Text(
                                                      'Referral Source: ',
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodySmall!,
                                                    ),
                                                    Text(
                                                      leadsLabels[index][
                                                              'referralSource'] ??
                                                          '',

                                                      style: const TextStyle(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        color: Colors.grey,
                                                      ),
                                                      overflow: TextOverflow
                                                          .ellipsis, // Add this line to set the overflow behavior
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Row(children: [
                                                      Text(
                                                        'Received ',
                                                        style: TextStyle(
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          color:
                                                              Theme.of(context)
                                                                  .colorScheme
                                                                  .onSurface,
                                                        ),
                                                      ),
                                                      Text(
                                                        formatDateWithHours(
                                                            leadsLabels[index]
                                                                ['createdAt']),
                                                        style: TextStyle(
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          color:
                                                              Theme.of(context)
                                                                  .colorScheme
                                                                  .onSurface,
                                                        ),
                                                        overflow: TextOverflow
                                                            .ellipsis, // Add this line to set the overflow behavior
                                                      ),
                                                    ]),
                                                    Row(children: [
                                                      Text(
                                                        'View More ',
                                                        style: TextStyle(
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          color:
                                                              Theme.of(context)
                                                                  .colorScheme
                                                                  .onSurface,
                                                        ),
                                                      ),
                                                    ])
                                                  ])
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ));
                      } else {
                        return const SizedBox();
                      }
                    },
                  )),
          ]),
        ),
      ),
      bottomNavigationBar: const BottomNavigationBarWidget(
          // responseData: widget.responseData,
          // secureStorage: widget.secureStorage,
          ),
    );
  }
}
