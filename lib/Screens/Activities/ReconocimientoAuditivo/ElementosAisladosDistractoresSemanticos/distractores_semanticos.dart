import 'package:flutter/material.dart';

import 'components/body.dart';

class ElementosAisladosDistractoresSemanticosScreen extends StatelessWidget {
  final List<int> actividadesAsignadas;
  const ElementosAisladosDistractoresSemanticosScreen(
      {Key key, this.actividadesAsignadas})
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
        ),
      ),
    );
  }
}
