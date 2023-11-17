import 'package:flutter/widgets.dart';
import 'package:proyecto/Screens/login_screen.dart';
import 'package:proyecto/Screens/popular_firebase_screen.dart';

Map<String, WidgetBuilder> GetRoutes() {
  return {
    '/pfire': (BuildContext context) => PopularFirebaseScreen(),
    '/log': (BuildContext context) => LoginScreen(),
    /* '/dash': (BuildContext context) => DashboardScreen(),
    '/task': (BuildContext context) => PopularFirebaseScreen(),
    '/add': (BuildContext context) => AddTask(),
    '/popular': (BuildContext context) => PopularScreen(),
    '/detail': (BuildContext context) => DetailMovieScreen(),
    '/prov': (BuildContext context) => ProviderScreen(),
    '/register': (BuildContext context) => RegisterScreen()*/
  };
}
