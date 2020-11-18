import 'package:spotify/spotify.dart';

class SpotifyFetch{

  SpotifyFetch({this.artistId});



  final String _clientId = "ffed8f59b48443569b9bfc0cd092c86d";
  final String _clientSecret = "b3fd3cb17f19493fbb91f1656d27347b";
  final String artistId;

  SpotifyApiCredentials _credentials;
  SpotifyApi _spotify;




  void handleCredentials() {
    _credentials = SpotifyApiCredentials(_clientId, _clientSecret);
    _spotify = SpotifyApi(_credentials);
  }

  Future getTopTracks() async{
    handleCredentials();
    final _tracks = await _spotify.artists.getTopTracks(artistId, 'GB');
    print("CALL API ASDFGHJKL");
    return _tracks.toList();
  }

  Future<Image> getAlbumArt(Track track) async{
    AlbumSimple album = track.album;
    final albumArt = album.images;

    return albumArt[0];


  }

}