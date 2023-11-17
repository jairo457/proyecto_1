import 'package:flutter/material.dart';
import 'package:proyecto/firebase/email_auth.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final EmailAuth emailAuth = EmailAuth();
  TextEditingController txtConUser = TextEditingController();
  TextEditingController txtConPass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final txtUser = TextField(
      style: TextStyle(color: Colors.black),
      controller: txtConUser,
      decoration: const InputDecoration(
          border: OutlineInputBorder(), labelText: 'Usuario'),
    );

    final txtPass = TextField(
        controller: txtConPass,
        style: TextStyle(color: Colors.black),
        decoration: const InputDecoration(
            border: OutlineInputBorder(), labelText: 'Contraseña'));

    final imgLogo = Container(
      width: 300,
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(
                  'https://upload.wikimedia.org/wikipedia/commons/thumb/0/05/Mario_Series_Logo.svg/1280px-Mario_Series_Logo.svg.png'))),
    );

    final btnEntrar = FloatingActionButton.extended(
        icon: Icon(Icons.login),
        label: Text('Entrar'),
        onPressed: () async {
          bool res = await emailAuth.validateUser(
              emailUser: txtConUser.text, pwdUser: txtConPass.text);
          if (res) {
            Navigator.pushNamed(context, '/pfire');
          }
        }
        /*(){
        Navigator.pushNamed(context, '/dash');
      }*/
        );

    return Scaffold(
      body: Container(
        //height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
            image: DecorationImage(
                opacity: .7,
                fit: BoxFit.cover,
                image: NetworkImage(
                    'https://getwallpapers.com/wallpaper/full/a/7/c/1227626-widescreen-mario-bros-wallpaper-hd-1080x1920-retina.jpg'))),
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 50, bottom: 30),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  imgLogo,
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 200,
                    padding: EdgeInsets.all(30),
                    margin: EdgeInsets.symmetric(horizontal: 30),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white),
                    child: Column(
                      children: [
                        txtUser,
                        const SizedBox(
                          height: 10,
                        ),
                        txtPass
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextButton(
                      onPressed: () =>
                          Navigator.pushNamed(context, '/register'),
                      child: Text(
                        'Registrate: ',
                        style: TextStyle(fontSize: 20),
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: btnEntrar,
    );
  }
}
