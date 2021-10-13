import 'dart:async';

import 'package:extension_google_sign_in_as_googleapis_auth/extension_google_sign_in_as_googleapis_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:googleapis/fitness/v1.dart';
import 'package:googleapis/people/v1.dart';
import 'package:googleapis/fitness/v1.dart';
import 'package:googleapis/sheets/v4.dart' hide DataSource;
import 'package:googleapis_auth/googleapis_auth.dart' as auth show AuthClient;

// final GoogleSignIn _googleSignIn = GoogleSignIn(
//   // Optional clientId
//   // clientId: '[YOUR_OAUTH_2_CLIENT_ID]',
//   scopes: <String>[
//     //THIS IS IMPORTANT, THIS IS WHERE YOU ADD THE SCOPES YOU WANT TO GET DATA FOR
//
//     //People api
//     PeopleServiceApi.contactsReadonlyScope,
//     //fitness api
//     FitnessApi.fitnessActivityReadScope,
//     FitnessApi.fitnessBloodPressureReadScope
//   ],
// );

class  GoogleLogin {
  //variables that will be used
  //msic
  List<String> textLog = [];
  //scopes that will be used
  final GoogleSignIn _googleSignIn = GoogleSignIn(
    // Optional clientId
    // clientId: '[YOUR_OAUTH_2_CLIENT_ID]',
    scopes: <String>[
      //THIS IS IMPORTANT, THIS IS WHERE YOU ADD THE SCOPES YOU WANT TO GET DATA FOR

      //People api
      PeopleServiceApi.contactsReadonlyScope,
      //fitness api
      FitnessApi.fitnessActivityReadScope,
      FitnessApi.fitnessBloodPressureReadScope
    ],
  );
  //account
  GoogleSignInAccount? _currentUser;
  //authorised client

  //api plugin instance

  //are we logged in
  bool accessWasGranted = false;

  void doFirstTimeSetup() async {

    _requestAuth();
  }


  ///
  /// Get account status,
  /// if current user exists return true,
  /// if current user does not exist return false
  ///
  bool GoogleAcountStatus() {
    _googleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount? account) {
      {
        _currentUser = account;
      }});
    if (_currentUser != null) {
      return false;
    }
    return true;
  }

  Future<void> _requestAuth() async {
    //get if access was granted
    accessWasGranted = GoogleAcountStatus();
    print('Request auth start');
    if (!accessWasGranted) {

      // Retrieve an [auth.AuthClient] from the current [GoogleSignIn] instance.
      final auth.AuthClient? client = await _googleSignIn.authenticatedClient();
      assert(client != null, 'Authenticated client missing!');

      //update acesswasgranted var
      accessWasGranted = GoogleAcountStatus();

      //instance of fitnessapi to use, we need to figure out how to make it for the entire class
      final FitnessApi fitnessApi = FitnessApi(client!);

      if (accessWasGranted) {
        logAction('Google Authorisation success');
      } else {
        logAction('Google Authorisation failure');
      }
    }
    print('Request auth end');
  }





  void logAction(String log) {
    print(log);
    textLog.add(log);
  }
}