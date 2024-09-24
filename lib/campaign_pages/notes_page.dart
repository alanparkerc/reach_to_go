// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../../constants.dart';
import 'package:flutter/material.dart';
import '../../bottom_nav.dart';

class CampaignNotesPage extends StatefulWidget {
  // final Map<String, dynamic> responseData;
  final dynamic campaign;
  // final FlutterSecureStorage secureStorage;

  const CampaignNotesPage(
      {super.key,
      // required this.responseData,
      // required this.secureStorage,
      required Map<String, dynamic> this.campaign});

  @override
  CampaignNotesState createState() => CampaignNotesState();
}

class CampaignNotesState extends State<CampaignNotesPage> {
  List<Map<String, dynamic>> notesLabels = [];
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    isLoading = true;
    _viewCampNotes();
  }

  void _viewCampNotes() async {
    // final http.Response response = await http.get(
    //   Uri.parse(
    //       '$urlRoot/datafeed/getNotes?id=${widget.campaign['id']}&type=1'),
    //   headers: returnHeaders(widget.responseData['authToken']),
    // );
    // if (response.statusCode == 200) {
    // final responseData = jsonDecode(response.body);
    setState(() {
      // notesLabels = List<Map<String, dynamic>>.from(responseData['data']);
      notesLabels = [];
    });
    // }
    setState(() {
      isLoading = false;
    });
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
                            const SizedBox(
                              height: 6,
                            ),
                            Text(
                              widget.campaign['name'],
                              style: Theme.of(context).textTheme.bodySmall!,
                            ),
                            const SizedBox(height: 12),
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
                                ]),
                            const SizedBox(height: 8),
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
                    const SizedBox(
                      height: 8,
                    ),
                    Expanded(
                        child: notesSection(
                            notesLabels,
                            // widget.responseData,
                            //     widget.secureStorage,
                            widget.campaign,
                            {},
                            {}))
                  ],
                )),
          )),
      bottomNavigationBar: const BottomNavigationBarWidget(
          // responseData: widget.responseData,
          // secureStorage: widget.secureStorage,
          ),
    );
  }
}
