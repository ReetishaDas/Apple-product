import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../colors.dart';

class IPhone extends StatefulWidget {
  @override
  _IPhoneState createState() => _IPhoneState();
}

class _IPhoneState extends State<IPhone> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        brightness: Brightness.light,
        backgroundColor: secondaryTextColor.withOpacity(0.5),
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
                secondaryTextColor.withOpacity(0.5),
                Colors.white,
              ],
              begin: Alignment.topCenter,
              end: Alignment.centerRight,
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
                                "About the Phone",
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
                                            "The iPhone 12 Pro Max display has rounded corners that follow a beautiful curved design, and these corners are within a standard rectangle. When measured as a standard rectangular shape, the screen is 16.95 centimetres (6.68 inches) diagonally (actual viewable area is less).",
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
            "iPhone 12Pro",
            style: Theme.of(context)
                .textTheme
                .headline4
                .copyWith(color: primaryTextColor, fontWeight: FontWeight.w800),
          ),
          Text(
            "This Changes Everything",
            style: TextStyle(
              fontSize: 16,
              color: primaryTextColor,
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
                          color: primaryTextColor,
                        ),
                      ),
                      TextSpan(
                        text: "\$ 906",
                        style: Theme.of(context).textTheme.headline4.copyWith(
                              color: primaryTextColor,
                              fontWeight: FontWeight.w800,
                            ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: 75,
              ),
              Expanded(
                child: Image.asset(
                  "images/iphoneproduct.png",
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
