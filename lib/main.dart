import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:yalies/widgets/studentList.dart';

void main() => runApp(App());

class App extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        return MaterialApp(
            title: "Yalies",
            theme: ThemeData(primaryColor: Color.fromRGBO(0, 53, 107, 1)),
            //home: MainWidget()
            home: StudentList()
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
    Completer<WebViewController> _controller = Completer<WebViewController>();

    @override
    Widget build(BuildContext context) {
        return WebView(
            initialUrl: 'https://flutter.io',
            onWebViewCreated: (WebViewController webViewController) {
                _controller.complete(webViewController);
            },
        );
    }
}

class HomeWidget extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        return StudentList();
    }
}
