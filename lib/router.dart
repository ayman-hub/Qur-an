



import 'package:auto_route/auto_route_annotations.dart';
import 'package:auto_route/transitions_builders.dart';
import 'package:moshaf/feature/presentaion/ui/pages/listen/Listen_page.dart';
import 'package:moshaf/feature/presentaion/ui/pages/listen/play_page.dart';
import 'package:moshaf/feature/presentaion/ui/pages/read/azkar_page.dart';
import 'package:moshaf/feature/presentaion/ui/pages/read/body_quran_page.dart';
import 'package:moshaf/feature/presentaion/ui/pages/read/quran_page.dart';
import 'package:moshaf/feature/presentaion/ui/pages/read/sorahs_page.dart';
import 'package:moshaf/feature/presentaion/ui/pages/watch/dydat_page.dart';
import 'package:moshaf/feature/presentaion/ui/pages/watch/zaker_page.dart';
import 'package:moshaf/feature/presentaion/ui/pages/watch/watch_page.dart';

import 'feature/presentaion/ui/pages/listen/body_page.dart';



@autoRouter
class $Router {
@initial
QuranPage quranPage;
@CustomRoute(
  transitionsBuilder: TransitionsBuilders.zoomIn,
  durationInMilliseconds: 100,
)
AzkarPage azkarPage;
@CustomRoute(
  transitionsBuilder: TransitionsBuilders.zoomIn,
  durationInMilliseconds: 100,
)
SorahsPage sorahsPage;
BodyQuranPage bodyQuranPage;
ListenPage listenPage;
@CustomRoute(
  transitionsBuilder: TransitionsBuilders.zoomIn,
  durationInMilliseconds: 100,
)
BodyPage bodyPage;
PlayPage playPage;
ZakerPage zakerPage;
DeedatPage deedatPage;
@CustomRoute(
  transitionsBuilder: TransitionsBuilders.zoomIn,
  durationInMilliseconds: 100,
)
WatchPage watchPage;


}