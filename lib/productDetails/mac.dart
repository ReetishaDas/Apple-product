import 'package:flutter/material.dart';
import 'package:appleprod_assignment/colors.dart';

class Mac extends StatefulWidget {
  @override
  _MacState createState() => _MacState();
}

class _MacState extends State<Mac> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        brightness: Brightness.light,
        backgroundColor: Color(0xff007C7C),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            size: 20,
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: size.height,
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xff007C7C),
                Colors.white,
              ],
              begin: Alignment.topCenter,
              end: Alignment.center,
            ),
          ),
          child: Column(
            children: [
              SizedBox(
                height: size.height,
                child: Stack(
                  children: [
                    SingleChildScrollView(
                      child: Container(
                        padding: EdgeInsets.only(
                          top: size.height * 0.12,
                          left: 8,
                          right: 8,
                        ),
                        margin: EdgeInsets.only(top: size.height * 0.3),
                        height: 500,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(34),
                            topRight: Radius.circular(34),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 18.0, bottom: 25),
                              child: Text(
                                "About Mac Air",
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(15.0),
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: 300,
                                        width: 320.0,
                                        child: SingleChildScrollView(
                                          child: Text(
                                            "Apple MacBook Air 2020 is a macOS laptop with a 13.30-inch display that has a resolution of 2560x1600 pixels. It is powered by a Core i3 processor and it comes with 8GB of RAM. The Apple MacBook Air 2020 packs 256GB of SSD storage. Graphics are powered by Integrated Graphics Processor.",
                                            style: TextStyle(
                                              fontSize: 20,
                                              color: contentTextColor,
                                              fontWeight: FontWeight.w400,
                                            ),
                                            textAlign: TextAlign.left,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    ProductTitleWithImage()
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ProductTitleWithImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "MacBook Air",
            style: Theme.of(context)
                .textTheme
                .headline4
                .copyWith(color: Colors.white, fontWeight: FontWeight.w800),
          ),
          Text(
            "iThink, therefore iMac",
            style: TextStyle(
              fontSize: 16,
              color: Colors.white,
              fontWeight: FontWeight.w400,
            ),
          ),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Price\n",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      TextSpan(
                        text: "\$1249",
                        style: Theme.of(context).textTheme.headline4.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.w800,
                            ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Image.asset(
                  "images/macproduct.png",
                  fit: BoxFit.fill,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
