import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:portfoliov2/pages/about.dart';
import 'package:portfoliov2/pages/contact.dart';
import 'package:portfoliov2/pages/home.dart';
import 'package:portfoliov2/pages/projects.dart';
import 'package:portfoliov2/pages/splashscreen.dart';
import 'package:portfoliov2/utils/router/route_constants.dart';

class AppRouter {
  GoRouter router = GoRouter(routes: [
    GoRoute(
      name: RouteConstants.splashscreen,
      path: '/',
      pageBuilder: (context, state) {
        return const MaterialPage(child: Splashscreen());
      },
    ),
    GoRoute(
      name: RouteConstants.home,
      path: '/home',
      pageBuilder: (context, state) {
        return _buildHomePage(context, state);
      },
    ),
    GoRoute(
      name: RouteConstants.about,
      path: '/about',
      pageBuilder: (context, state) {
        return _buildRoutePages(context, state,  AboutPage());
      },
    ),
    GoRoute(
      name: RouteConstants.contact,
      path: '/contact',
      pageBuilder: (context, state) {
        return _buildRoutePages(context, state, const ContactPage());
      },
    ),
    GoRoute(
      name: RouteConstants.projects,
      path: '/projects',
      pageBuilder: (context, state) {
        return _buildRoutePages(context, state, const ProjectPage());
      },
    )
  ]);

  static CustomTransitionPage _buildHomePage(
      BuildContext context, GoRouterState state) {
    if (state.extra == "fromSplashScreen") {
      return CustomTransitionPage(
          key: state.pageKey,
          child: const HomePage(),
          transitionDuration: const Duration(milliseconds: 400),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return ScaleTransition(
              scale: animation,
              filterQuality: FilterQuality.high,
              child: child,
            );
          });
    }

    return _buildRoutePages(context, state, const HomePage());
  }

  static CustomTransitionPage _buildRoutePages(
      BuildContext context, GoRouterState state, Widget child) {
    return CustomTransitionPage(
        key: state.pageKey,
        child: child,
        transitionDuration: const Duration(seconds: 2),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          final curvedAnimation = CurvedAnimation(
            parent: animation,
            curve:  CustomPauseCurve()
          );
          return Stack(
            alignment: Alignment.center,
            children: [
              Visibility(
                visible: curvedAnimation.value == 1,
                // duration: const Duration(milliseconds: 500),
                child: child,
              ),
              Visibility(
                visible: curvedAnimation.value != 1,
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.white,
                  alignment: curvedAnimation.value <= 0.5
                      ? Alignment.centerLeft
                      : Alignment.centerRight,
                  child: Container(
                    color: Colors.black,
                    width: curvedAnimation.value <= 0.5
                        ? MediaQuery.of(context).size.width *
                            (curvedAnimation.value * 2)
                        : MediaQuery.of(context).size.width *
                            (2 - curvedAnimation.value * 2),
                  ),
                ),
              )
            ],
          );
        });
  }
}


class CustomPauseCurve extends Curve {
  @override
  double transform(double t) {
    if (t < 0.25) {
      return t * 2;
    } else if (t < 0.75) {
      return 0.5;
    } else {
      return 0.5 + (t - 0.75) * 2;
    }
  }
}

