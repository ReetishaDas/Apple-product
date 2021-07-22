import 'package:appleprod_assignment/VideoPlayer.dart';
import 'package:appleprod_assignment/data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'colors.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class VideoCard extends StatefulWidget {
  @override
  _VideoCardState createState() => _VideoCardState();
}

class _VideoCardState extends State<VideoCard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: gradientEndColor,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Color(0xff011840),
            Colors.white,
          ], stops: [
            0.3,
            0.7
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(32.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Explore",
                      style: TextStyle(
                        fontSize: 44,
                        color: Colors.white,
                        fontWeight: FontWeight.w900,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    Text(
                      "Gadgets Planet",
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.grey.shade500,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.left,
                    )
                  ],
                ),
              ),
              Container(
                height: 500,
                child: Padding(
                  padding: EdgeInsets.only(left: 32.0),
                  child: Swiper(
                    itemCount: product.length,
                    itemWidth: MediaQuery.of(context).size.width - 2 * 64,
                    layout: SwiperLayout.STACK,
                    pagination: SwiperPagination(
                        builder: DotSwiperPaginationBuilder(
                            activeSize: 18,
                            size: 10,
                            space: 8,
                            activeColor: Color(0xff011840))),
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => VideoPlayerPage(
                                        timestamps: <Duration>[
                                          Duration(minutes: 0, seconds: 33),
                                          Duration(minutes: 1, seconds: 03),
                                        ],
                                        productInfo: product[index],
                                      )));
                        },
                        child: Stack(
                          children: [
                            Column(
                              children: [
                                SizedBox(
                                  height: 100,
                                ),
                                Card(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30)),
                                  elevation: 8,
                                  shadowColor: secondaryTextColor,
                                  color: Colors.white,
                                  child: Padding(
                                    padding: EdgeInsets.all(28),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: 100,
                                        ),
                                        Text(
                                          product[index].name,
                                          style: TextStyle(
                                            fontSize: 44,
                                            color: Color(0xff47455f),
                                            fontWeight: FontWeight.w900,
                                          ),
                                          textAlign: TextAlign.left,
                                        ),
                                        Text(
                                          "Products",
                                          style: TextStyle(
                                            fontSize: 23,
                                            color: primaryTextColor,
                                            fontWeight: FontWeight.w500,
                                          ),
                                          textAlign: TextAlign.left,
                                        ),
                                        SizedBox(
                                          height: 32,
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              "Watch to Know More",
                                              style: TextStyle(
                                                fontSize: 14,
                                                color: Color(0xffe4979e),
                                                fontWeight: FontWeight.w500,
                                              ),
                                              textAlign: TextAlign.left,
                                            ),
                                            Icon(
                                              Icons.arrow_forward,
                                              color: secondaryTextColor,
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                            CircleAvatar(
                              backgroundColor: Colors.transparent,
                              radius: 140,
                              child: Image.asset(product[index].iconImage),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
