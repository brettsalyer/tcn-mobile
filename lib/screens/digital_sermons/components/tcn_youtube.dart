import 'package:youtube_data_v3/youtube_channel.dart';
import 'package:youtube_data_v3/youtube_data_v3.dart';
import 'package:youtube_data_v3/youtube_video.dart';
import 'package:url_launcher/url_launcher.dart';

class TcnYoutube {
  YoutubeV3 ytApi = YoutubeV3();
  String ytChannelId = "UC6qjNu84xNJXte6jGW3Or-g";
  YtChannel channel;
  List<YtVideo> channelVideos = [];

  TcnYoutube() {
    // Initilize YT Data API
    ytApi.init("AIzaSyDkafHFH6ONlBcGzGLwPTt64aXvT9SbiUE");
  }

  Future<YtChannel> _getChannel() async {
    YtChannel channel = await ytApi.getChannelFromId(this.ytChannelId);
    print("Initing channel");
    return channel;
  }

  Future<List<YtVideo>> getChannelVideos(bool showNext) async {
    print("Before API query");
    this.channel = await ytApi.getChannelFromId(this.ytChannelId);

    print("Getting Videos");
    channelVideos = await this.channel.getPageOfVideos(
        numResults: 10, showDuration: true, showNextPage: showNext);
    print("Done");

    print(channelVideos.length);
    return channelVideos;
  }

  void launchVideo(String id) async {
    String url = "https://youtube.com/watch?v=" + id;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
