import 'dart:async';

import 'package:extension_google_sign_in_as_googleapis_auth/extension_google_sign_in_as_googleapis_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:googleapis/fitness/v1.dart';
import 'package:googleapis/people/v1.dart';
import 'package:googleapis/fitness/v1.dart';
import 'package:googleapis/sheets/v4.dart' hide DataSource;
import 'package:googleapis_auth/googleapis_auth.dart' as auth show AuthClient;

void FitnessJsonPrint(FitnessApi fitnessApi) async {
  //bing dump
  //final DataSource allfitness = await fitnessApi.users.dataSources.;

  //TEST WITH GETTING AGGREGATE VALUES
  //blood pressure
  final ListDataSourcesResponse allvarsum =
  await fitnessApi.users.dataSources.list(
      'me');

  //body temperature () <- if you could figure out how to make this one work that would be amazing
  // final ListDataSourcesResponse bodytempsum =
  //    await fitnessApi.users.dataSources.list(
  //      'me',
  //      dataTypeName: 'com.google.body.temperature.summary'
  //    );

  //TEST PRINT SOME STUFF
  print('\n--health data test print--');
  print(allvarsum.toJson().toString());
  print('--END--\n');

  //print('--just body temp--');
  //print(bodytempsum.toJson().toString());

  // for dataSources requires a userID - ok so me just refers to , where can we get this? - use me
  // printing

  // final ListDataSourcesResponse responseFit =
  // await fitnessApi.users.dataSources.list('me');
  // // print('FITNESS RESPONSE:');
  // // print(responseFit.dataSource.toString() );
  // // print('--END--');



}