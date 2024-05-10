import 'package:flutter/material.dart';

import 'components/body.dart';

class CloseScreen extends StatelessWidget {
  final List<int> actividadesAsignadas;
  final int index;
  const CloseScreen({Key key, this.actividadesAsignadas, this.index})
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
      body: Body(
        actividadesAsignadas: actividadesAsignadas,
        index: index,
      ),
    );
  }
}
