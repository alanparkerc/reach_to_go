import 'package:flutter/material.dart';
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:intl/intl.dart';
import 'package:reach_to_go/single_pages/single_note_page.dart';

const urlRoot = "https://api.reach.marketing";

Map<String, String> returnHeaders(String authToken) {
  return {
    'Authorization': 'Bearer $authToken',
    'accept': '*/*',
    'Content-Type': 'application/json'
  };
}

final List<String> itemsNew = [
  'Past Week',
  'Current Week',
  'Past 30 Days',
  'Current Month',
  'Previous Month',
  'Current Year',
  'Previous Year'
];

List<String> dropdownItems = ['View', 'Active', 'Inactive'];

class ThemeProvider extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.light;
  ThemeMode get themeMode => _themeMode;

  void toggleTheme() {
    _themeMode =
        _themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}

String getStageFromId(int stageId) {
  switch (stageId) {
    case 1:
      return 'Tech Setup';
    case 2:
      return 'Campaign Set-Up';
    case 3:
      return 'Client Approval';
    case 4:
      return 'QC';
    case 5:
      return 'Waiting to Start';
    case 6:
      return 'Active';
    case 7:
      return 'Paused';
    case 8:
      return 'Inactive';
    case 9:
      return 'Cancelling';
    default:
      return 'other';
  }
}

String formatDateString(String dateTime) {
  DateTime parsedDateTime = DateTime.parse(dateTime);

  // Create a date format pattern for "mm/dd/yyyy"
  final formatter = DateFormat('MM/dd/yyyy');
  // Format the DateTime object using the pattern
  return formatter.format(parsedDateTime);
}

String formatDateWithHours(String dateTime) {
  DateTime parsedDateTime = DateTime.parse(dateTime);
  // Create a date format pattern for "mm/dd/yyyy"
  final formatter = DateFormat('MM/dd/yyyy hh:mm a');
  // Format the DateTime object using the pattern
  return formatter.format(parsedDateTime);
}

String formatDateYear(DateTime dateTime) {
  // Create a date format pattern for "mm/dd/yyyy"
  final formatter = DateFormat('yyyy-MM-dd');
  // Format the DateTime object using the pattern
  return formatter.format(dateTime);
}

String formatDateDateTime(DateTime dateTime) {
  // Create a date format pattern for "mm/dd/yyyy"
  final formatter = DateFormat('MM/dd/yyyy');
  // Format the DateTime object using the pattern
  return formatter.format(dateTime);
}

Map<String, dynamic> findDateRange(String chosenValue) {
  Map<String, dynamic> dates = {};
  DateTime now = DateTime.now();
  switch (chosenValue) {
    case 'Current Week':
      {
        // Find the start of the current week (Sunday)
        DateTime startOfWeek = now.subtract(Duration(days: now.weekday));

        // Find the end of the current week (Saturday)
        DateTime endOfWeek = startOfWeek.add(const Duration(days: 6));
        dates['firstDate'] = formatDateYear(startOfWeek);
        dates['secondDate'] = formatDateYear(endOfWeek);
      }
      break;
    case 'Past Week':
      {
        // Find the start of the current week (Sunday)
        DateTime startOfWeek = now.subtract(Duration(days: now.weekday + 7));

        // Find the end of the current week (Saturday)
        DateTime endOfWeek = startOfWeek.add(const Duration(days: 6));
        dates['firstDate'] = formatDateYear(startOfWeek);
        dates['secondDate'] = formatDateYear(endOfWeek);
      }
      break;
    case 'Past 30 Days':
      {
        // Find the start of the current week (Sunday)
        DateTime startOfWeek = now.subtract(const Duration(days: 30));

        // Find the end of the current week (Saturday)
        DateTime endOfWeek = startOfWeek.add(const Duration(days: 29));
        dates['firstDate'] = formatDateYear(startOfWeek);
        dates['secondDate'] = formatDateYear(endOfWeek);
      }
      break;
    case 'Current Month':
      {
        // Find the start of the current week (Sunday)
        DateTime startOfWeek = now.subtract(Duration(days: now.day - 1));

        // Find the end of the current week (Saturday)
        DateTime endOfWeek = startOfWeek.add(Duration(days: now.day - 2));
        dates['firstDate'] = formatDateYear(startOfWeek);
        dates['secondDate'] = formatDateYear(endOfWeek);
      }
      break;
    case 'Previous Month':
      {
        // Find the start of the current week (Sunday)
        DateTime startOfWeek = DateTime(now.year, now.month - 1, 1);

        // Find the end of the current week (Saturday)
        DateTime endOfWeek = DateTime(now.year, now.month, 0);
        dates['firstDate'] = formatDateYear(startOfWeek);
        dates['secondDate'] = formatDateYear(endOfWeek);
      }
      break;
    case 'Current Year':
      {
        // Find the start of the current week (Sunday)
        DateTime startOfWeek = DateTime(now.year, 1, 1);

        // Find the end of the current week (Saturday)
        DateTime endOfWeek = DateTime(now.year, now.month, now.day)
            .subtract(const Duration(days: 1));
        dates['firstDate'] = formatDateYear(startOfWeek);
        dates['secondDate'] = formatDateYear(endOfWeek);
      }
      break;
    case 'Previous Year':
      {
        // Find the start of the current week (Sunday)
        DateTime startOfWeek = DateTime(now.year - 1, 1, 1);

        // Find the end of the current week (Saturday)
        DateTime endOfWeek = DateTime(now.year - 1, 12, 31);
        dates['firstDate'] = formatDateYear(startOfWeek);
        dates['secondDate'] = formatDateYear(endOfWeek);
      }
      break;
    case 'Custom':
      {}
      break;
  }
  return dates;
}

