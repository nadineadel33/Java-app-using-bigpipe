import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerLoading extends StatelessWidget {
  const ShimmerLoading({Key? key, required this.child}) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.black12.withOpacity(0.2),
      highlightColor: Colors.black12.withOpacity(0.1),
      child: child,
    );
  }
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool showShimmer = true;

  @override
  void initState() {
    super.initState();
    // Set a timer to hide shimmer after 3 seconds (adjust duration as needed)
    Future.delayed(const Duration(seconds: 4), () {
      if (mounted) {
        setState(() {
          showShimmer = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Padding(
          padding: EdgeInsets.all(50.0),
          child: Text(
            "BigPipe Assignment",
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: MediaQuery.sizeOf(context).width*0.02,),
          if (showShimmer)
            SizedBox(
              width: MediaQuery.sizeOf(context).width*0.3,
              height: MediaQuery.sizeOf(context).height*0.3,
              child: ShimmerLoading(
                child: Image.asset(
                    'assets/1.jpeg'),
              ),
            )
          else
            Container(
              decoration: BoxDecoration(
                border:  Border.all(
                    color: Colors.black
                ),
              ),
              height: MediaQuery.sizeOf(context).height*0.3,
              child: Image.asset(
                  'assets/1.jpeg'),
            ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (showShimmer)
                SizedBox(
                  width: MediaQuery.sizeOf(context).width*0.12,
                  height: MediaQuery.sizeOf(context).height*0.12,
                  child: ShimmerLoading(
                    child: Image.asset(
                        'assets/2.jpeg'),
                  ),
                )
              else
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Container(
                    decoration: BoxDecoration(
                      border:  Border.all(
                          color: Colors.black
                      ),
                    ),
                    height: MediaQuery.sizeOf(context).height*0.12,
                    child: Image.asset(
                        'assets/2.jpeg'),
                  ),
                ),
              if (showShimmer)
                SizedBox(
                  width: MediaQuery.sizeOf(context).width*0.12,
                  height: MediaQuery.sizeOf(context).height*0.12,
                  child: ShimmerLoading(
                    child: Image.asset(
                        'assets/3.jpeg'),
                  ),
                )
              else
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Container(
                    decoration: BoxDecoration(
                      border:  Border.all(
                          color: Colors.black
                      ),
                    ),
                    height: MediaQuery.sizeOf(context).height*0.12,
                    child: Image.asset(
                        'assets/3.jpeg'),
                  ),
                ),
            ],
          ),
          if (showShimmer)
            SizedBox(
              width: MediaQuery.sizeOf(context).width*0.3,
              height: MediaQuery.sizeOf(context).height*0.3,
              child: ShimmerLoading(
                child: Image.asset(
                    'assets/4.jpeg'),
              ),
            )
          else
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  border:  Border.all(
                      color: Colors.black
                  ),
                ),
                height: MediaQuery.sizeOf(context).height*0.3,
                child: Image.asset(
                    'assets/4.jpeg'),
              ),
            ),
          SizedBox(height: MediaQuery.sizeOf(context).width*0.03,),

        ],
      ),
    );
  }
}
