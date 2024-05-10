import 'package:afasia/Screens/Profile/components/body.dart';
import 'package:afasia/Screens/Welcome/welcome_screen.dart';
import 'package:afasia/constants.dart';
import 'package:afasia/database/database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  AfasiaDatabase db = AfasiaDatabase();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return FutureBuilder(
      future: db.initDB(),
      builder: (BuildContext context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return _showScaffold(context);
          // return Container();
        } else {
          return Center(
            child: CircularProgressIndicator(
              backgroundColor: kPrimaryColor,
            ),
          );
        }
      },
    );
  }

  Widget _showScaffold(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "AfasiaAPP",
        ),
        actions: <Widget>[
          PopupMenuButton<String>(
            onSelected: choiceAction,
            itemBuilder: (BuildContext context) {
              return StringMenu.choices.map((String choice) {
                return PopupMenuItem<String>(
                  value: choice,
                  child: Row(
                    children: <Widget>[
                      Text(
                        choice,
                        style: TextStyle(fontSize: 20),
                      ),
                      Spacer(),
                      if (choice == "Cerrar sesión")
                        Icon(
                          Icons.logout,
                          color: kPrimaryColor,
                          size: 25,
                        ),
                    ],
                  ),
                );
              }).toList();
            },
          ),
        ],
        leading: new Container(),
      ),
      body: Body(),
    );
  }

  Future<void> choiceAction(String choice) async {
    if (choice == StringMenu.logout) {
      db.deleteFonoaudiologo();
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) {
            return WelcomeScreen();
          },
        ),
        ModalRoute.withName(''),
      );
    }
    if (choice == StringMenu.cambiarFoto) {
      ImagePicker _picker = ImagePicker();
      PickedFile image = await _picker.getImage(source: ImageSource.gallery);
      fonoActivo.imagen = image.path;
      await db.updateImagenFono(fonoActivo.toMap());
      setState(() {});
      print(image.path);
      // final image = await _picker.pickImage(source: ImageSource.gallery);

    }
  }
}

class StringMenu {
  static const String cambiarFoto = "Cambiar imagen";
  static const String logout = "Cerrar sesión";

  static const List<String> choices = <String>[
    cambiarFoto,
    logout,
  ];
}