double checkDeviceSizeAndOrientation(
    BuildContext context, double height, double portrait, double landscape) {
  return (MediaQuery.of(context).size.width <= 932)
      ? ((MediaQuery.of(context).orientation.name == 'portrait')
          ? (MediaQuery.of(context).size.height / portrait)
          : (MediaQuery.of(context).size.height / landscape))
      : (MediaQuery.of(context).size.height / height);
}

double checkDeviceOrientationWidth(
    BuildContext context, double portrait, double landscape) {
  return (MediaQuery.of(context).orientation.name == 'portrait')
      ? (MediaQuery.of(context).size.width - portrait)
      : (MediaQuery.of(context).size.width - landscape);
}

Widget notesSection(
    List<Map<String, dynamic>> notesLabels,
    // Map<String, dynamic> responseData,
    // FlutterSecureStorage secureStorage,
    Map<String, dynamic> campaign,
    Map<String, dynamic> lead,
    Map<String, dynamic> client) {
  return ListView.separated(
    itemCount: notesLabels.length,
    itemBuilder: (context, index) {
      return Container(
        decoration: BoxDecoration(
          color: (index % 2 == 0)
              ? Theme.of(context).colorScheme.surface
              : const Color.fromARGB(
                  100, 158, 158, 158), // Add border to the ListTile
        ),
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SingleNotePage(
                  notesLabels: notesLabels,
                  noteIndex: index,
                  // responseData: responseData,
                  // secureStorage: secureStorage,
                  campaign: campaign,
                  lead: lead,
                  client: const {},
                ),
              ),
            );
          },
          child: ListTile(
            contentPadding:
                (MediaQuery.of(context).orientation.name == 'portrait')
                    ? const EdgeInsets.fromLTRB(16.0, 8, 8.0, 16)
                    : const EdgeInsets.fromLTRB(16.0, 16, 8.0, 16),
            subtitle: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start, // Right justify the text
              children: [
                Row(
                  children: [
                    Text(
                      formatDateString(notesLabels[index]['updatedOn']),
                      style: Theme.of(context).textTheme.bodySmall!,
                    ),
                    const SizedBox(width: 6),
                    Icon(
                      Icons.circle,
                      color: Theme.of(context).colorScheme.onSurface,
                      size: 8,
                    ),
                    const SizedBox(width: 6),
                    Text(
                      "${notesLabels[index]['assignedUserName']}",
                      style: Theme.of(context).textTheme.bodySmall!,
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Text(
                  "${notesLabels[index]['title']}",
                  style: Theme.of(context).textTheme.bodySmall!,
                ),
                const SizedBox(height: 8),
                Text(
                  "${notesLabels[index]['description']}",
                  style: Theme.of(context).textTheme.bodySmall!,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ),
      );
    },
    separatorBuilder: (context, index) {
      return const SizedBox();
    },
  );
}
