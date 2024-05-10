import 'package:flutter/material.dart';

import 'components/body.dart';

class WhiteScreen extends StatelessWidget {
  final List<int> actividadesAsignadas;
  final int index;
  const WhiteScreen({Key key, this.actividadesAsignadas, this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // extendBodyBehindAppBar: true,
      // appBar: AppBar(
      //   backgroundColor: Colors.transparent,
      //   elevation: 0,
      //   actions: [
      //     FlatButton(
      //       onPressed: () {},
      //       child: Text("Skip"),
      //     ),
      //   ],
      // ),
      body: WillPopScope(
        onWillPop: () async {
          // ScaffoldMessenger.of(context).showSnackBar(
          //     SnackBar(content: Text('The System Back Button is Deactivated')));
          return false;
        },
        child: new Body(
          actividadesAsignadas: actividadesAsignadas,
          index: index,
        ),
      ),
    );
  }
}
