import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:http/http.dart' as http;
import 'package:checklist/models/music.dart';
import 'package:spotify/spotify.dart';
import 'package:google_fonts/google_fonts.dart';

class MusicScreen extends StatefulWidget {
  MusicScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MusicScreenState createState() => _MusicScreenState();
}

class _MusicScreenState extends State<MusicScreen> {
  @override
  void initState() {
    super.initState();
    getArtist();
  }

  List<Track> tracks = new List<Track>();

  String clientId = "ffed8f59b48443569b9bfc0cd092c86d";
  String clientSecret = "b3fd3cb17f19493fbb91f1656d27347b";

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
              future: getArtist(),
              builder: (context, topTracks) {
                if (topTracks.connectionState == ConnectionState.waiting) {
                  return SizedBox();
                } else {
                  return ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: tracks.length,
                      itemBuilder: (context, index) {
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
                      });
                }
              })
        ])),
      ),
    );
  }

  Future<List<Track>> getArtist() async {
    final SpotifyApiCredentials credentials =
        SpotifyApiCredentials(clientId, clientSecret);
    final SpotifyApi spotify = SpotifyApi(credentials);
    final tracks =
        await spotify.artists.getTopTracks('7LFdx7Ik3A9M6CDEnn4rfq', 'GB');
//
//    print(tracks.toList()[2].);
    return this.tracks = tracks.toList();

//    Map<String, dynamic> jsonData = jsonDecode(artist.body);
//    String url = 'https://api.spotify.com/v1/search?q=tania%20bowra&type=artist" -H "Authorization: Bearer {your access token}';
//
//    var response = await http.get(url);
//
//    Map<String, dynamic> jsonData = jsonDecode(response.body);
//
//    jsonData["tracks"].forEach((element) {
//      print(element.toString());
//
//      Music track = new Music();
//      track = Music.fromMap(element["name"]);
//      tracks.add(track);
//      print(tracks)
  }
}
