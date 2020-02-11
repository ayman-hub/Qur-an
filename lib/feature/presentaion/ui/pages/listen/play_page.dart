import 'dart:async';
import 'dart:math';

import 'package:audioplayers/audioplayers.dart';
import 'package:moshaf/feature/domain/entities/body_entities.dart';
import 'package:moshaf/feature/presentaion/ui/widget/connectivity_widget.dart';
import 'package:moshaf/feature/presentaion/ui/widget/drawer_widget.dart';
import 'package:moshaf/feature/presentaion/ui/widget/show_transformer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_media_notification/flutter_media_notification.dart';
import 'package:transformer_page_view/transformer_page_view.dart';

import '../../../../../ads.dart';



enum PlayerState { stopped, playing, paused }

@immutable
class PlayPage extends StatefulWidget {
  int Index;
  List<BodyEntities> list;
  String name;

  PlayPage({Key key, @required this.Index,@required this.list,@required this.name}) : super(key: key);

  @override
  _PlayPageState createState() {
    return _PlayPageState(Index);
  }
}

class _PlayPageState extends State<PlayPage> {
  final initialAds = CreateAds();
  Duration duration;
  Duration position;
  AudioPlayer audioPlayer = AudioPlayer(mode: PlayerMode.MEDIA_PLAYER);
  IndexController indexController = IndexController();

  PlayerState playerState = PlayerState.stopped;

  _PlayPageState(this.urlIndex);

  int urlIndex;
  bool repeat = true;

  Random random = Random();

  get isPlaying => playerState == PlayerState.playing;

  get isPaused => playerState == PlayerState.paused;

  get durationText =>
      duration != null ? duration.toString().split('.').first : '';

  get positionText =>
      position != null ? position.toString().split('.').first : '';

  @override
  void initState() {
    super.initState();
    initAudioPlayer();
    play(urlIndex);



    MediaNotification.setListener('pause', () {
      setState(() => pause());
    });

    MediaNotification.setListener('play', () {
      setState(() => play(urlIndex));
    });

    MediaNotification.setListener('next', () {
      ++urlIndex;
      play(urlIndex);
    });

    MediaNotification.setListener('prev', () {
      --urlIndex;
      play(urlIndex);
    });

    // MediaNotification.setListener('select', () {});
  }

  play(int index) async {
    int result = await audioPlayer.play(widget.list[index].url);
    if (result == 1) {
      setState(() {
        playerState = PlayerState.playing;
        MediaNotification.showNotification(
            title: widget.list[urlIndex].name, author: widget.name);
      });
      indexController.move(urlIndex, animation: true);
    }
  }

  pause() async {
    await audioPlayer.pause();
    setState(() => playerState = PlayerState.paused);
    MediaNotification.showNotification(
        title: widget.list[urlIndex].name,
        author: widget.name,
        isPlaying: false);
  }

  stop() async {
    await audioPlayer.stop();
    setState(() {
      playerState = PlayerState.stopped;
      position = new Duration();
    });
  }

  void onComplete() {
    setState(() => playerState = PlayerState.stopped);
  }

