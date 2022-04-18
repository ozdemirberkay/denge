import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Layout extends StatelessWidget {
  final String title;
  final Widget body;
  final List<Widget>? actions;
  final Widget? leading;
  final IconData? iconLeading;
  final IconData? actionsLeading;
  final Widget? bottomNavigationBar;

  const Layout(
      {required this.title,
      required this.body,
      this.bottomNavigationBar,
      this.iconLeading,
      this.actionsLeading,
      this.leading,
      this.actions,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,

        backgroundColor: Color(0xff334155),
        centerTitle: true,
        actions: this.actions,
        leading: this.leading,
        title: Text(
          this.title,
          style: TextStyle(
              color: const Color(0xffffffff),
              fontFamily: 'Roboto',
              fontSize: 16),
        ),
        iconTheme: IconThemeData(
          color: Colors.white
          //color: Color(0xff8181A5), //change your color here
        ),
      ),
      bottomNavigationBar: this.bottomNavigationBar,
      body: this.body,
    );
  }
}
