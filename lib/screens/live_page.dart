import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:streaming_app_ui/list_gradient.dart';
import 'package:streaming_app_ui/models/live.dart';
import 'package:streaming_app_ui/widgets/circle_blur_painter.dart';
import 'package:streaming_app_ui/widgets/gradient_button.dart';

class LivePage extends StatefulWidget {
  final Live liveData;
  LivePage(this.liveData);

  @override
  _LivePageState createState() => _LivePageState();
}

class _LivePageState extends State<LivePage> {
  final ListGradient gradient = ListGradient();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(gradient: gradient.appBackgroundColor),
          child: Stack(
            children: <Widget>[
              ListView(
                children: <Widget>[
                  // Live Video
                  Stack(
                    children: [
                      Container(
                        height: 315,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(image: DecorationImage(image: AssetImage(widget.liveData.background), fit: BoxFit.cover)),
                      ),
                      Container(
                        height: 315,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(colors: [Color(0xFF0C0F18).withOpacity(0.78), Color(0xFF0C0F18).withOpacity(0.24)], begin: Alignment.bottomCenter, end: Alignment.topCenter)),
                      ),
                      Positioned(
                        bottom: 15,
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          padding: EdgeInsets.symmetric(horizontal: 28),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: <Widget>[
                              Flexible(
                                  flex: 9,
                                  child: Text(
                                    'Edward is practicing for the tournament 🔥',
                                    style: GoogleFonts.notoSans(fontSize: 22, fontWeight: FontWeight.w600),
                                  )),
                              Flexible(
                                  flex: 3,
                                  child: Image(
                                    image: AssetImage('assets/icons/expand.png'),
                                  )),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 33),
                    width: MediaQuery.of(context).size.width,
                    height: 105,
                    decoration: BoxDecoration(color: Color(0xFF181E2F), borderRadius: BorderRadius.only(bottomLeft: Radius.circular(25), bottomRight: Radius.circular(25))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Container(
                              width: 63,
                              height: 63,
                              decoration: BoxDecoration(
                                image: DecorationImage(image: AssetImage(widget.liveData.avatar), fit: BoxFit.cover),
                                borderRadius: BorderRadius.circular(13),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 15),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    widget.liveData.name,
                                    style: GoogleFonts.notoSans(fontSize: 20, fontWeight: FontWeight.w600),
                                  ),
                                  SizedBox(
                                    height: 4,
                                  ),
                                  Text(
                                    widget.liveData.title,
                                    style: GoogleFonts.notoSans(fontSize: 12, fontWeight: FontWeight.w500, color: Colors.white.withOpacity(0.6)),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Container(
                          child: GradientButton(
                              height: 40,
                              width: 81,
                              borderRadius: BorderRadius.circular(10),
                              gradient: gradient.buttonBackgroundColor,
                              child: Text('Follow', style: GoogleFonts.notoSans(fontSize: 14, fontWeight: FontWeight.w500))),
                        )
                      ],
                    ),
                  ),
                  Container(),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 32),
                    color: Colors.transparent,
                    height: MediaQuery.of(context).size.height * 0.32,
                    width: MediaQuery.of(context).size.width,
                    child: ListView.builder(
                        reverse: true,
                        itemCount: comments.length,
                        itemBuilder: (context, index) {
                          return Container(
                            width: double.infinity,
                            padding: EdgeInsets.symmetric(vertical: 10),
                            color: Colors.transparent,
                            child: Row(
                              children: [
                                Text(
                                  comments[index].userName + ' : ',
                                  style: GoogleFonts.notoSans(fontSize: 18, fontWeight: FontWeight.w700, foreground: Paint()..shader = gradient.textGradient),
                                ),
                                Text(
                                  comments[index].userComments,
                                  style: GoogleFonts.notoSans(fontSize: 18, fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                          );
                        }),
                  )
                ],
              ),
              SizedBox(
                height: 8,
              ),
              // app bar
              Container(
                height: 60,
                width: MediaQuery.of(context).size.width,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        IconButton(
                          icon: SvgPicture.asset('assets/icons/back.svg'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          iconSize: 29,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Container(
                          width: 61,
                          height: 30,
                          decoration: BoxDecoration(color: Color(0xFF31A4C8), borderRadius: BorderRadius.circular(6)),
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            children: [
                              SvgPicture.asset('assets/icons/ellipse.svg'),
                              SizedBox(
                                width: 8,
                              ),
                              Text(
                                'Live',
                                style: GoogleFonts.notoSans(fontSize: 14, fontWeight: FontWeight.w500),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          width: 80,
                          height: 30,
                          decoration: BoxDecoration(color: Colors.grey[700], borderRadius: BorderRadius.circular(6)),
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            children: [
                              SvgPicture.asset('assets/icons/view.svg'),
                              SizedBox(
                                width: 8,
                              ),
                              Text(
                                widget.liveData.viewer.toString() + 'k',
                                style: GoogleFonts.notoSans(fontSize: 14, fontWeight: FontWeight.w500),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    IconButton(
                        icon: SvgPicture.asset(
                          'assets/icons/more.svg',
                          height: 36,
                        ),
                        onPressed: () {})
                  ],
                ),
              ),

              Positioned(
                right: 58,
                bottom: 44,
                child: BlurWidget(width: 16, height: 16, blur: 20.0),
              ),
              Positioned(
                bottom: 35,
                left: 122,
                child: Container(
                  width: 96,
                  height: 32,
                  color: Color(0xFFE23FD2).withOpacity(0.4),
                ),
              ),
              Positioned(
                bottom: 55,
                left: 43,
                child: Container(
                  width: 141,
                  height: 32,
                  color: Color(0xFF563FE2).withOpacity(0.2),
                ),
              ),
              Positioned(
                bottom: 0,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 28),
                  color: Colors.transparent,
                  height: 100,
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      ClipRRect(
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 60, sigmaY: 60),
                          child: Container(
                            width: (MediaQuery.of(context).size.width - (28 * 2)) * 80 / 100,
                            height: 74,
                            decoration: BoxDecoration(
                              color: Color(0xFF292D3C).withOpacity(0.3),
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              Positioned(
                bottom: 0,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 28),
                  color: Colors.transparent,
                  height: 100,
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        width: (MediaQuery.of(context).size.width - (28 * 2)) * 80 / 100,
                        height: 74,
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              'Type your comment',
                              style: GoogleFonts.notoSans(fontSize: 16, fontWeight: FontWeight.w600, color: Color(0xFF353F5C)),
                            ),
                            SvgPicture.asset('assets/icons/send.svg'),
                          ],
                        ),
                      ),
                      Image.asset('assets/images/gift_icon.png')
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