  Future initAudioPlayer() async {
    audioPlayer.onDurationChanged.listen((Duration d) {
      setState(() => duration = d);
    });
    audioPlayer.onAudioPositionChanged.listen((Duration p) {
      setState(() => position = p);
    });
    audioPlayer.onPlayerCompletion.listen((event) {
      onComplete();
      setState(() {
        position = duration;
        if (repeat) {
          ++urlIndex;
          initialAds.createInterstitialAd();
        } else {
          urlIndex = random.nextInt(widget.list.length);
        }
        indexController.move(urlIndex, animation: true);
        play(urlIndex);
      });
    });
    audioPlayer.onPlayerError.listen((msg) {
      setState(() {
        playerState = PlayerState.stopped;
        duration = Duration(seconds: 0);
        position = Duration(seconds: 0);
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    audioPlayer.dispose();
    MediaNotification.hideNotification();
    stop();
    initialAds.adsDiposed();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        actions: [
          Row(
            children: <Widget>[
              SizedBox(
                width: 10,
              ),
              Text(widget.list[urlIndex].name, style: TextStyle(fontSize: 27)),
              SizedBox(
                width: 10,
              ),
              Image.asset('images/ayat.png'),
              SizedBox(
                width: 10,
              ),
            ],
          ),
        ],
      ),
      endDrawer: DrawerWidget(),
      body: Container(
        color: Colors.brown[100],
        child: Column(
          children: <Widget>[
            Container(
                height: MediaQuery.of(context).size.height / 2 - 100,
                child: getFaceScreen(context, widget.list)),
            Container(
              height: 70,
              child: getSlider(),
            ),
            Container(
              width: 213,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  border: Border.all(color: Colors.brown)),
              child: Row(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 5, right: 10, left: 10),
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(color: Colors.black)),
                    child: IconButton(
                        icon: Icon(
                          Icons.stop,
                          size: 25,
                          color: Colors.black,
                        ),
                        onPressed: isPlaying || isPaused ? () => stop() : null),
                  ),
                  Container(
                      height: 70,
                      width: 70,
                      decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(color: Colors.black)),
                      child: IconButton(
                          icon: Icon(
                            isPlaying ? Icons.pause : Icons.play_arrow,
                            size: 50,
                          ),
                          onPressed: isPlaying
                              ? () => pause()
                              : () => play(urlIndex))),
                  Container(
                    margin: EdgeInsets.only(top: 5, right: 10, left: 10),
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(color: Colors.black)),
                    child: IconButton(
                        icon: Icon(
                          repeat ? Icons.repeat : Icons.shuffle,
                          size: 25,
                          color: Colors.black,
                        ),
                        onPressed: () {
                          setState(() {
                            repeat = !repeat;
                          });
                        }),
                  ),
                ],
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height / 3.3,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(20),
                            bottomRight: Radius.circular(20)),
                        color: Colors.brown,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 10,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      padding: EdgeInsets.all(10),
                      width: MediaQuery.of(context).size.width / 2,
                      child: listLocation(context, widget.list),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            bottomLeft: Radius.circular(20)),
                        color: Colors.brown,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget getFaceScreen(BuildContext context, List<BodyEntities> items) {
    int getIndex = 0;

    return Stack(
      children: <Widget>[
        Container(
          height: MediaQuery.of(context).size.height / 2.3,
          width: MediaQuery.of(context).size.width,
         // margin: EdgeInsets.only(top: 20),
          child: TransformerPageView(
            controller: indexController,
            itemCount: items.length,
            itemBuilder: (context, index) {
              return Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('images/khalfya.jpg'),fit: BoxFit.cover)),
                child: Text(
                  " سورة " + items[index].name,
                  style: TextStyle(color: Colors.brown[400], fontSize: 35),
                ),
              );
            },
            transformer: ShowTransformer(),
            curve: Curves.easeOutQuint,
            viewportFraction: 0.8,
            onPageChanged: (index) {
              getIndex = index;
              urlIndex = index;
              play(urlIndex);
            },
            index: urlIndex,
          ),
        ),
        Positioned(
          top: MediaQuery.of(context).size.height / 4 + 15,
          left: 320,
          height: 50,
          width: 50,
          child: Container(
              child: IconButton(
                  icon: Icon(
                    Icons.arrow_forward,
                    size: 30,
                    color: Colors.brown,
                  ),
                  onPressed: () => indexController.move(++getIndex))),
        ),
        Positioned(
          top: MediaQuery.of(context).size.height / 4 + 15,
          right: 320,
          height: 50,
          width: 50,
          child: Container(
              child: IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    size: 30,
                    color: Colors.brown,
                  ),
                  onPressed: () => indexController.move(--getIndex))),
        )
      ],
    );
  }

  Widget listLocation(BuildContext context, List<BodyEntities> items) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return Card(
          color: Colors.amberAccent[100],
          elevation: 10,
          child: ListTile(
            title: Text(items[index].name),
            onTap: () {
              isPlaying || isPaused ? () => stop() : null;
              urlIndex = index;
              play(urlIndex);
              indexController.move(urlIndex);
            },
          ),
        );
      },
    );
  }

  Widget getSlider() {
    // return
    return Connectivity(
        getOnline: () => play(urlIndex),
        child: Column(
          children: <Widget>[
            duration == null
                ? new CircularProgressIndicator()
                : new Slider.adaptive(
                    value: position != null
                        ? position.inMilliseconds >= duration.inMilliseconds
                            ? duration.inMilliseconds.toDouble()
                            : position?.inMilliseconds?.toDouble() ?? 0.0
                        : 0.0,
                    onChanged: (double value) =>
                        audioPlayer.seek(Duration(milliseconds: value.round())),
                    activeColor: Colors.brown[300],
                    min: 0,
                    max: duration.inMilliseconds.toDouble(),
                  ),
            Row(
              children: <Widget>[
                SizedBox(
                  width: 20,
                ),
                Text(position != null ? positionText : " 0:0"),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 1.5,
                ),
                Text(duration != null ? durationText : " 0:0"),
              ],
            )
          ],
        ));
  }
}
