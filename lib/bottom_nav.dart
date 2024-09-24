// import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:reach_to_go/constants.dart';
import 'package:reach_to_go/single_pages/single_client_page.dart';
import '../styles.dart';
import 'package:provider/provider.dart';
import 'main_pages/clients_page.dart';
import 'main_pages/home_page.dart';
import 'main_pages/campaigns_page.dart';
import 'main_pages/leads_page.dart';
import 'main_pages/login_page.dart';
import 'package:url_launcher/url_launcher.dart';
// import 'package:http/http.dart' as http;

class BottomNavigationBarWidget extends StatefulWidget {
  // final Map<String, dynamic> responseData;
  // final FlutterSecureStorage secureStorage;

  const BottomNavigationBarWidget({
    super.key,
    // required this.responseData,
    // required this.secureStorage,
  });

  @override
  BottomNavigationBarWidgetState createState() =>
      BottomNavigationBarWidgetState();
}

class BottomNavigationBarWidgetState extends State<BottomNavigationBarWidget>
    with WidgetsBindingObserver {
  List<Map<String, dynamic>> clientLabels = [];
  List clientInfo = [];

  void showFullWidthPopup() {
    final themeProvider = Provider.of<ThemeProvider>(context, listen: false);

    showModalBottomSheet(
      context: context,
      isScrollControlled: true, // Set to true for full-width
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ElevatedButton(
                onPressed: () => logout(
                  context,
                  // widget.secureStorage
                ),
                style: borderButtonStyle(context, false),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Logout',
                      style: Theme.of(context).textTheme.bodySmall!,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () => launchUrl(Uri.parse(
                    'https://franchisefocusedmarketing.com/reach-feedback-form/')), //launchURL
                style: borderButtonStyle(context, false),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Leave Feedback',
                      style: Theme.of(context).textTheme.bodySmall!,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    (themeProvider.themeMode == ThemeMode.dark)
                        ? 'Enable Light Mode'
                        : 'Enable Dark Mode',
                    style: Theme.of(context).textTheme.bodySmall!,
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Switch(
                    value: themeProvider.themeMode == ThemeMode.dark,
                    onChanged: (_) async {
                      themeProvider.toggleTheme();
                      // await widget.secureStorage.write(
                      //     key: 'themeMode',
                      //     value: (themeProvider.themeMode == ThemeMode.dark)
                      //         .toString());
                    },
                  ),
                ],
              ),
              const SizedBox(height: 64),
            ],
          ),
        );
      },
    );
  }

  Future<void> _fetchClients() async {
    // final http.Response response =
    //     await http.post(Uri.parse('$urlRoot/clients/getallclients'),
    //         headers: returnHeaders(widget.responseData['authToken']),
    //         body: jsonEncode({
    //           'pageSize': 100,
    //         }));

    // if (response.statusCode == 200) {
    // clientInfo = jsonDecode(response.body)['data'];
    setState(() {
      // clientLabels = List<Map<String, dynamic>>.from(clientInfo);
      clientLabels = [];
    });
    // }
  }

  void pageReRoute(PageRouteBuilder index) {
    Navigator.push(context, index);
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused ||
        state == AppLifecycleState.detached) {
      // Navigate back to login page when the app is paused or detached
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const LoginPage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final navBarItemWidth = MediaQuery.of(context).size.width / 5;

    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: 0,
      selectedFontSize: 12,
      iconSize: 28,
      unselectedFontSize: 12,
      selectedItemColor: Theme.of(context).colorScheme.onSurface,
      selectedLabelStyle: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.normal,
          color: Theme.of(context).colorScheme.onSurface),
      unselectedItemColor: Theme.of(context).colorScheme.onSurface,
      unselectedLabelStyle: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.normal,
          color: Theme.of(context).colorScheme.onSurface),
      showUnselectedLabels: true,
      items: [
        BottomNavigationBarItem(
          icon: SizedBox(
            width: navBarItemWidth, // Set the fixed width
            child: const Icon(
              Icons.home,
              size: 32,
            ),
          ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: SizedBox(
            width: navBarItemWidth, // Set the fixed width
            child: const Icon(
              Icons.person,
              size: 32,
            ),
          ),
          label: 'Clients',
        ),
        BottomNavigationBarItem(
          icon: SizedBox(
            width: navBarItemWidth, // Set the fixed width
            child: const Icon(
              IconData(0xf68d,
                  fontFamily: CupertinoIcons.iconFont,
                  fontPackage: CupertinoIcons.iconFontPackage),
              size: 32,
            ),
          ),
          label: 'Campaigns',
        ),
        BottomNavigationBarItem(
          icon: SizedBox(
            width: navBarItemWidth, // Set the fixed width
            child: const Icon(
              Icons.bar_chart,
              size: 32,
            ),
          ),
          label: 'Leads',
        ),
        BottomNavigationBarItem(
          icon: SizedBox(
            width: navBarItemWidth, // Set the fixed width
            child: const Icon(
              Icons.apps_rounded,
              size: 32,
            ),
          ),
          label: 'More',
        ),
      ],
      onTap: (index) async {
        switch (index) {
          case 0:
            Navigator.push(
              context,
              PageRouteBuilder(
                pageBuilder: (_, __, ___) => const HomePage(
                    // responseData: widget.responseData,
                    // secureStorage: widget.secureStorage,
                    ),
                transitionDuration: const Duration(seconds: 0), // No animation
              ),
            );
            break;
          case 1:
            // Navigate to the Leads page
            await _fetchClients();
            if (clientLabels.length == 1) {
              pageReRoute(PageRouteBuilder(
                pageBuilder: (_, __, ___) => SingleClientPage(
                  // responseData: widget.responseData,
                  client: clientLabels[0],
                  // secureStorage: widget.secureStorage,
                  isLeading: false,
                ),
                transitionDuration: const Duration(seconds: 0), // No animation
              ));
            } else {
              pageReRoute(
                PageRouteBuilder(
                  pageBuilder: (_, __, ___) => ClientsPage(
                      // responseData: widget.responseData,
                      // secureStorage: widget.secureStorage,
                      clientLabels: clientLabels),
                  transitionDuration:
                      const Duration(seconds: 0), // No animation
                ),
              );
            }
            break;
          case 2:
            // Navigate to the Campaigns page
            pageReRoute(PageRouteBuilder(
              pageBuilder: (_, __, ___) => const CampaignsPage(
                  // responseData: widget.responseData,
                  // secureStorage: widget.secureStorage,
                  ),
              transitionDuration: const Duration(seconds: 0), // No animation
            ));
            break;
          case 3:
            // Navigate to the Leads page
            pageReRoute(
              PageRouteBuilder(
                pageBuilder: (_, __, ___) => const LeadsPage(
                    // responseData: widget.responseData,
                    // secureStorage: widget.secureStorage,
                    ),
                transitionDuration: const Duration(seconds: 0), // No animation
              ),
            );
            break;

          case 4:
            showFullWidthPopup();
            break;
        }
      },
    );
  }
}

void logout(
  BuildContext context,
  // FlutterSecureStorage secureStorage,
) {
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(
      builder: (context) => const LoginPage(),
    ),
  );
}
