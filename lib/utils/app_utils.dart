import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

class AppUtils {
  ///Calculate Difference in Hours,Minutes and Days
  String? calculateDifference(String dateTime) {
    String? dif;
    DateFormat dft = DateFormat("yyyy-MM-dd HH:mm:ss");
    DateTime d = dft.parse(dateTime);

    int difference = DateTime.now().difference(d).inSeconds;

    if (difference <= 60) {
      dif = "Now";
    } else if (difference <= 3600) {
      dif = DateTime.now().difference(d).inMinutes.toString();
      if (dif == "1") {
        dif = DateTime.now().difference(d).inMinutes.toString() + " min ago";
      } else {
        dif = DateTime.now().difference(d).inMinutes.toString() + " mins ago";
      }
    } else if (difference <= 86400) {
      dif = DateTime.now().difference(d).inHours.toString();
      if (dif == "1") {
        dif = DateTime.now().difference(d).inHours.toString() + " hour ago";
      } else {
        dif = DateTime.now().difference(d).inHours.toString() + " hours ago";
      }
    } else if (difference <= 2592000) {
      dif = DateTime.now().difference(d).inDays.toString();
      if (dif == "1") {
        dif = DateTime.now().difference(d).inDays.toString() + " day ago";
      } else {
        dif = DateTime.now().difference(d).inDays.toString() + " days ago";
      }
    } else {
      dif = dateTime;
    }
    return dif;
  }

  String? chatDifference(String dateTime) {
    String? dif;
    if (dateTime.contains('/')) {
      DateFormat dft = DateFormat("yyyy/MM/dd HH:mm:ss");
      DateTime d = dft.parse(dateTime);

      int difference = DateTime.now().difference(d).inSeconds;

      if (difference <= 60) {
        dif = "Now";
      } else if (difference <= 3600) {
        dif = DateTime.now().difference(d).inMinutes.toString();
        if (dif == "1") {
          dif = DateTime.now().difference(d).inMinutes.toString() + " min ago";
        } else {
          dif = DateTime.now().difference(d).inMinutes.toString() + " mins ago";
        }
      } else if (difference <= 86400) {
        dif = DateTime.now().difference(d).inHours.toString();
        if (dif == "1") {
          dif = DateTime.now().difference(d).inHours.toString() + " hour ago";
        } else {
          dif = DateTime.now().difference(d).inHours.toString() + " hours ago";
        }
      } else if (difference <= 2592000) {
        dif = DateTime.now().difference(d).inDays.toString();
        if (dif == "1") {
          dif = DateTime.now().difference(d).inDays.toString() + " day ago";
        } else {
          dif = DateTime.now().difference(d).inDays.toString() + " days ago";
        }
      } else {
        dif = dateTime;
      }
    } else {
      DateFormat dft = DateFormat("dd-MM-yyyy HH:mm:ss");
      DateTime d = dft.parse(dateTime);

      int difference = DateTime.now().difference(d).inSeconds;

      if (difference <= 60) {
        dif = "Now";
      } else if (difference <= 3600) {
        dif = DateTime.now().difference(d).inMinutes.toString();
        if (dif == "1") {
          dif = DateTime.now().difference(d).inMinutes.toString() + " min ago";
        } else {
          dif = DateTime.now().difference(d).inMinutes.toString() + " mins ago";
        }
      } else if (difference <= 86400) {
        dif = DateTime.now().difference(d).inHours.toString();
        if (dif == "1") {
          dif = DateTime.now().difference(d).inHours.toString() + " hour ago";
        } else {
          dif = DateTime.now().difference(d).inHours.toString() + " hours ago";
        }
      } else if (difference <= 2592000) {
        dif = DateTime.now().difference(d).inDays.toString();
        if (dif == "1") {
          dif = DateTime.now().difference(d).inDays.toString() + " day ago";
        } else {
          dif = DateTime.now().difference(d).inDays.toString() + " days ago";
        }
      } else {
        dif = dateTime;
      }
    }

    return dif;
  }

  ///Calculate Difference in Hours,Minutes and Days
  String? calculateFormatDifference(String dateTime) {
    String? dif;
    DateFormat dft = DateFormat("dd/MM/yyyy HH:mm:ss");
    DateTime d = dft.parse(dateTime);

    int difference = DateTime.now().difference(d).inSeconds;

    if (difference <= 60) {
      dif = "Now";
    } else if (difference <= 3600) {
      dif = DateTime.now().difference(d).inMinutes.toString();
      if (dif == "1") {
        dif = DateTime.now().difference(d).inMinutes.toString() + " min ago";
      } else {
        dif = DateTime.now().difference(d).inMinutes.toString() + " mins ago";
      }
    } else if (difference <= 86400) {
      dif = DateTime.now().difference(d).inHours.toString();
      if (dif == "1") {
        dif = DateTime.now().difference(d).inHours.toString() + " hour ago";
      } else {
        dif = DateTime.now().difference(d).inHours.toString() + " hours ago";
      }
    } else if (difference <= 2592000) {
      dif = DateTime.now().difference(d).inDays.toString();
      if (dif == "1") {
        dif = DateTime.now().difference(d).inDays.toString() + " day ago";
      } else {
        dif = DateTime.now().difference(d).inDays.toString() + " days ago";
      }
    } else {
      // DateFormat outputFormat = DateFormat("d MMM, yyyy"); // create a new DateFormat object with the desired format
      // dif = outputFormat.format(d);
      dif = dateTime;
    }

    return dif;
  }

