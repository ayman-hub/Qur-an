// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:auto_route/router_utils.dart';
import 'package:moshaf/feature/presentaion/ui/pages/read/quran_page.dart';
import 'package:moshaf/feature/presentaion/ui/pages/read/azkar_page.dart';
import 'package:auto_route/transitions_builders.dart';
import 'package:moshaf/feature/presentaion/ui/pages/read/sorahs_page.dart';
import 'package:moshaf/feature/presentaion/ui/pages/read/body_quran_page.dart';
import 'package:moshaf/feature/domain/entities/read_entities.dart';
import 'package:moshaf/feature/data/model/static_const_data.dart';
import 'package:moshaf/feature/presentaion/ui/pages/listen/Listen_page.dart';
import 'package:moshaf/feature/presentaion/ui/pages/listen/body_page.dart';
import 'package:moshaf/feature/domain/entities/Entities.dart';
import 'package:moshaf/feature/presentaion/ui/pages/listen/play_page.dart';
import 'package:moshaf/feature/domain/entities/body_entities.dart';
import 'package:moshaf/feature/presentaion/ui/pages/watch/zaker_page.dart';
import 'package:moshaf/feature/presentaion/ui/pages/watch/dydat_page.dart';
import 'package:moshaf/feature/presentaion/ui/pages/watch/watch_page.dart';

class Router {
  static const quranPage = '/';
  static const azkarPage = '/azkar-page';
  static const sorahsPage = '/sorahs-page';
  static const bodyQuranPage = '/body-quran-page';
  static const listenPage = '/listen-page';
  static const bodyPage = '/body-page';
  static const playPage = '/play-page';
  static const zakerPage = '/zaker-page';
  static const deedatPage = '/deedat-page';
  static const watchPage = '/watch-page';
  static GlobalKey<NavigatorState> get navigatorKey =>
      getNavigatorKey<Router>();
  static NavigatorState get navigator => navigatorKey.currentState;

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case Router.quranPage:
        if (hasInvalidArgs<Key>(args)) {
          return misTypedArgsRoute<Key>(args);
        }
        final typedArgs = args as Key;
        return MaterialPageRoute(
          builder: (_) => QuranPage(key: typedArgs),
          settings: settings,
        );
      case Router.azkarPage:
        if (hasInvalidArgs<Key>(args)) {
          return misTypedArgsRoute<Key>(args);
        }
        final typedArgs = args as Key;
        return PageRouteBuilder(
          pageBuilder: (ctx, animation, secondaryAnimation) =>
              AzkarPage(key: typedArgs),
          settings: settings,
          transitionsBuilder: TransitionsBuilders.zoomIn,
          transitionDuration: Duration(milliseconds: 200),
        );
      case Router.sorahsPage:
        if (hasInvalidArgs<Key>(args)) {
          return misTypedArgsRoute<Key>(args);
        }
        final typedArgs = args as Key;
        return PageRouteBuilder(
          pageBuilder: (ctx, animation, secondaryAnimation) =>
              SorahsPage(key: typedArgs),
          settings: settings,
          transitionsBuilder: TransitionsBuilders.zoomIn,
          transitionDuration: Duration(milliseconds: 200),
        );
      case Router.bodyQuranPage:
        if (hasInvalidArgs<BodyQuranPageArguments>(args, isRequired: true)) {
          return misTypedArgsRoute<BodyQuranPageArguments>(args);
        }
        final typedArgs = args as BodyQuranPageArguments;
        return MaterialPageRoute(
          builder: (_) => BodyQuranPage(
              key: typedArgs.key,
              data: typedArgs.data,
              listData: typedArgs.listData,
              type: typedArgs.type),
          settings: settings,
        );
      case Router.listenPage:
        if (hasInvalidArgs<Key>(args)) {
          return misTypedArgsRoute<Key>(args);
        }
        final typedArgs = args as Key;
        return MaterialPageRoute(
          builder: (_) => ListenPage(key: typedArgs),
          settings: settings,
        );
      case Router.bodyPage:
        if (hasInvalidArgs<BodyPageArguments>(args, isRequired: true)) {
          return misTypedArgsRoute<BodyPageArguments>(args);
        }
        final typedArgs = args as BodyPageArguments;
        return PageRouteBuilder(
          pageBuilder: (ctx, animation, secondaryAnimation) => BodyPage(
              key: typedArgs.key, nameEntities: typedArgs.nameEntities),
          settings: settings,
          transitionsBuilder: TransitionsBuilders.zoomIn,
          transitionDuration: Duration(milliseconds: 200),
        );
      case Router.playPage:
        if (hasInvalidArgs<PlayPageArguments>(args, isRequired: true)) {
          return misTypedArgsRoute<PlayPageArguments>(args);
        }
        final typedArgs = args as PlayPageArguments;
        return MaterialPageRoute(
          builder: (_) => PlayPage(
              key: typedArgs.key,
              Index: typedArgs.Index,
              list: typedArgs.list,
              name: typedArgs.name),
          settings: settings,
        );
      case Router.zakerPage:
        if (hasInvalidArgs<Key>(args)) {
          return misTypedArgsRoute<Key>(args);
        }
        final typedArgs = args as Key;
        return MaterialPageRoute(
          builder: (_) => ZakerPage(key: typedArgs),
          settings: settings,
        );
      case Router.deedatPage:
        if (hasInvalidArgs<Key>(args)) {
          return misTypedArgsRoute<Key>(args);
        }
        final typedArgs = args as Key;
        return MaterialPageRoute(
          builder: (_) => DeedatPage(key: typedArgs),
          settings: settings,
        );
      case Router.watchPage:
        if (hasInvalidArgs<WatchPageArguments>(args, isRequired: true)) {
          return misTypedArgsRoute<WatchPageArguments>(args);
        }
        final typedArgs = args as WatchPageArguments;
        return PageRouteBuilder(
          pageBuilder: (ctx, animation, secondaryAnimation) => WatchPage(
              key: typedArgs.key,
              entities: typedArgs.entities,
              listEntities: typedArgs.listEntities),
          settings: settings,
          transitionsBuilder: TransitionsBuilders.zoomIn,
          transitionDuration: Duration(milliseconds: 200),
        );
      default:
        return unknownRoutePage(settings.name);
    }
  }
}

//**************************************************************************
// Arguments holder classes
//***************************************************************************

//BodyQuranPage arguments holder class
class BodyQuranPageArguments {
  final Key key;
  final ReadEntities data;
  final List<ReadEntities> listData;
  final PageType type;
  BodyQuranPageArguments(
      {this.key,
      @required this.data,
      @required this.listData,
      @required this.type});
}

//BodyPage arguments holder class
class BodyPageArguments {
  final Key key;
  final NameEntities nameEntities;
  BodyPageArguments({this.key, @required this.nameEntities});
}

//PlayPage arguments holder class
class PlayPageArguments {
  final Key key;
  final int Index;
  final List<BodyEntities> list;
  final String name;
  PlayPageArguments(
      {this.key,
      @required this.Index,
      @required this.list,
      @required this.name});
}

//WatchPage arguments holder class
class WatchPageArguments {
  final Key key;
  final BodyEntities entities;
  final List<BodyEntities> listEntities;
  WatchPageArguments(
      {this.key, @required this.entities, @required this.listEntities});
}
