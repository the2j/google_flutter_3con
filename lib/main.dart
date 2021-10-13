// Copyright 2013 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:async';

import 'package:extension_google_sign_in_as_googleapis_auth/extension_google_sign_in_as_googleapis_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:googleapis/people/v1.dart';
import 'package:googleapis/fitness/v1.dart';
import 'package:googleapis_auth/googleapis_auth.dart' as auth show AuthClient;
import 'FitnessGoogleAPI.dart';
import 'PersonGoogleAPI.dart';

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

void main() {
  runApp(
    const MaterialApp(
      title: 'Google Sign In',
      home: SignInDemo(),
    ),
  );
}

/// The main widget of this demo.
class SignInDemo extends StatefulWidget {
  /// Creates the main widget of this demo.
  const SignInDemo({Key? key}) : super(key: key);

  @override
  State createState() => SignInDemoState();
}

/// The state of the main widget.
class SignInDemoState extends State<SignInDemo> {
  GoogleSignInAccount? _currentUser;
  String _contactText = '';

  @override
  void initState() {
    super.initState();
    _googleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount? account) {
      setState(() {
        _currentUser = account;
      });
      if (_currentUser != null) {
        _handleGetContact();
      }
    });
    _googleSignIn.signInSilently();
  }

  Future<void> _handleGetContact() async {
    setState(() {
      _contactText = 'Loading contact info...';
    });

    // Retrieve an [auth.AuthClient] from the current [GoogleSignIn] instance.
    final auth.AuthClient? client = await _googleSignIn.authenticatedClient();

    assert(client != null, 'Authenticated client missing!');

    // Prepare a People Service authenticated client.
    final PeopleServiceApi peopleApi = PeopleServiceApi(client!);
    
    //fitness version
    //final FitnessApi fitnessApi = FitnessApi(client!);
    
   
    // Retrieve a list of the `names` of my `connections`
    final ListConnectionsResponse response =
    await peopleApi.people.connections.list(
      'people/me',
      personFields: 'names'   //FIGURE OUT HOW TO DO THIS WITH MORE FIELDS//personFields: 'names,addresses,birthdays,calendarUrls,emailAddresses,genders,phoneNumbers'

    );


    //MY OWN STUFF ----------------------------------------------------
    //testing printing with google contacts data

    // print('CONTACTS RESPONSE');
    // List<Person> peopleresponse = response.connections!.toList();
    // //first.names!.toList();
    // for(var p in peopleresponse){
    //   print(p.names!.first.displayName);
    // }
    //
    // print('--END--');
    //
    // //test printing to json
    // print('\n\nJSON CONTACT RESPONSE');
    // print(peopleresponse);
    // print('--JSON END--');

    //fitness version
    final FitnessApi fitnessApi = FitnessApi(client!);

    // for dataSources requires a userID - ok so me just refers to , where can we get this? - use me
    // printing

    // final ListDataSourcesResponse responseFit =
    // await fitnessApi.users.dataSources.list('me');
    // print('FITNESS RESPONSE:');
    // print(responseFit.dataSource.toString() );
    // print('--END--');



    PersonJsonPrint(peopleApi);
    FitnessJsonPrint(fitnessApi);
    //FUNCTIONS THAT DO THE STUFF ^


    


    final String? firstNamedContactName =
    _pickFirstNamedContact(response.connections);

    setState(() {
      if (firstNamedContactName != null) {
        _contactText = 'I see you know $firstNamedContactName!';
      } else {
        _contactText = 'No contacts to display.';
      }
    });
  }

  String? _pickFirstNamedContact(List<Person>? connections) {
    return connections
        ?.firstWhere(
          (Person person) => person.names != null,
    )
        .names
        ?.firstWhere(
          (Name name) => name.displayName != null,
    )
        .displayName;
  }

  Future<void> _handleSignIn() async {
    try {
      await _googleSignIn.signIn();
    } catch (error) {
      print(error);
    }
  }

  Future<void> _handleSignOut() => _googleSignIn.disconnect();

  Widget _buildBody() {
    final GoogleSignInAccount? user = _currentUser;
    if (user != null) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          ListTile(
            leading: GoogleUserCircleAvatar(
              identity: user,
            ),
            title: Text(user.displayName ?? ''),
            subtitle: Text(user.email),
          ),
          const Text('Signed in successfully.'),
          Text(_contactText),
          ElevatedButton(
            child: const Text('SIGN OUT'),
            onPressed: _handleSignOut,
          ),
          ElevatedButton(
            child: const Text('REFRESH'),
            onPressed: _handleGetContact,
          ),
        ],
      );
    } else {
      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          const Text('You are not currently signed in.'),
          ElevatedButton(
            child: const Text('SIGN IN'),
            onPressed: _handleSignIn,
          ),
        ],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Google Sign In'),
        ),
        body: ConstrainedBox(
          constraints: const BoxConstraints.expand(),
          child: _buildBody(),
        ));
  }
}