  ///Calculate Difference in seconds for event status
  int? calculateDifferenceInSec(String dateTime) {
    print("dateTime= $dateTime");

    DateTime date1 = DateTime.now();
    DateTime date2 = DateTime.parse("2023-02-21 07:00:00");
    Duration diff = date1.difference(date2);
    print("date h = ${diff.inHours}");

    // DateFormat dft = DateFormat("dd-MM-yyyy hh:mm");
    // DateTime d = dft.parse(dateTime.substring(0,dateTime.length - 3));
    // print("d= $d");
    // // DateTime d2 = dft.parse(DateTime.now().toString());
    // // print(d2.toString());
    // // print("d= $d");
    // // print("d= $d2");
    // // print("d= ${d.isBefore(DateTime.now())}");
    //
    // int difference = d.difference(DateTime.now()).inSeconds;
    // print("TimeDifference=${difference}");

    return 1;
  }

  Future<bool> isInternetAvailable() async {
    var connectivity = await (Connectivity().checkConnectivity());
    if (connectivity == ConnectivityResult.none) {
      return Future<bool>.value(false);
    } else {
      return Future<bool>.value(true);
    }
  }

  void launchSocial(String url, String fallbackUrl) async {
    // Don't use canLaunch because of fbProtocolUrl (fb://)
    try {
      bool launched =
          await launch(url, forceSafariVC: true, forceWebView: false);
      if (!launched) {
        await launch(fallbackUrl, forceSafariVC: false, forceWebView: false);
      }
    } catch (e) {
      await launch(fallbackUrl, forceSafariVC: false, forceWebView: false);
    }
  }

  String? splitText(String text) {
    String? letters;
    String txt = text.trim();

    String? a;
    String? b;
    String? c;
    if (txt.contains(" ")) {
      final split = txt.split(" ");

      if (split.length < 3) {
        a = split[0];
        b = split[1];

        letters = a[0] + b[0];
      } else {
        a = split[0];
        b = split[1];
        c = split[2];
        if (b != "") {
          letters = a[0] + b[0] + c[0];
        } else {
          letters = a[0] + c[0];
        }
      }
    } else {
      letters = txt.substring(0, 2);
    }

    return letters;
  }

  String htmlString(String text) {
    String postText = text;
    String finalText = '';
    if (text.contains("{")) {
      final startIndex = text.indexOf("{");
      final endIndex = text.indexOf("}");
      final jsonString = text.substring(startIndex, endIndex + 1);
      final decodedMap = json.decode(jsonString);
      postText = text.replaceAll(
          jsonString, "<b style='color:blue'>@${decodedMap['name']} </b>");
    }
    if (postText.contains('http')) {
      final st = postText.indexOf('http');
      final sub = postText.substring(st, postText.length);
      if (sub.contains(' ')) {
        final start = sub.indexOf(sub);
        final end = sub.indexOf(' ');
        final subs = sub.substring(start, end);
        finalText = postText.replaceAll(subs, "<a href=$subs>$subs </a>");
      } else {
        finalText = postText.replaceAll(sub, "<a href=$sub>$sub </a>");
      }
    } else {
      finalText = postText;
    }
    return finalText;
  }

  String commentString(String text) {
    String postText = text;
    if (text.contains("{")) {
      final startIndex = text.indexOf("{");
      final endIndex = text.indexOf("}");
      final jsonString = text.substring(startIndex, endIndex + 1);
      final decodedMap = json.decode(jsonString);
      postText = text.replaceAll(jsonString, "@${decodedMap['name']}");
    }

    return postText;
  }

  /// Calculate Difference to check wheather event started or not
  ///
  int calculateEventDifference(String dateTime) {
    print("DateBro: ${dateTime}");
    DateFormat dft = DateFormat("dd/MM/yyyy");
    DateTime d = dft.parse(dateTime);

    int difference = d.difference(DateTime.now()).inDays;

    return difference;
  }

  int calculateDiscountDifference(String dateTime) {
    DateFormat dft = DateFormat("dd/MM/yyyy");
    DateTime d = dft.parse(dateTime);

    int difference = d.difference(DateTime.now()).inDays;

    return difference + 1;
  }

  /// Change Date Format coming from api
  String convertDateTimeDisplay(String date) {
    final DateFormat displayFormatter = DateFormat('yyyy-MM-dd HH:mm:ss');
    final DateFormat serverFormatter = DateFormat('dd-MM-yyyy');
    final DateTime displayDate = displayFormatter.parse(date);
    final String formatted = serverFormatter.format(displayDate);
    return formatted;
  }

  ///
  ///
  ///

}
