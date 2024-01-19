import 'package:flutter/material.dart';

//  This code is literally from the "flutter create" boilerplate,
//  but I removed the counter app (and kept the underlying structure).

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({ super.key });

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: const MyHomePage(title: 'Flutter Logo Demo'),
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

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        body: Container(
        //  set underlying Container to take up the entire screen
        //  ( only width needed for this, cuz the child Column will push height... ) 
          color: Colors.green,
          width: double.infinity,
          child: Stack(
            children: [
                
                
                
                // ****************************
                // SKY
                // ****************************          
                Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(
                      colors: [Colors.lightBlueAccent, Colors.blue],
                      begin: Alignment.bottomLeft,
                      end: Alignment.topRight,
                      ),
                  ),   
                ),              



                // ****************************
                // RAINBOW
                // ****************************          
                Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: BoxDecoration(
                  image: DecorationImage(
                    image:
                      AssetImage('./assets/images/rainbow.png'),
                      fit: BoxFit.cover,
                      //alignment: Alignment.center,
                    ),
                  ),   
                ),  




                // ****************************
                // GRASS
                // ****************************          
                Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: BoxDecoration(
                  image: DecorationImage(
                    image:
                      AssetImage('./assets/images/grass.png'),
                      fit: BoxFit.cover,
                      //alignment: Alignment.center,
                    ),
                  ),   
                ),  




                // ****************************
                // TREE
                // ****************************          
                Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: BoxDecoration(
                  image: DecorationImage(
                    image:
                      AssetImage('./assets/images/tree.png'),
                      fit: BoxFit.cover,
                      //alignment: Alignment.center,
                    ),
                  ),   
                ),  



                // ****************************
                // APPLES
                // ****************************          
                Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: BoxDecoration(
                  image: DecorationImage(
                    image:
                      AssetImage('./assets/images/apples.png'),
                      fit: BoxFit.cover,
                      //alignment: Alignment.center,
                    ),
                  ),   
                ), 



                // ****************************
                // GIRL
                // ****************************          
                Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: BoxDecoration(
                  image: DecorationImage(
                    image:
                      AssetImage('./assets/images/girl.png'),
                      fit: BoxFit.cover,
                      //alignment: Alignment.center,
                    ),
                  ),   
                ),                                 

            ]
          ),
        ),  
      ),
    );
  }
}
