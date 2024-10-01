import 'package:flutter/material.dart';
import 'package:kerent_app/login_signin_page/sign_phone.dart';
import 'package:kerent_app/login_signin_page/sign_email.dart';
import 'package:kerent_app/home_page/home.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
            routes: {
    '/login': (context) => const SignInPage(),
    '/email': (context) => const SignInMail(),
    '/home': (context) => const HomeP(),
  },

    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    double screenWidth = mediaQueryData.size.width;
    double screenHeight = mediaQueryData.size.height;
     return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          width: screenWidth,
          height: screenHeight,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(color: Color(0xFF101014)),
          child: Stack(
            children: [
              Positioned(
                left: 109,
                top: 335.46,
                child: Transform(
                  transform: Matrix4.identity()..translate(0.0, 0.0)..rotateZ(-0.31),
                  child: Container(
                    width: 239.44,
                    height: 94.89,
                    decoration: ShapeDecoration(
                      color: Color(0xFFE0E2FB),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    child: Center(
                      child: Transform.rotate(
                        angle: -0.05,
                        child: Text(
                          'App',
                          style: TextStyle(
                            color: Color(0xFF101014),
                            fontSize: 64,
                            fontFamily: 'Plus Jakarta Sans',
                            fontWeight: FontWeight.w700,
                            height: 0,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 34.53,
                top: 393.99,
                child: Container(
                  width: 265.50,
                  height: 95.88,
                  decoration: ShapeDecoration(
                    color: Color(0xFFB5B8E5),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'For',
                      style: TextStyle(
                        color: Color(0xFF101014),
                        fontSize: 64,
                        fontFamily: 'Plus Jakarta Sans',
                        fontWeight: FontWeight.w700,
                        height: 0,
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 132.86,
                top: 508.46,
                child: Transform(
                  transform: Matrix4.identity()..translate(0.0, 0.0)..rotateZ(-0.23),
                  child: Container(
                    width: 206.51,
                    height: 97.01,
                    decoration: ShapeDecoration(
                      color: Color(0xFFFBC87B),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    child: Center(
                      child: Transform.rotate(
                        angle: -0.05,
                        child: Text(
                          'Rent!',
                          style: TextStyle(
                            color: Color(0xFF101014),
                            fontSize: 64,
                            fontFamily: 'Plus Jakarta Sans',
                            fontWeight: FontWeight.w700,
                            height: 0,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 37.36,
                top: 207.99,
                child: Transform(
                  transform: Matrix4.identity()..translate(0.0, 0.0)..rotateZ(-0.05),
                  child: Container(
                    width: 318.09,
                    height: 94.89,
                    decoration: ShapeDecoration(
                      color: Color(0xFFF8F8F8),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    child: Center(
                      child: Transform.rotate(
                        angle: -0.01,
                        child: Text(
                          'Amazing',
                          style: TextStyle(
                            color: Color(0xFF101014),
                            fontSize: 64,
                            fontFamily: 'Plus Jakarta Sans',
                            fontWeight: FontWeight.w700,
                            height: 0,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 46,
                top: 782,
                child: Transform(
                  transform: Matrix4.identity()..translate(0.0, 0.0)..rotateZ(-1.57),
                  child: Container(
                    width: 50,
                    height: 305,
                    decoration: ShapeDecoration(
                      color: Color(0xFF282828),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 46,
                top: 782,
                    child: GestureDetector(
                  onTap: () {
                   Navigator.pushNamed(context, '/login');  // Navigasi ke halaman login
                  },

                child: Transform(
                  transform: Matrix4.identity()..translate(0.0, 0.0)..rotateZ(-1.57),
                  child: Container(
                    width: 50,
                    height: 305,
                    decoration: ShapeDecoration(
                      color: Color(0xFF282828),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                  ),
                ),
              ),
              ),
              Positioned(
                left: 47,
                top: 721,
                child: Transform(
                  transform: Matrix4.identity()..translate(0.0, 0.0)..rotateZ(-1.57),
                  child: Container(
                    width: 50,
                    height: 305,
                    decoration: ShapeDecoration(
                      color: Color(0xFFF8F8F8),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 102,
                top: 744,
                child: Container(
                  width: 28,
                  height: 26,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(),
                  child: Image(
                    image: AssetImage('lib/assets/icon_light_smartphone.png')            
                    )
                ),
              ),
              Positioned(
                left: 136,
                top: 689,
                child: GestureDetector(
                  onTap: () {
                   Navigator.pushNamed(context, '/home');  // Navigasi ke halaman login
                  },
                child: SizedBox(
                  width: 160,
                  height: 15,
                  child: Text(
                    'Continue with Google',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF282828),
                      fontSize: 15,
                      fontFamily: 'Plus Jakarta Sans',
                      fontWeight: FontWeight.w600,
                      height: 0,
                    ),
                  ),
                ),
              ),
              ),
              Positioned(
                left: 136,
                top: 750,
                  child: GestureDetector(
                  onTap: () {
                   Navigator.pushNamed(context, '/login');  // Navigasi ke halaman login
                  },

                child: SizedBox(
                  width: 160,
                  height: 15,
                  child: Text(
                    'Continue with Phone',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFFF8F8F8),
                      fontSize: 15,
                      fontFamily: 'Plus Jakarta Sans',
                      fontWeight: FontWeight.w600,
                      height: 0,
                    ),
                  ),
                ),
              ),
              ),
              Positioned(
                left: 94,
                top: 803,
                child: SizedBox(
                  width: 125,
                  height: 15,
                  child: Text(
                    'Don’t have an account?',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFFF8F8F8),
                      fontSize: 11,
                      fontFamily: 'Plus Jakarta Sans',
                      fontWeight: FontWeight.w600,
                      height: 0,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 219,
                top: 803,
                  child: GestureDetector(
                  onTap: () {
                   Navigator.pushNamed(context, '/email');  // Navigasi ke halaman login
                  },

                child: SizedBox(
                  width: 85,
                  height: 15,
                  child: Text(
                    'Create account',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFFFBC87B),
                      fontSize: 11,
                      fontFamily: 'Plus Jakarta Sans',
                      fontWeight: FontWeight.w600,
                      height: 0,
                    ),
                  ),
                ),
              ),
              ),
              Positioned(
                left: 104,
                top: 686,
                child: Container(
                  width: 21,
                  height: 21,
                  child: Image(
                    image: AssetImage('lib/assets/devicon_google.png'),
                  )
                ),
              ),
            ],
          ),
        ),
      ),
    );

  }
}