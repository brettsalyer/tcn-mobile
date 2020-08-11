import 'package:TCNMobile/tcn_widgets.dart';
import 'package:flutter/material.dart';
import 'package:TCNMobile/screens/digital_sermons/components/tcn_youtube.dart';
import 'package:youtube_data_v3/youtube_video.dart';

// This is not proper coding. This class should be reimplemtned using a
// FutureBuilder
class DigitalSermons extends StatefulWidget {
  @override
  _DigitalSermonsState createState() => _DigitalSermonsState();
}

class _DigitalSermonsState extends State<DigitalSermons> {
  final String pageTitle = "Digital Sermons";
  ScrollController _controller;
  final TcnYoutube yt = TcnYoutube();
  List<YtVideo> videoList = [];

  bool _isLoading = true;
  bool _hasMore = true;

  _scrollListener() async {
    if (_controller.offset >= _controller.position.maxScrollExtent &&
        !_controller.position.outOfRange) {
      yt.getChannelVideos(true).then((List<YtVideo> newVideos) {
        _isLoading = true;
        if (newVideos.isNotEmpty) {
          _isLoading = false;
          setState(() {
            this.videoList.addAll(newVideos);
          });
          print("Updating with new videos. New total is " +
              videoList.length.toString());
        } else {
          _hasMore = false;
        }
      });
    }
  }

  @override
  void dispose() {
    _controller.removeListener(_scrollListener);
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _controller = ScrollController();
    _controller.addListener(_scrollListener);
    _isLoading = true;
    _hasMore = true;
    yt.getChannelVideos(false).then((List<YtVideo> newVideos) {
      setState(() {
        this.videoList.addAll(newVideos);
      });
    });
    print("Initing 10 new videos");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(130, 130, 130, 100),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          this.pageTitle,
          style: TextStyle(
            fontFamily: "Roboto",
            fontWeight: FontWeight.w100,
            fontSize: 28,
          ),
        ),
      ),
      drawer: NavDrawer(),
      body: Center(
        child: ListView.builder(
          controller: _controller,
          itemCount: this.videoList.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              child: ListTile(
                leading: Image.network(
                    this.videoList[index].thumbnailDetails.high.url),
                title: Text(
                  this.videoList[index].title,
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
                subtitle: Text(this.videoList[index].description),
                onTap: () => yt.launchVideo(this.videoList[index].videoId),
                isThreeLine: true,
              ),
            );
          },
        ),
      ),
    );
  }
}
