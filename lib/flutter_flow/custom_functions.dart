import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import '../backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../auth/auth_util.dart';

List<String> keyWordsMultipleFields(
  String field1,
  String field2,
) {
  // Add your function code here!
  var string1 = field1.toLowerCase();
  var string2 = field2.toLowerCase();
  var inputString = string1 + " " + string2;
  final list = inputString.split(" ");
  var keywords = [
    " ",
    string1,
    string2,
  ];

  var listIterator = list.iterator;

  while (listIterator.moveNext()) {
    var appendString = "";

    listIterator.current.runes.forEach((int rune) {
      appendString += String.fromCharCode(rune);
      keywords.add(appendString);
    });

    inputString = inputString.replaceAll(listIterator.current.toString(), " ");
  }

  return keywords;
}
