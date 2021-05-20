import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:streaming_app_ui/models/live.dart';
import 'package:streaming_app_ui/screens/live_page.dart';
import 'package:streaming_app_ui/widgets/circle_blur_painter.dart';

class FeaturedLiveCard extends StatefulWidget {
  final PageController _featuredLiveCardController;
  FeaturedLiveCard(this._featuredLiveCardController);
  @override
  _FeaturedLiveCardState createState() => _FeaturedLiveCardState();
}

class _FeaturedLiveCardState extends State<FeaturedLiveCard> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // blue blur stacked with card
        Positioned(
          top: 80,
          child: Opacity(
            opacity: 0.13,
            child: BlurWidget(
              width: 120,
              height: 150,
              blur: 55.0,
            ),
          ),
        ),
        // featured live card
        Container(
          height: 248,
          child: PageView(
            physics: BouncingScrollPhysics(),
            controller: widget._featuredLiveCardController,
            scrollDirection: Axis.horizontal,
            children: List.generate(featuredLive.length, (index) {
              return GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => LivePage(featuredLive[index])));
                },
                child: Container(
                  height: 248,
                  padding: EdgeInsets.symmetric(horizontal: 28),
                  child: Stack(
                    children: [
                      Container(
                          height: 248,
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), image: DecorationImage(image: AssetImage(featuredLive[index].background), fit: BoxFit.cover))),
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
                                  decoration: BoxDecoration(image: DecorationImage(fit: BoxFit.cover, image: AssetImage(featuredLive[index].avatar)), borderRadius: BorderRadius.circular(9)),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(featuredLive[index].name,
                                        style: GoogleFonts.notoSans(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                        )),
                                    SizedBox(
                                      height: 1,
                                    ),
                                    Text(featuredLive[index].title, style: GoogleFonts.notoSans(fontSize: 12, fontWeight: FontWeight.w500, color: Colors.white.withOpacity(0.5))),
                                  ],
                                )
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  featuredLive[index].streamTitle,
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
                                            featuredLive[index].viewer.toString() + 'k',
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
              );
            }),
          ),
        ),
      ],
    );
  }
}
