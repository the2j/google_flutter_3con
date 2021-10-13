import 'dart:async';

import 'package:extension_google_sign_in_as_googleapis_auth/extension_google_sign_in_as_googleapis_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:googleapis/people/v1.dart';
import 'package:googleapis/fitness/v1.dart';
import 'package:googleapis_auth/googleapis_auth.dart' as auth show AuthClient;

void PersonJsonPrint(PeopleServiceApi peopleApi) async {


  //JSON DUMP LIST:
  // Retrieve a list of the `names` of my `connections`
  // final String peoplestr =
  // await peopleApi.people.connections.list('me').toString();
  //
  // //test printing to json
  // print('\n\nJSON CONTACT RESPONSE');
  // print(peoplestr);
  // print('--JSON END--\n\n');


  //LIST VERSION WORKING
  final ListConnectionsResponse peoplelst =
  await peopleApi.people.connections.list(
      'people/me',
      personFields: 'names'
  );

  //
  print('LIST CONTACTS RESPONSE');
  List<Person> peopleresponse = peoplelst.connections!.toList();
  //first.names!.toList();
  for(var p in peopleresponse){
    print(p.names!.first.displayName);
  }

  print('--END--');

  //test printing to json
  print('\n\nVariable RESPONSE');
  print(peopleresponse);
  print('--END--');

}