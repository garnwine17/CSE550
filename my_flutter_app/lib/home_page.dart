// Copyright 2022 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:firebase_auth/firebase_auth.dart'
    hide EmailAuthProvider, PhoneAuthProvider;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'app_state.dart';
import 'src/authentication.dart';
// import 'src/widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Welcome')),
      body: ListView(
        children: <Widget>[
          Image.asset(
            height: 200,
            width: 200,
            // scale: 3.0,
            'assets/medreminder.jpg',
          ),
          const SizedBox(height: 8),
          //const IconAndDetail(Icons.calendar_today, 'October 30'),
          //const IconAndDetail(Icons.location_city, 'Philadelphia'),
          Consumer<ApplicationState>(
            builder:
                (context, appState, _) => AuthFunc(
                  loggedIn: appState.loggedIn,
                  signOut: () {
                    FirebaseAuth.instance.signOut();
                  },
                ),
          ),
        ],
      ),
    );
  }
}