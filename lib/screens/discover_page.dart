import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:streaming_app_ui/list_gradient.dart';
import 'package:streaming_app_ui/models/game_category.dart';

class DiscoverPage extends StatelessWidget {
  final ListGradient gradient = ListGradient();
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 30, left: 28),
          child: Text('Discover', style: GoogleFonts.notoSans(fontSize: 28, fontWeight: FontWeight.w600)),
        ),
        SizedBox(
          height: 35,
        ),
        // TODO: make a real searchbox
        Container(
          padding: EdgeInsets.only(left: 15, right: 20),
          height: 61,
          width: 358,
          margin: EdgeInsets.symmetric(horizontal: 28),
          decoration: BoxDecoration(color: Color(0xFF232A43), borderRadius: BorderRadius.circular(12)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'Type search here',
                style: GoogleFonts.notoSans(fontSize: 18, color: Color(0xFF525D79), fontWeight: FontWeight.w500),
              ),
              SvgPicture.asset(
                'assets/icons/search.svg',
                color: Colors.white,
                height: 22,
                width: 22,
              ),
            ],
          ),
        ),

        SizedBox(
          height: 25,
        ),

        // Category
        Container(
          padding: EdgeInsets.symmetric(horizontal: 28),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text('Category 🎮', style: GoogleFonts.notoSans(fontSize: 24, fontWeight: FontWeight.w600)),
              Text(
                'See All',
                style: GoogleFonts.notoSans(fontSize: 16, fontWeight: FontWeight.w600, foreground: Paint()..shader = gradient.textGradient),
              )
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 20, left: 18),
          height: 86,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            physics: BouncingScrollPhysics(),
            itemCount: gamedData.length,
            itemBuilder: (context, index) {
              return Container(
                height: 86,
                width: 86,
                margin: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(image: DecorationImage(image: AssetImage(gamedData[index].image)), borderRadius: BorderRadius.circular(14)),
              );
            },
          ),
        ),
        // end of category
        SizedBox(
          height: 30,
        ),
        // Pubg
        Container(
          padding: EdgeInsets.symmetric(horizontal: 28),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text('Pubg Mobile', style: GoogleFonts.notoSans(fontSize: 24, fontWeight: FontWeight.w600)),
              Text(
                'See All',
                style: GoogleFonts.notoSans(fontSize: 16, fontWeight: FontWeight.w600, foreground: Paint()..shader = gradient.textGradient),
              )
            ],
          ),
        ),

        // TODO : extract card and text widget for game to method and wrap with column
        // pubg card
        Container(
          margin: EdgeInsets.only(top: 20),
          height: 248,
          padding: EdgeInsets.symmetric(horizontal: 28),
          child: Stack(
            children: [
              Container(height: 248, decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), image: DecorationImage(image: AssetImage('assets/images/2.png'), fit: BoxFit.cover))),
              Container(
                  height: 248,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      gradient: LinearGradient(colors: [Color(0xFF181528), Color(0xFF181528).withOpacity(0)], begin: Alignment.bottomCenter, end: Alignment.topCenter))),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                height: 248,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: <Widget>[
                        Container(
                          width: 46,
                          height: 46,
                          decoration: BoxDecoration(image: DecorationImage(fit: BoxFit.cover, image: AssetImage('assets/images/profil3.png')), borderRadius: BorderRadius.circular(9)),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text('Xuxxy',
                                style: GoogleFonts.notoSans(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                )),
                            SizedBox(
                              height: 1,
                            ),
                            Text('Pro Player PUBG', style: GoogleFonts.notoSans(fontSize: 12, fontWeight: FontWeight.w500, color: Colors.white.withOpacity(0.5))),
                          ],
                        )
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Hello Guys!',
                          style: GoogleFonts.notoSans(fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: <Widget>[
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
                                    '3.1k',
                                    style: GoogleFonts.notoSans(fontSize: 14, fontWeight: FontWeight.w500),
                                  )
                                ],
                              ),
                            ),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),

        Container(
          margin: EdgeInsets.only(top: 20),
          padding: EdgeInsets.symmetric(horizontal: 28),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text('Mobile Legends', style: GoogleFonts.notoSans(fontSize: 24, fontWeight: FontWeight.w600)),
              Text(
                'See All',
                style: GoogleFonts.notoSans(fontSize: 16, fontWeight: FontWeight.w600, foreground: Paint()..shader = gradient.textGradient),
              )
            ],
          ),
        ),

        // Mobile Legends
        Container(
          margin: EdgeInsets.only(top: 20),
          height: 248,
          padding: EdgeInsets.symmetric(horizontal: 28),
          child: Stack(
            children: [
              Container(height: 248, decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), image: DecorationImage(image: AssetImage('assets/images/1.png'), fit: BoxFit.cover))),
              Container(
                  height: 248,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      gradient: LinearGradient(colors: [Color(0xFF181528), Color(0xFF181528).withOpacity(0)], begin: Alignment.bottomCenter, end: Alignment.topCenter))),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                height: 248,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: <Widget>[
                        Container(
                          width: 46,
                          height: 46,
                          decoration: BoxDecoration(image: DecorationImage(fit: BoxFit.cover, image: AssetImage('assets/images/profil2.png')), borderRadius: BorderRadius.circular(9)),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text('Jeruks',
                                style: GoogleFonts.notoSans(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                )),
                            SizedBox(
                              height: 1,
                            ),
                            Text('Pro Player Mobile Legend', style: GoogleFonts.notoSans(fontSize: 12, fontWeight: FontWeight.w500, color: Colors.white.withOpacity(0.5))),
                          ],
                        )
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Hello Guys!',
                          style: GoogleFonts.notoSans(fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: <Widget>[
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
                                    '3.1k',
                                    style: GoogleFonts.notoSans(fontSize: 14, fontWeight: FontWeight.w500),
                                  )
                                ],
                              ),
                            ),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 100,
        )
      ],
    );
  }
}
