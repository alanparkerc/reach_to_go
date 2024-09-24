// import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:reach_to_go/single_pages/single_client_page.dart';
import 'package:flutter/material.dart';
import '../bottom_nav.dart';

class ClientsPage extends StatefulWidget {
  // final Map<String, dynamic> responseData;
  // final FlutterSecureStorage secureStorage;
  final List<Map<String, dynamic>> clientLabels;

  const ClientsPage(
      {super.key,
      // required this.responseData,
      // required this.secureStorage,
      required this.clientLabels});

  @override
  ClientsPageState createState() => ClientsPageState();
}

class ClientsPageState extends State<ClientsPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CLIENTS',
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
        child: Column(children: [
          Expanded(
              child: ListView.separated(
            separatorBuilder: (context, index) {
              return const SizedBox(
                height: 16,
              );
            },
            itemCount: widget.clientLabels.length,
            padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 16.0),
            itemBuilder: (context, index) {
              return Column(children: [
                ElevatedButton(
                  onPressed: () {
                    // Navigate to the Campaigns page
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (_, __, ___) => SingleClientPage(
                          // responseData: widget.responseData,
                          // secureStorage: widget.secureStorage,
                          client: widget.clientLabels[index],
                          isLeading: true,
                        ),
                        transitionDuration:
                            const Duration(seconds: 0), // No animation
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor:
                          Theme.of(context).colorScheme.surface, // Text color
                      minimumSize: const Size(400, 0), // Button size
                      alignment: Alignment.center,
                      side: const BorderSide(),
                      shape: const RoundedRectangleBorder(
                          side: BorderSide(),
                          borderRadius:
                              BorderRadius.all(Radius.circular(16.0)))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 16),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      'Name',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall!,
                                    ),
                                    const SizedBox(
                                      width: 16,
                                    ),
                                    Text(
                                      widget.clientLabels[index]['fullName'] ??
                                          '',
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.normal,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onSurface,
                                      ),
                                      overflow: TextOverflow
                                          .ellipsis, // Add this line to set the overflow behavior
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 8),
                                Row(
                                  children: [
                                    Text(
                                      'Email',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall!,
                                    ),
                                    const SizedBox(
                                      width: 16,
                                    ),
                                    Text(
                                      widget.clientLabels[index]['email'] ?? '',

                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.normal,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onSurface,
                                      ),
                                      overflow: TextOverflow
                                          .ellipsis, // Add this line to set the overflow behavior
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 8),
                                Row(
                                  children: [
                                    Text(
                                      'Phone Number',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall!,
                                    ),
                                    const SizedBox(
                                      width: 16,
                                    ),
                                    Text(
                                      widget.clientLabels[index]['phone'] ?? '',
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.normal,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onSurface,
                                      ),
                                      overflow: TextOverflow
                                          .ellipsis, // Add this line to set the overflow behavior
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 16),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ]);
            },
          )),
        ]),
      ),
      bottomNavigationBar: const BottomNavigationBarWidget(
          // responseData: widget.responseData,
          // secureStorage: widget.secureStorage,
          ),
    );
  }
}
