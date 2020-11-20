import 'dart:convert';

import 'package:checklist/services/spotify_fetch.dart';
import 'package:checklist/views/custom_widgets/loading_spinner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:http/http.dart' as http;
import 'package:checklist/models/music.dart';
import 'package:spotify/spotify.dart' as Spotify;
import 'package:google_fonts/google_fonts.dart';
import 'package:async/async.dart';
//import 'package:image/image.dart' as img;
/// Music Screen that displays the artist's top songs from Spotify.
///
/// Shows the track title, duration and popularity in a [Card].
class MusicScreen extends StatefulWidget {
  MusicScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MusicScreenState createState() => _MusicScreenState();
}

class _MusicScreenState extends State<MusicScreen> {

  //Future _future;
  String _artistId = '7LFdx7Ik3A9M6CDEnn4rfq';
  SpotifyFetch _spotifyFetch = new SpotifyFetch(artistId: '7LFdx7Ik3A9M6CDEnn4rfq');


//  @override
//  void initState() {
//    _future = getTopTracks();
//    super.initState();
//  }

  //final AsyncMemoizer _memoizer = AsyncMemoizer();
  List<Spotify.Track> tracks = new List<Spotify.Track>();
//  String _clientId = "ffed8f59b48443569b9bfc0cd092c86d";
//  String _clientSecret = "b3fd3cb17f19493fbb91f1656d27347b";


  @override
  Widget build(BuildContext context) {
    //SpotifyFetch _spotifyFetch = new SpotifyFetch(artistId: _artistId);

    return Scaffold(
      backgroundColor: Colors.grey[850],
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
              child: Column(children: <Widget>[
            Center(
              child: Text('Respite Top Spotify Tracks',
                  style: GoogleFonts.robotoSlab(
                    color: const Color.fromARGB(205, 212, 175, 55), fontSize: 20,
                  )),
            ),
            FutureBuilder(
                future: _spotifyFetch.getTopTracks(),
                builder: (context, topTracks) {
                  // Shows loading spinner animation when waiting on response from API.
                  if (topTracks.connectionState == ConnectionState.waiting) {
                    return LoadingSpinner();
                  } else {
                    tracks = topTracks.data;
                    return ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: tracks.length,
                        itemBuilder: (context, index) {
                          return trackCard(tracks[index], index);//
                        });
                  }
                })
          ])),
        ),
      ),
    );
  }

//  /// Fetches top tracks using Spotify API.
//  Future getTopTracks() async {
//    //return this._memoizer.runOnce(() async {
//      final SpotifyApiCredentials _credentials =
//      SpotifyApiCredentials(_clientId, _clientSecret);
//      final SpotifyApi _spotify = SpotifyApi(_credentials);
//      final _tracks =
//      await _spotify.artists.getTopTracks('7LFdx7Ik3A9M6CDEnn4rfq', 'GB');
//      print("CALL API");
//      return this.tracks = _tracks.toList();
//    //);
//  }

//  /// [Card] that displays details about a track.
//  ///
//  /// Displays track name, popularity and duration.
//  /// TODO Get album art and link to song on Spotify.
//  Container trackCard(Spotify.Track track, int index) {
//    Future albumArt = _spotifyFetch.getAlbumArt(track);
//    return Container(
//      height: 100,
//      child: Card(
//        color: Colors.grey[900],
//        //TODO album art shown in card
//        child: ListTile(
//          //TODO link to play on spotify
//          leading: Icon(Icons.play_circle_outline, color: const Color.fromARGB(205, 212, 175, 55),),
//          title: Text(
//            tracks[index].name,
//            style: GoogleFonts.robotoSlab(
//              color: const Color.fromARGB(205, 212, 175, 55),
//            ),
//          ),
//          subtitle: Row(
//            children: [
//              Text(tracks[index].duration.inMinutes.toString() + ":" + (tracks[index].duration.inSeconds % 60).toString() ,
//                  style: GoogleFonts.robotoSlab(
//                    color:
//                    const Color.fromARGB(205, 212, 175, 55),
//                  )),
//              SizedBox(
//                width: 8,
//              ),
//              Text("Popularity: ", style: GoogleFonts.robotoSlab(
//                color:
//                const Color.fromARGB(205, 212, 175, 55),
//              )),
//              SizedBox(
//                width: 8,
//              ),
//              RatingBar(
//                initialRating: tracks[index].popularity.toDouble(),
//                itemCount: 5,
//                itemBuilder: (context, _) => Icon(
//                  Icons.music_note,
//                  color: const Color.fromARGB(205, 212, 175, 55),
//                ),
//                itemSize: 16,
//              )
//            ],
//          ),
//          //TODO album art shown in card
//          trailing: FutureBuilder(
//              future: albumArt,
//            builder: (context, art) {
//              // Shows loading spinner animation when waiting on response from API.
//              if (art.connectionState == ConnectionState.waiting) {
//                return SizedBox();
//              } else {
//               var artImage = art.data;
//                return SizedBox(
////                height: 30,
////                width: 30,
//                  child: Image.network(art.data.url)
////                  decoration: BoxDecoration(
////                  image: DecorationImage(
////                    image: NetworkImage(art.data.url) //<--- .image added here
//                );}
//              }
//      )
//
//        ),
//      ),
//    );
//  }

  /// [Card] that displays details about a track.
  ///
  /// Displays track name, popularity and duration.
  /// TODO Get album art and link to song on Spotify.
  Container trackCard(Spotify.Track track, int index) {
    Future albumArt = _spotifyFetch.getAlbumArt(track);
    return Container(
      height: 100,
      child: Card(
        color: Colors.grey[900],
        //TODO album art shown in card
        child: Row(
          children: <Widget>[
            // Album's picture.
            SizedBox(
                child: FutureBuilder(
                    future: albumArt,
                    builder: (context, art) {
                      // Shows loading spinner animation when waiting on response from API.
                      if (art.connectionState == ConnectionState.waiting) {
                        return SizedBox();
                      } else {
                        return SizedBox(
                            child: Image.network(art.data.url)
                        );}                    }
                )
            ),
            SizedBox(
              width: 16,
            ),
            // Column of member's name and role in band.
            Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  // Track title.
                  Text(
                    tracks[index].name,
                    style: GoogleFonts.robotoSlab(
                      color: const Color.fromARGB(205, 212, 175, 55), fontSize: 18,
                    ),
                  ),
                  // Track duration and popularity rating.
                  Row(
                    children: [
                      Text(tracks[index].duration.inMinutes.toString() + ":" + (tracks[index].duration.inSeconds % 60).toString() ,
                          style: GoogleFonts.robotoSlab(
                            color:
                            const Color.fromARGB(205, 212, 175, 55), fontSize: 15
                          )),
                      SizedBox(
                        width: 8,
                      ),
                      Text("Popularity: ", style: GoogleFonts.robotoSlab(
                        color:
                        const Color.fromARGB(205, 212, 175, 55), fontSize: 15
                      )),
                      SizedBox(
                        width: 8,
                      ),
                      RatingBar(
                        initialRating: tracks[index].popularity.toDouble(),
                        itemCount: 5,
                        itemBuilder: (context, _) => Icon(
                          Icons.music_note,
                          color: const Color.fromARGB(205, 212, 175, 55),
                          size: 15,
                        ),
                        itemSize: 16,
                      )
                    ],
                  ),],
              ),
            ),
            // More info button.
            // TODO link to song, whether direct to spotify or in app preview.
            Expanded(
              flex: 1,
              child: Icon(Icons.play_circle_outline, color: const Color.fromARGB(205, 212, 175, 55),),

            ),
          ],
        )
      ),
    );
  }
}
