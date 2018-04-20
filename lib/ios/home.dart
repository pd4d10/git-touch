import 'package:flutter/cupertino.dart';

class IosHomeTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new DefaultTextStyle(
      style: const TextStyle(
        fontFamily: '.SF UI Text',
        inherit: false,
        fontSize: 17.0,
        color: CupertinoColors.black,
      ),
      child: new CupertinoPageScaffold(
        child: new DecoratedBox(
          decoration: const BoxDecoration(color: const Color(0xFFEFEFF4)),
          child: new CustomScrollView(
            slivers: <Widget>[
              const CupertinoSliverNavigationBar(
                largeTitle: const Text('Cupertino Refresh'),
              ),
              new CupertinoRefreshControl(
                onRefresh: () {
                  // return new Future<void>.delayed(const Duration(seconds: 2))
                  //   ..then((_) => setState(() => repopulateList()));
                },
              ),
              new SliverSafeArea(
                top: false, // Top safe area is consumed by the navigation bar.
                sliver: new SliverList(
                  delegate: new SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      return new Text('abc');
                    },
                    childCount: 20,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
