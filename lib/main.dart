import 'dart:async';
import 'dart:developer' as developer;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:yalies/widgets/studentList.dart';

void main() => runApp(App());

class App extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        return MaterialApp(
            title: "Yalies",
            theme: ThemeData(primaryColor: Color.fromRGBO(0, 53, 107, 1)),
            home: MainWidget()
        );
    }
}

class MainWidget extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        Widget widget;
        // TODO: check login status
        widget = LoginWidget();
        return widget;
    }
}

class LoginWidget extends StatefulWidget {
    @override
    _LoginWidgetState createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
    InAppWebViewController _controller;

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: const Text('Login with CAS'),
            ),
            body: InAppWebView(
                initialUrl: 'https://secure.its.yale.edu/cas/login',

                onWebViewCreated: (InAppWebViewController controller) {
                    _controller = controller;
                },
                onLoadStart: (InAppWebViewController controller, String url) {
                    // Listen for URL change
                    developer.log(url, name: 'my.app.category');
                    const LOGIN_DESTINATION = 'https://secure.its.yale.edu/cas/login;jsessionid=';
                    if (url.startsWith(LOGIN_DESTINATION)) {
                        var jsessionid = url.substring(LOGIN_DESTINATION.length(), url.length());
                    }
                },
                //onLoadStop: (InAppWebViewController controller, String url) async {
                //    setState(() {
                //        this.url = url;
                //    });
                //},
            ),
        );
    }
}

class HomeWidget extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        return StudentList();
    }
}
