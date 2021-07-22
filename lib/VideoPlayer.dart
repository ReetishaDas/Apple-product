import 'package:appleprod_assignment/colors.dart';
import 'package:appleprod_assignment/data.dart';
import 'package:appleprod_assignment/videoProgressIndicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'customButtonControlls.dart';
import 'videoControlWidget.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerPage extends StatefulWidget {
  final List<Duration> timestamps;
  final ProductInfo productInfo;

  const VideoPlayerPage({Key key, this.productInfo, this.timestamps})
      : super(key: key);

  @override
  _VideoPlayerPageState createState() => _VideoPlayerPageState();
}

class _VideoPlayerPageState extends State<VideoPlayerPage> {
  VideoPlayerController controller;
  final asset = 'assets/product.mp4';

  @override
  void initState() {
    super.initState();
    controller = VideoPlayerController.asset(asset);
    controller.addListener(() {
      setState(() {});
    });
    controller.setLooping(true);
    controller.initialize().then((_) => controller.play());
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(32.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 30,
                        ),
                        Container(
                          height: 200,
                          child: AspectRatio(
                            aspectRatio: 2,
                            child: Stack(
                              alignment: Alignment.bottomCenter,
                              children: [
                                VideoPlayer(controller),
                                VideoControlsWidget(
                                  controller: controller,
                                ),
                                CustomVideoProgressIndicator(
                                  controller,
                                  allowScrubbing: true,
                                  timestamps: widget.timestamps,
                                ),
                              ],
                            ),
                          ),
                        ),
                        //VideoPlayerWidget(controller: controller)
                        SizedBox(
                          height: 25,
                        ),
                        CustomControlsWidget(
                          timestamps: widget.timestamps,
                          controller: controller,
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Text(
                          widget.productInfo.PageHead,
                          style: TextStyle(
                            fontSize: 56,
                            color: primaryTextColor,
                            fontWeight: FontWeight.w900,
                          ),
                          textAlign: TextAlign.left,
                        ),
                        Text(
                          widget.productInfo.PageSub,
                          style: TextStyle(
                            fontSize: 31,
                            color: primaryTextColor,
                            fontWeight: FontWeight.w300,
                          ),
                          textAlign: TextAlign.left,
                        ),
                        Divider(
                          color: Colors.black38,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          height: 300,
                          width: 320.0,
                          child: SingleChildScrollView(
                            child: Text(
                              widget.productInfo.description ?? "",
                              style: TextStyle(
                                wordSpacing: 8,
                                fontSize: 20,
                                color: contentTextColor,
                                fontWeight: FontWeight.w500,
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Divider(
                          color: Colors.black38,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 32.0, bottom: 20),
                    child: Text(
                      "Gallery",
                      style: TextStyle(
                        fontSize: 25,
                        color: Color(0xff47455f),
                        fontWeight: FontWeight.w300,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 32.0),
                    height: 250,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: widget.productInfo.images.length,
                      itemBuilder: (context, index) {
                        return Card(
                          clipBehavior: Clip.antiAlias,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24)),
                          child: AspectRatio(
                              aspectRatio: 1.3,
                              child: Image.asset(
                                widget.productInfo.images[index],
                                fit: BoxFit.cover,
                              )),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            IconButton(
                icon: Icon(Icons.arrow_back_ios_outlined),
                onPressed: () {
                  Navigator.pop(context);
                })
          ],
        ),
      ),
    );
  }
}

class VideoPlayerWidget extends StatelessWidget {
  final VideoPlayerController controller;

  const VideoPlayerWidget({Key key, this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return controller != null && controller.value.isInitialized
        ? Container(
            alignment: Alignment.center,
            child: buildVideo(),
          )
        : Center(
            child: CircularProgressIndicator(),
          );
  }

  Widget buildVideo() => buildVideoPlayer();
  Widget buildVideoPlayer() =>
      AspectRatio(aspectRatio: 1.3, child: VideoPlayer(controller));
}

//controller.value.aspectRatio
