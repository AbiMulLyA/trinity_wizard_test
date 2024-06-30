// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    DetailContactRoute.name: (routeData) {
      final args = routeData.argsAs<DetailContactRouteArgs>(
          orElse: () => const DetailContactRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: DetailContactPage(
          key: args.key,
          firstName: args.firstName,
          lastName: args.lastName,
          email: args.email,
          dob: args.dob,
        ),
      );
    },
    MainRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MainPage(),
      );
    },
  };
}

/// generated route for
/// [DetailContactPage]
class DetailContactRoute extends PageRouteInfo<DetailContactRouteArgs> {
  DetailContactRoute({
    Key? key,
    String? firstName,
    String? lastName,
    String? email,
    String? dob,
    List<PageRouteInfo>? children,
  }) : super(
          DetailContactRoute.name,
          args: DetailContactRouteArgs(
            key: key,
            firstName: firstName,
            lastName: lastName,
            email: email,
            dob: dob,
          ),
          initialChildren: children,
        );

  static const String name = 'DetailContactRoute';

  static const PageInfo<DetailContactRouteArgs> page =
      PageInfo<DetailContactRouteArgs>(name);
}

class DetailContactRouteArgs {
  const DetailContactRouteArgs({
    this.key,
    this.firstName,
    this.lastName,
    this.email,
    this.dob,
  });

  final Key? key;

  final String? firstName;

  final String? lastName;

  final String? email;

  final String? dob;

  @override
  String toString() {
    return 'DetailContactRouteArgs{key: $key, firstName: $firstName, lastName: $lastName, email: $email, dob: $dob}';
  }
}

/// generated route for
/// [MainPage]
class MainRoute extends PageRouteInfo<void> {
  const MainRoute({List<PageRouteInfo>? children})
      : super(
          MainRoute.name,
          initialChildren: children,
        );

  static const String name = 'MainRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
