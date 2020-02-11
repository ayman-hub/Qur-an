import 'package:moshaf/feature/data/model/static_const_data.dart';
import 'package:moshaf/feature/presentaion/ui/pages/read/sorahs_page.dart';
import 'package:moshaf/feature/presentaion/ui/widget/drawer_widget.dart';
import 'package:moshaf/feature/presentaion/ui/widget/read/page_num_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rate_my_app/rate_my_app.dart';

class QuranPage extends StatefulWidget {
  QuranPage({Key key}) : super(key: key);

  @override
  _QuranPageState createState() {
    return _QuranPageState();
  }
}

class _QuranPageState extends State<QuranPage> {
  RateMyApp rateMyApp = RateMyApp(
    preferencesPrefix: 'rateMyApp_',
    minDays: 3,
    minLaunches: 4,
    remindDays: 2,
    remindLaunches: 4,
    // appStoreIdentifier: '',
    googlePlayIdentifier: 'com.ayman_atef.moshaf',
  );

  @override
  void initState() {
    super.initState();
    rateMyApp.init().then((_) {
       if (rateMyApp.shouldOpenDialog) {
      rateMyApp.showRateDialog(
        context,
        title: 'Rate this app', // The dialog title.
        message: 'If you like this app, please take a little bit of your time to review it !\nIt really helps us and it shouldn\'t take you more than one minute.', // The dialog message.
        rateButton: 'RATE', // The dialog "rate" button text.
        noButton: 'NO THANKS', // The dialog "no" button text.
        laterButton: 'MAYBE LATER', // The dialog "later" button text.
        listener: (button) { // The button click listener (useful if you want to cancel the click event).
          switch(button) {
            case RateMyAppDialogButton.rate:
              print('Clicked on "Rate".');
              break;
            case RateMyAppDialogButton.later:
              print('Clicked on "Later".');
              break;
            case RateMyAppDialogButton.no:
              print('Clicked on "No".');
              break;
          }

          return true; // Return false if you want to cancel the click event.
        },
        ignoreIOS: false, // Set to false if you want to show the native Apple app rating dialog on iOS.
        dialogStyle: DialogStyle(), // Custom dialog styles.
      );

      // Or if you prefer to show a star rating bar :

      rateMyApp.showStarRateDialog(
        context,
        title: 'Rate this app', // The dialog title.
        message: 'You like this app ? Then take a little bit of your time to leave a rating :', // The dialog message.
        onRatingChanged: (stars) { // Triggered when the user updates the star rating.
          return [ // Return a list of actions (that will be shown at the bottom of the dialog).
            FlatButton(
              child: Text('OK'),
              onPressed: () async {
                print('Thanks for the ' + (stars == null ? '0' : stars.round().toString()) + ' star(s) !');
                // You can handle the result as you want (for instance if the user puts 1 star then open your contact page, if he puts more then open the store page, etc...).
                await rateMyApp.callEvent(RateMyAppEventType.rateButtonPressed); // This allows to mimic the behavior of the default "Rate" button. See "Advanced > Broadcasting events" for more information.

                Navigator.pop(context);
              },
            ),
          ];
        },
        ignoreIOS: false, // Set to false if you want to show the native Apple app rating dialog on iOS.
        dialogStyle: DialogStyle( // Custom dialog styles.
          titleAlign: TextAlign.center,
          messageAlign: TextAlign.center,
          messagePadding: EdgeInsets.only(bottom: 20),
        ),
        starRatingOptions: StarRatingOptions(), // Custom star bar rating options.
      );
       }
    });
  }


  @override
  void dispose() {
    super.dispose();
  }

  int positions = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Read'),
          bottom: TabBar(
              indicator: BoxDecoration(
                  // border: Border.all(color: Colors.amberAccent),
                  ),
              onTap: (position) {
                setState(() {
                  positions = position;
                });
              },
              indicatorColor: Colors.amberAccent,
              labelColor: Colors.white,
              tabs: <Widget>[
                Tab(
                  child: Text(
                    'الفهرس',
                    style: TextStyle(
                        fontSize: positions == 0 ? 20 : 15,
                        color:
                            positions == 0 ? Colors.amberAccent : Colors.white),
                  ),
                ),
                Tab(
                  child: Text(
                    'الصفحة',
                    style: TextStyle(
                        fontSize: positions == 1 ? 20 : 15,
                        color:
                            positions == 1 ? Colors.amberAccent : Colors.white),
                  ),
                ),
              ]),
        ),
        endDrawer: DrawerWidget(),
        body: TabBarView(children: <Widget>[
          SorahsPage(),
          PageNumWidget(type: PageType.QURAN_PAGE,),
        ]),
      ),
    );
  }
}
