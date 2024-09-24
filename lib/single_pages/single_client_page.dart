// import 'dart:convert';
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../constants.dart';
import 'package:flutter/material.dart';
import '../bottom_nav.dart';
// import 'package:http/http.dart' as http;

class SingleClientPage extends StatefulWidget {
  // final Map<String, dynamic> responseData;
  final dynamic client;
  // final FlutterSecureStorage secureStorage;
  final bool isLeading;

  const SingleClientPage(
      {super.key,
      // required this.responseData,
      // required this.secureStorage,
      required Map<String, dynamic> this.client,
      required this.isLeading});

  @override
  SingleClientState createState() => SingleClientState();
}

class SingleClientState extends State<SingleClientPage> {
  List<Map<String, dynamic>> notesLabels = [];
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    isLoading = true;
    _viewClientNotes();
  }

  void _viewClientNotes() async {
    // Removed API Calls for Demo Purposes
    // final http.Response response = await http.get(
    //   Uri.parse('$urlRoot/datafeed/getNotes?id=${widget.client['id']}&type=2'),
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
        title: Text(
            widget.client['firstName'] + " " + widget.client['lastName'],
            style: Theme.of(context)
                .textTheme
                .displayLarge!
                .copyWith(color: Colors.white)),
        backgroundColor: Colors.black,
        automaticallyImplyLeading: widget.isLeading,
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
              ? const EdgeInsets.fromLTRB(16.0, 16.0, 16, 16)
              : const EdgeInsets.fromLTRB(80, 16, 80, 16),
          child: Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(16.0)),
                color: Theme.of(context).colorScheme.surface,
                border: Border.all(), // Add border to the ListTile
              ),
              clipBehavior: Clip.hardEdge,
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
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(0, 12, 0, 16),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Name',
                                  style: Theme.of(context).textTheme.bodySmall!,
                                ),
                                Text(
                                  widget.client['firstName'] +
                                      ' ' +
                                      widget.client['lastName'],
                                  style: Theme.of(context).textTheme.bodySmall!,
                                ),
                              ],
                            ),
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Email',
                                    style:
                                        Theme.of(context).textTheme.bodySmall!,
                                  ),
                                  Text(
                                    widget.client['email'],
                                    style:
                                        Theme.of(context).textTheme.bodySmall!,
                                  ),
                                ]),
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Phone Number',
                                    style:
                                        Theme.of(context).textTheme.bodySmall!,
                                  ),
                                  Text(
                                    widget.client['phone'],
                                    style:
                                        Theme.of(context).textTheme.bodySmall!,
                                  ),
                                ]),
                          ],
                        ),
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
                        : Text(
                            'Notes',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.normal,
                              color: Theme.of(context).colorScheme.onSurface,
                            ),
                          ),
                  ),
                  Expanded(
                      child: notesSection(
                          notesLabels,
                          // widget.responseData,
                          //     widget.secureStorage,
                          {},
                          {},
                          widget.client))
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
