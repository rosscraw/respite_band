import 'dart:convert';

import 'package:checklist/views/custom_widgets/loading_spinner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:http/http.dart' as http;
import 'package:checklist/models/music.dart';
import 'package:spotify/spotify.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:async/async.dart';

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

  Future _future;

  @override
  void initState() {
    _future = getArtist();
    super.initState();
  }
  final AsyncMemoizer _memoizer = AsyncMemoizer();
  List<Track> tracks = new List<Track>();
  String _clientId = "ffed8f59b48443569b9bfc0cd092c86d";
  String _clientSecret = "b3fd3cb17f19493fbb91f1656d27347b";


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[850],
      body: SingleChildScrollView(
        child: Container(
            child: Column(children: <Widget>[
          Center(
            child: Text('Respite Top Spotify Tracks',
                style: GoogleFonts.robotoSlab(
                  color: const Color.fromARGB(205, 212, 175, 55), fontSize: 20,
                )),
          ),
          FutureBuilder(
              future: _future,
              builder: (context, topTracks) {
                // Shows loading spinner animation when waiting on response from API.
                if (topTracks.connectionState == ConnectionState.waiting) {
                  return LoadingSpinner();
                } else {
                  return ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: tracks.length,
                      itemBuilder: (context, index) {
                        return trackCard(index);//
                      });
                }
              })
        ])),
      ),
    );
  }

  /// Fetches top tracks using Spotify API.
  Future getArtist()  {
    return this._memoizer.runOnce(() async {
      final SpotifyApiCredentials _credentials =
      SpotifyApiCredentials(_clientId, _clientSecret);
      final SpotifyApi _spotify = SpotifyApi(_credentials);
      final _tracks =
      await _spotify.artists.getTopTracks('7LFdx7Ik3A9M6CDEnn4rfq', 'GB');
      print("CALL API");
      return this.tracks = _tracks.toList();
    });
  }

  /// [Card] that displays details about a track.
  ///
  /// Displays track name, popularity and duration.
  /// TODO Get album art and link to song on Spotify.
  Card trackCard(int index) {
    return Card(
      color: Colors.grey[900],
      //TODO album art shown in card
      child: ListTile(
        //TODO link to play on spotify
        leading: Icon(Icons.play_circle_outline, color: const Color.fromARGB(205, 212, 175, 55),),
        title: Text(
          tracks[index].name,
          style: GoogleFonts.robotoSlab(
            color: const Color.fromARGB(205, 212, 175, 55),
          ),
        ),
        subtitle: Row(
          children: [
            Text(tracks[index].duration.inMinutes.toString() + ":" + (tracks[index].duration.inSeconds % 60).toString() ,
                style: GoogleFonts.robotoSlab(
                  color:
                  const Color.fromARGB(205, 212, 175, 55),
                )),
            SizedBox(
              width: 8,
            ),
            Text("Popularity: ", style: GoogleFonts.robotoSlab(
              color:
              const Color.fromARGB(205, 212, 175, 55),
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
              ),
              itemSize: 16,
            )
          ],
        ),
        //TODO album art shown in card
        trailing: CircleAvatar(
          backgroundImage: NetworkImage("https://scontent.fman1-1.fna.fbcdn.net/v/t31.0-8/25394805_2231281893552389_6299064154195032122_o.jpg?_nc_cat=103&ccb=2&_nc_sid=09cbfe&_nc_ohc=0QvqOn_Z2fwAX8ZRPdw&_nc_ht=scontent.fman1-1.fna&oh=607e4052d5eaebf5dc066375bf7c83f8&oe=5FDA253E"),
        ) ,
      ),
    );
  }
}
