// import 'dart:convert';
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../constants.dart';
import 'package:flutter/material.dart';
import '../bottom_nav.dart';
// import 'package:http/http.dart' as http;

class SingleLeadPage extends StatefulWidget {
  // final Map<String, dynamic> responseData;
  final dynamic lead;
  // final FlutterSecureStorage secureStorage;

  const SingleLeadPage(
      {super.key,
      // required this.responseData,
      // required this.secureStorage,
      required Map<String, dynamic> this.lead});

  @override
  SingleLeadState createState() => SingleLeadState();
}

class SingleLeadState extends State<SingleLeadPage> {
  List<Map<String, dynamic>> notesLabels = [];
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    isLoading = true;
    _viewLeadNotes();
  }

  void _viewLeadNotes() async {
    // Removed API Calls for Demo Purposes
    // final http.Response response = await http.get(
    //   Uri.parse('$urlRoot/datafeed/getNotes?id=${widget.lead['id']}&type=3'),
    //   headers: returnHeaders(widget.responseData['authToken']),
    // );
    // if (response.statusCode == 200) {
    //   final responseData = jsonDecode(response.body);
    setState(() {
      // notesLabels = List<Map<String, dynamic>>.from(responseData['data']);
      notesLabels = [];
    });
    // }
    // setState(() {
    //   isLoading = false;
    // });
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
                          border: Border(
                              bottom: BorderSide(
                                  color:
                                      Theme.of(context).colorScheme.onSurface,
                                  width: 1.0))),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 6, 0, 12),
                            child: Text(
                              widget.lead['campaignName'],
                              style: Theme.of(context).textTheme.headlineSmall!,
                            ),
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      widget.lead['firstName'] +
                                          ' ' +
                                          widget.lead['lastName'],
                                      style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.normal,
                                        color: Colors.grey,
                                      ),
                                    ),
                                    Text(
                                      widget.lead['email'],
                                      style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.normal,
                                        color: Colors.grey,
                                      ),
                                    ),
                                    Text(
                                      widget.lead['phone'],
                                      style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.normal,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                              ]),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      'Referral Source: ',
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.normal,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onSurface,
                                      ),
                                    ),
                                    Text(
                                      widget.lead['referralSource'],
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.normal,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onSurface,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      'Received: ',
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.normal,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onSurface,
                                      ),
                                    ),
                                    Text(
                                      formatDateWithHours(
                                          widget.lead['createdAt']),
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.normal,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onSurface,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 8.0),
                    child: isLoading
                        ? CircularProgressIndicator(
                            // Show loading icon when isLoading is true
                            valueColor: AlwaysStoppedAnimation<Color>(
                                Theme.of(context)
                                    .colorScheme
                                    .onSurface), // Customize color
                          )
                        : const Text(
                            'Notes',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.normal,
                              color: Colors.grey,
                            ),
                          ),
                  ),
                  Expanded(
                      child: notesSection(
                          notesLabels,
                          // widget.responseData,
                          //     widget.secureStorage,
                          {},
                          widget.lead,
                          {})),
                ],
              )),
        ),
      ),
      bottomNavigationBar: const BottomNavigationBarWidget(
          // responseData: widget.responseData,
          // secureStorage: widget.secureStorage,
          ),
    );
  }
}
