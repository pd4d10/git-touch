import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:git_flux/utils/utils.dart';
import 'news.dart';
import 'notifications.dart';

class AndroidHome extends StatefulWidget {
  @override
  createState() => _AndroidHomeState();
}

class _AndroidHomeState extends State<AndroidHome> {
  int active = 0;

  Widget _buildBody() {
    switch (active) {
      case 0:
        return NewsScreen();
      case 1:
        return NotificationScreen();
      default:
        return Text('d');
    }
  }

  @override
  build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: Text('Home')),
      body: _buildBody(),
      bottomNavigationBar: BottomNavigationBar(
        items: buildNavigationItems(),
        currentIndex: active,
        type: BottomNavigationBarType.fixed,
        onTap: (int index) {
          setState(() {
            active = index;
          });
        },
      ),
    );
  }
}
