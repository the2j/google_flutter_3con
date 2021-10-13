import 'dart:async';

import 'package:extension_google_sign_in_as_googleapis_auth/extension_google_sign_in_as_googleapis_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:googleapis/people/v1.dart';
import 'package:googleapis/fitness/v1.dart';
import 'package:googleapis/shared.dart';
import 'package:googleapis_auth/googleapis_auth.dart' as auth show AuthClient;
//imports needed for acutal thing
// import 'package:flutter_weko/api_controller/data_types.dart';
// import 'package:flutter_weko/api_controller/unified_data.dart';
// import 'package:flutter_weko/api_controller/parent_controller.dart';
//import specific for segmented version
import '../parent_controller.dart';

///
/// class for signing into google, this allows you to add data scopes
///

class GoogleController extends ParentController {
  void assignId(String deviceId) {
    id = '$deviceId.google';
    logAction('Assigned ID: $id');
  }

  final GoogleSignIn _googleSignIn = GoogleSignIn(
    // Optional clientId
    // clientId: '[YOUR_OAUTH_2_CLIENT_ID]',
    scopes: <String>[
      //THIS IS IMPORTANT, THIS IS WHERE YOU ADD THE SCOPES YOU WANT TO GET DATA FOR

      //fitness api
      FitnessApi.fitnessActivityReadScope,
      FitnessApi.fitnessBloodPressureReadScope,
      FitnessApi.fitnessActivityWriteScope,
      FitnessApi.fitnessBloodGlucoseReadScope,
      FitnessApi.fitnessBloodGlucoseWriteScope,
      FitnessApi.fitnessBodyReadScope,
      FitnessApi.fitnessBodyTemperatureReadScope,
      FitnessApi.fitnessHeartRateReadScope,
      FitnessApi.fitnessNutritionReadScope,
      FitnessApi.fitnessOxygenSaturationReadScope,
      FitnessApi.fitnessReproductiveHealthReadScope,
      FitnessApi.fitnessSleepReadScope,
      FitnessApi.fitnessBloodPressureReadScope
    ],
  );
  //account
  GoogleSignInAccount? _currentUser;
  //authorised client

  //api plugin instance

  //are we logged in
  bool accessWasGranted = false;

  @override
  void doFirstTimeSetup() {
    // TODO: implement doFirstTimeSetup
    _requestAuth();
  }

  @override
  void updateData(DateTime startDate, DateTime endDate) {
    // TODO: implement updateData
  }

  ///
  /// First login for google authenication
  ///
  Future<void> _requestAuth() async {
    //checks if valid account exists and assigns it to accessWasGranted
    accessWasGranted = GoogleAcountStatus();
    print('Request auth start');
    if (!accessWasGranted) {
      // Retrieve an [auth.AuthClient] from the current [GoogleSignIn] instance.
      _googleSignIn.signInSilently();
      await _googleSignIn.signIn();
      final auth.AuthClient? client = await _googleSignIn.authenticatedClient();
      assert(client != null, 'Authenticated client missing!');

      //update acesswasgranted var
      accessWasGranted = GoogleAcountStatus();

      //instance of fitnessapi to use, we need to figure out how to make it for the entire class IMPORTANT
      final FitnessApi fitnessApi = FitnessApi(client!);

      if (accessWasGranted) {
        logAction('Google Authorisation success');
      } else {
        logAction('Google Authorisation failure');
      }
    }

    print('Request auth end');
  }

  /// Get account status,
  /// if current user exists return true,
  /// if current user does not exist return false
  ///
  bool GoogleAcountStatus() {
    _googleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount? account) {
      {
        _currentUser = account;
      }
    });

    if (_currentUser != null) {
      return true;
    }

    return false;
  }

  ///
  ///login and logout handle
  ///
  Future<void> _handleSignIn() async {
    //IMPLIMENTED
    try {
      await _googleSignIn.signIn();
    } catch (error) {
      print(error);
    }
  }

  Future<void> _handleSignOut() => _googleSignIn.disconnect();
}
