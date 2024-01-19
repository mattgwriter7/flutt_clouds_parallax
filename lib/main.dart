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

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {

  //  set up bottom cloud set ( "cloudset_1" )
  late AnimationController cloudset_1_controller;     //  it needs an animation controller  
  final double  cloudset_1_left_max = 1000;           //  the maximum size of the loop (which is half of the width of the cloud image)
  double        cloudset_1_left_current = 1000;       //  the current position of the loop
  final int cloudset_1_loop_duration  = 300000;       //  how long in ms is animaion loop?    

  //  set up top cloud set ( "cloudset_2" )
  late AnimationController cloudset_2_controller;     
  final double  cloudset_2_left_max = 1000;           
  double        cloudset_2_left_current = 1000;       
  final int cloudset_2_loop_duration  = 100000;       //  much slower moving   

    // (this page) init and dispose
  @override
  void initState() {
    super.initState();
    //  COMMENT

    //  START: BOTTOM CLOUDS
    cloudset_1_controller = AnimationController(
      duration: Duration( milliseconds: cloudset_1_loop_duration ), // 
      vsync: this, 
    );
    cloudset_1_controller.forward();     //  this sets the clouds into motion

    cloudset_1_controller.addListener(() {
      //  it needs a listener to update the cloud position based on
      //  the ticker value
      setState(() {
        cloudset_1_left_current = 0 - (cloudset_1_left_max * cloudset_1_controller.value);
      });
      //  Utils.log( filename, cloudset_2_controller.value.toString() );
    });

    cloudset_1_controller.addStatusListener((status) {
      //  it needs a status listener to repeat after complete  
      if (status == AnimationStatus.completed) { cloudset_1_controller.repeat(); }
    });    
    //  END:  BOTTOM CLOUDS    


    //  START: TOP CLOUDS
    cloudset_2_controller = AnimationController(
      duration: Duration( milliseconds: cloudset_2_loop_duration ), // 
      vsync: this, 
    );
    cloudset_2_controller.forward();     //  this sets the clouds into motion

    cloudset_2_controller.addListener(() {
      //  it needs a listener to update the cloud position based on
      //  the ticker value
      setState(() {
        cloudset_2_left_current = 0 - (cloudset_2_left_max * cloudset_2_controller.value);
      });
      //  Utils.log( filename, cloudset_2_controller.value.toString() );
    });

    cloudset_2_controller.addStatusListener((status) {
      //  it needs a status listener to repeat after complete  
      if (status == AnimationStatus.completed) { cloudset_2_controller.repeat(); }
    });    
    //  END: TOP CLOUDS

  }

  @override
  void dispose() {
    //  dispode of the cloudset controllers on exit
    cloudset_1_controller.dispose();
    cloudset_2_controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        body: Container(
        //  set underlying Container to take up the entire screen
        //  ( only width needed for this, cuz the child Column will push height... ) 
          color: Colors.transparent,
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





                // ***********************************************
                // cloudset_1 ( the grey, slow, bottom cloud set )
                // ***********************************************
                Positioned(
                  left: cloudset_1_left_current,
                  top: 0,
                  child: Image.asset('./assets/images/cloudset_bottom.png'),
                ),

                // *****************************************
                // cloudset_2 ( the whiter, faster clouds )
                // *****************************************          
                Positioned(
                  left: cloudset_2_left_current,
                  top: 0,
                  child: Image.asset('./assets/images/cloudset_top.png'),
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
