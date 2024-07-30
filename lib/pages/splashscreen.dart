// import 'package:delayed_tween_animation_builder/delayed_tween_animation_builder.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:portfoliov2/utils/fonts.dart';
// import 'package:portfoliov2/utils/helpers/sizehelper.dart';

// class Splashscreen extends StatefulWidget {
//   const Splashscreen({super.key});

//   @override
//   State<Splashscreen> createState() => _SplashscreenState();
// }

// class _SplashscreenState extends State<Splashscreen> with SingleTickerProviderStateMixin {

//   late AnimationController controller;
//   late Animation<double> animation;

//   @override
//   void initState(){
//     super.initState();
//     controller = AnimationController(vsync: this,duration: const Duration(milliseconds: 990));
//     animation = Tween<double>(begin: 2,end: 1).animate(controller);
//     controller.forward();
//   }

//   @override
//   Widget build(BuildContext context) {
//     Size size = SizeHelper.getSize(context);
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           // upper section
//           Expanded(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//                 DelayedTweenAnimationBuilder(
//                   delay: const Duration(milliseconds: 1000),
//                   tween: Tween<double>(begin: size.height * 0.5, end: 0),
//                   duration: const Duration(milliseconds: 1500),
//                   builder: (context, value, child) {
//                     return Container(
//                       height: value,
//                       width: size.width,
//                       color: Colors.black,
//                       alignment: Alignment.bottomCenter,
//                       child: child,
//                     );
//                   },
//                   child: ScaleTransition(
//                         scale: animation,
//                         child: Text(
//                           "Vishal Pandey",
//                           style: GoogleFonts.getFont(FontNames.primaryFont,
//                               textStyle: const TextStyle(
//                                   fontWeight: FontWeight.w700,
//                                   fontSize: 60,
//                                   color: Colors.white)),
//                         ),
//                       ),
//                 ),
//               ],
//             ),
//           ),
//           Expanded(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.end,
//               children: [
//                 DelayedTweenAnimationBuilder(
//                   delay: const Duration(milliseconds: 1000),
//                   tween: Tween<double>(begin: size.height * 0.5, end: 0),
//                   duration: const Duration(milliseconds: 1500),
//                   builder: (context, value, child) {
//                     return Container(
//                       height: value,
//                       width: size.width,
//                       color: Colors.black,
//                     );
//                   },
//                 ),
//               ],
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:portfoliov2/utils/helpers/sizehelper.dart';
import 'package:portfoliov2/utils/router/route_constants.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  Widget build(BuildContext context) {
    Size size = SizeHelper.getSize(context);
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        alignment: Alignment.center,
        child: BounceInDown(
          from: size.height / 2,
          duration: const Duration(milliseconds: 1300),
          onFinish: (direction) {
            // Navigator.pushReplacement(
            //     context,
            //     PageRouteBuilder(
            //       pageBuilder: (context, animation, secondaryAnimation) {
            //         return const HomePage();
            //       },
            //       transitionDuration: const Duration(milliseconds: 400),
            //       transitionsBuilder:
            //           (context, animation, secondaryAnimation, child) {
            //         return ScaleTransition(
            //           scale: animation,
            //           filterQuality: FilterQuality.high,
            //           child:child,
            //         );
            //       },
            //     ));
            context.replaceNamed(RouteConstants.home,
                extra: "fromSplashScreen");
          },
          child: Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(18)),
          ),
        ),
      ),
    );
  }
}
