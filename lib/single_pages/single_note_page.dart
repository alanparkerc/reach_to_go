import 'package:flutter/material.dart';
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:reach_to_go/constants.dart';
import '../bottom_nav.dart';

class SingleNotePage extends StatefulWidget {
  // final Map<String, dynamic> responseData;
  // final FlutterSecureStorage secureStorage;
  final Map<String, dynamic> campaign;
  final Map<String, dynamic> lead;
  final Map<String, dynamic> client;
  final List<Map<String, dynamic>> notesLabels;
  final int noteIndex;

  const SingleNotePage(
      {super.key,
      // required this.responseData,
      // required this.secureStorage,
      required this.campaign,
      required this.lead,
      required this.client,
      required this.notesLabels,
      required this.noteIndex});

  @override
  SingleNoteState createState() => SingleNoteState();
}

class SingleNoteState extends State<SingleNotePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            (widget.lead.isEmpty)
                ? 'CAMPAIGNS'
                : (widget.client.isEmpty)
                    ? 'LEADS'
                    : 'CLIENTS',
            style: Theme.of(context)
                .textTheme
                .displayLarge!
                .copyWith(color: Colors.white)),
        automaticallyImplyLeading: true,
        backgroundColor: Theme.of(context).colorScheme.secondary,
      ),
      body: Dismissible(
        movementDuration: const Duration(),
        direction: ((widget.noteIndex != widget.notesLabels.length - 1) &&
                (widget.noteIndex > 0))
            ? DismissDirection.horizontal
            : (widget.noteIndex > 0)
                ? DismissDirection.startToEnd
                : DismissDirection.endToStart,
        onDismissed: (direction) {
          if (direction == DismissDirection.endToStart) {
            if (widget.noteIndex != widget.notesLabels.length - 1) {
              Navigator.push(
                context,
                PageRouteBuilder(
                  pageBuilder: (_, __, ___) => SingleNotePage(
                    // responseData: widget.responseData,
                    // secureStorage: widget.secureStorage,
                    campaign: widget.campaign,
                    lead: widget.lead,
                    notesLabels: widget.notesLabels,
                    noteIndex: widget.noteIndex + 1,
                    client: widget.client,
                  ),
                  transitionDuration:
                      const Duration(seconds: 0), // No animation
                ),
              );
            }
          } else if (direction == DismissDirection.startToEnd) {
            if (widget.noteIndex > 0) {
              Navigator.push(
                context,
                PageRouteBuilder(
                  pageBuilder: (_, __, ___) => SingleNotePage(
                    // responseData: widget.responseData,
                    // secureStorage: widget.secureStorage,
                    campaign: widget.campaign,
                    lead: widget.lead,
                    notesLabels: widget.notesLabels,
                    noteIndex: widget.noteIndex - 1,
                    client: widget.client,
                  ),
                  transitionDuration:
                      const Duration(seconds: 0), // No animation
                ),
              );
            }
          }
        },
        key: UniqueKey(),
        child: Container(
          height: double.infinity,
          padding: (MediaQuery.of(context).orientation.name == 'portrait')
              ? const EdgeInsets.all(16.0)
              : const EdgeInsets.fromLTRB(80, 16, 80, 16),
          color: Theme.of(context).colorScheme.surface,
          child: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(children: [
                  (widget.lead.isEmpty)
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.campaign['name']
                                  .toString(), // Customize the table cell content
                              style: Theme.of(context).textTheme.headlineSmall!,
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(
                              height: 32,
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
                                        (widget.campaign['stageId'] != null)
                                            ? getStageFromId(
                                                widget.campaign['stageId'])
                                            : 'Not applicable',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium!,
                                        overflow: TextOverflow.ellipsis,
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
                                        (widget.campaign['dmsName'] != null)
                                            ? (widget.campaign['dmsName'] !=
                                                    'Digital Marketing Specialist')
                                                ? widget.campaign['dmsName']
                                                : 'DMS'
                                            : 'Not applicable',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium!,
                                        overflow: TextOverflow.ellipsis,
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
                                        (widget.campaign['platform'] != null)
                                            ? widget.campaign['platform']
                                            : 'Not applicable',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium!,
                                        overflow: TextOverflow.ellipsis,
                                      )
                                    ],
                                  )
                                ]),
                            const SizedBox(height: 8),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      formatDateString(widget
                                          .notesLabels[widget.noteIndex]
                                              ['updatedOn']
                                          .toString()), // Customize the table cell content
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall!,
                                      textAlign: TextAlign.center,
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    Icon(
                                      Icons.circle,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onSurface,
                                      size: 8,
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    Text(
                                      widget.notesLabels[widget.noteIndex]
                                              ['assignedUserName']
                                          .toString(), // Customize the table cell content
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall!,
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            Text(
                              widget.notesLabels[widget.noteIndex]['title']
                                  .toString(), // Customize the table cell content
                              style: Theme.of(context).textTheme.bodySmall!,
                              textAlign: TextAlign.start,
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            Text(
                              widget.notesLabels[widget.noteIndex]
                                      ['description']
                                  .toString(), // Customize the table cell content
                              style: Theme.of(context).textTheme.bodySmall!,
                              textAlign: TextAlign.start,
                            ),
                          ],
                        )
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 6,
                            ),
                            (widget.lead['campaignName'] != null)
                                ? Text(
                                    widget.lead['campaignName'],
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineSmall!,
                                  )
                                : const SizedBox(),
                            const SizedBox(height: 12),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Name',
                                  style: Theme.of(context).textTheme.bodySmall!,
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  widget.lead['firstName'],
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Email',
                                  style: Theme.of(context).textTheme.bodySmall!,
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  widget.lead['email'],
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Phone Number',
                                  style: Theme.of(context).textTheme.bodySmall!,
                                ),
                                const SizedBox(
                                  width: 8,
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
                            const SizedBox(
                              height: 8,
                            ),
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        'Referral Source',
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.normal,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onSurface,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 4,
                                      ),
                                      (widget.lead['referralSource'] != null)
                                          ? Text(
                                              widget.lead['referralSource'],
                                              style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.normal,
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .onSurface,
                                              ),
                                            )
                                          : const SizedBox(),
                                    ],
                                  ),
                                  (widget.lead['createdAt'] != null)
                                      ? Row(
                                          children: [
                                            Text(
                                              'Received',
                                              style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.normal,
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .onSurface,
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 4,
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
                                        )
                                      : const SizedBox(),
                                ]),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 8),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          formatDateString(widget
                                              .notesLabels[widget.noteIndex]
                                                  ['updatedOn']
                                              .toString()), // Customize the table cell content
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall!,
                                          textAlign: TextAlign.center,
                                        ),
                                        const SizedBox(
                                          width: 4,
                                        ),
                                        Icon(
                                          Icons.circle,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onSurface,
                                          size: 8,
                                        ),
                                        const SizedBox(
                                          width: 4,
                                        ),
                                        Text(
                                          widget.notesLabels[widget.noteIndex]
                                                  ['assignedUserName']
                                              .toString(), // Customize the table cell content
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall!,
                                          textAlign: TextAlign.center,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  widget.notesLabels[widget.noteIndex]['title']
                                      .toString(), // Customize the table cell content
                                  style: Theme.of(context).textTheme.bodySmall!,
                                  textAlign: TextAlign.start,
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  widget.notesLabels[widget.noteIndex]
                                          ['description']
                                      .toString(), // Customize the table cell content
                                  style: Theme.of(context).textTheme.bodySmall!,
                                  textAlign: TextAlign.start,
                                ),
                              ],
                            ),
                          ],
                        ),
                  SizedBox(height: MediaQuery.of(context).size.height / 6),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      (widget.noteIndex != 0)
                          ? ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  PageRouteBuilder(
                                    pageBuilder: (_, __, ___) => SingleNotePage(
                                      // responseData: widget.responseData,
                                      // secureStorage: widget.secureStorage,
                                      campaign: widget.campaign,
                                      lead: widget.lead,
                                      notesLabels: widget.notesLabels,
                                      noteIndex: widget.noteIndex - 1,
                                      client: widget.client,
                                    ),
                                    transitionDuration: const Duration(
                                        seconds: 0), // No animation
                                  ),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                elevation: 0,
                                backgroundColor:
                                    Theme.of(context).colorScheme.surface,
                              ),
                              child: Icon(
                                Icons.arrow_back_ios,
                                color: Theme.of(context).colorScheme.onSurface,
                              ))
                          : const SizedBox(),
                      (widget.noteIndex != widget.notesLabels.length - 1)
                          ? ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  PageRouteBuilder(
                                    pageBuilder: (_, __, ___) => SingleNotePage(
                                      // responseData: widget.responseData,
                                      // secureStorage: widget.secureStorage,
                                      campaign: widget.campaign,
                                      lead: widget.lead,
                                      notesLabels: widget.notesLabels,
                                      noteIndex: widget.noteIndex + 1,
                                      client: widget.client,
                                    ),
                                    transitionDuration: const Duration(
                                        seconds: 0), // No animation
                                  ),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                elevation: 0,
                                backgroundColor:
                                    Theme.of(context).colorScheme.surface,
                              ),
                              child: Icon(
                                Icons.arrow_forward_ios,
                                color: Theme.of(context).colorScheme.onSurface,
                              ))
                          : const SizedBox()
                    ],
                  )
                ])),
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
