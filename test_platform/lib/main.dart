// Copyright 2018, the Flutter project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'dart:async';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main(List<String>? args) {
  Map<String, dynamic> data = {};
  if (args != null && args.isNotEmpty) {
    data = jsonDecode(args[0]);
  }
  runApp(PlatformView(
    noShowPlatformView: data['showModel'] ?? '',
  ));
}

class PlatformView extends StatelessWidget {
  const PlatformView({super.key, this.noShowPlatformView = ''});
  final String noShowPlatformView;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Platform View',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: HomePage(
        noShowPlatformView: noShowPlatformView,
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key, this.noShowPlatformView = ''});
  final String noShowPlatformView;
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late ValueNotifier<bool> testNoti;
  @override
  void initState() {
    super.initState();
    testNoti = ValueNotifier(false);
    Future.delayed(Duration(milliseconds: 500), () {
      testNoti.value = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text("test"),
      //   elevation: 0.15,
      // leading: GestureDetector(onTap: () {
      //   Navigator.pop(context);
      // },child: IconButton,),
      // ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 50,
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  CupertinoPageRoute(
                      builder: (context) => HomePage(
                            noShowPlatformView: '3',
                          )));
            },
            child: Container(
              height: 40,
              color: Colors.green,
              child: Text(
                'flutter vc inner jumpto page',
                style: TextStyle(color: Colors.red, fontSize: 22),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              height: 40,
              color: Colors.green,
              child: Text(
                'flutter vc inner pop',
                style: TextStyle(color: Colors.red, fontSize: 22),
              ),
            ),
          ),
          Expanded(
            child: ValueListenableBuilder(
                valueListenable: testNoti,
                builder: (BuildContext context, dynamic value, Widget? child) {
                  if (value && widget.noShowPlatformView != '2') {
                    return UiKitView(
                      viewType: 'platform-view-type1',
                      layoutDirection: TextDirection.ltr,
                      creationParamsCodec: const JSONMessageCodec(),
                    );
                  } else {
                    return UnconstrainedBox(
                      child: ConstrainedBox(
                        constraints: BoxConstraints(minWidth: 90.0, minHeight: 20.0), //子
                        child: Container(
                          width: 150,
                          height: 50,
                          color: Colors.red,
                          child: Text('no show platform view'),
                        ),
                      ),
                    );
                  }
                }),
          )
        ],
      ),
    );
  }
}
