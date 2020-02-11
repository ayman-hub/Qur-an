import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moshaf/ads.dart';
import 'package:moshaf/feature/domain/entities/body_entities.dart';
import 'package:moshaf/router.gr.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../widget/connectivity_widget.dart';

class WatchPage extends StatefulWidget {
  WatchPage({Key key, @required this.entities, @required this.listEntities})
      : super(key: key);
  final BodyEntities entities;
  final List<BodyEntities> listEntities;

  @override
  _WatchPageState createState() {
    return _WatchPageState();
  }
}

class _WatchPageState extends State<WatchPage> {
  BodyEntities entities;
  YoutubePlayerController _youtubeController;
  final initialAds = CreateAds();

  @override
  void initState() {
    super.initState();

    entities = widget.entities;
    _youtubeController = YoutubePlayerController(
        initialVideoId: entities.url,
        flags: YoutubePlayerFlags(
          autoPlay: true,
          loop: true,
        ));
  }

  @override
  void dispose() {
    super.dispose();
    _youtubeController.dispose();
    initialAds.adsDiposed();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('watch'),
      ),
      body: Connectivity(
        getOnline: () => () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (_) => WatchPage(
                    entities: widget.entities,
                    listEntities: widget.listEntities),
              ),
            ),
        child: Column(
          children: <Widget>[
            Expanded(
              child: Card(
                child: Column(
                  children: <Widget>[
                    Flexible(
                      flex: 4,
                      child: YoutubePlayer(
                        controller: _youtubeController,
                        aspectRatio: 16 / 9,
                        onReady: () {
                          print('video is ready');
                        },
                        onEnded: (end) {
                          print(end.toString());
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (_) => WatchPage(
                                  entities: entities,
                                  listEntities: widget.listEntities),
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Flexible(
                      flex: 1,
                      child: Text(
                        widget.entities.name,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 13),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: widget.listEntities.length - 1,
                itemBuilder: (context, index) {
                  if (widget.listEntities[index].url == entities.url) {
                    entities = widget.listEntities[++index];
                  }
                  return Card(
                    elevation: 8,
                    shape: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                    color: Colors.brown[100],
                    child: SingleChildScrollView(
                      child: ListTile(
                        trailing: Container(
                          width: 100,
                          height: 100,
                          child: Image.network(
                            "http://i3.ytimg.com/vi/${widget.listEntities[index].url}/hqdefault.jpg",
                            fit: BoxFit.fill,
                          ),
                        ),
                        title: Text(
                          widget.listEntities[index].name,
                          textDirection: TextDirection.rtl,
                        ),
                        onTap: () {
                          setState(() {
                            Router.navigator.pushNamed(Router.watchPage,
                                arguments: WatchPageArguments(
                                  entities: widget.listEntities[index],
                                  listEntities: widget.listEntities,
                                ));
                            /*  Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (_) => WatchPage(
                                    entities: widget.listEntities[index],
                                    listEntities: widget.listEntities),
                              ),
                            );*/
                          });
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
