import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:streaming_app_ui/list_gradient.dart';
import 'package:streaming_app_ui/models/live.dart';
import 'package:streaming_app_ui/widgets/circle_blur_painter.dart';
import 'package:streaming_app_ui/widgets/featured_live_card.dart';
import 'package:streaming_app_ui/widgets/top_streamer_card.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ListGradient gradient = ListGradient();
  final PageController _featuredLiveCardController = PageController(viewportFraction: 1);
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SizedBox(
          height: 30,
        ),

        // greeting
        Container(
          padding: EdgeInsets.symmetric(horizontal: 28),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Hello, Jhonny', style: GoogleFonts.notoSans(fontSize: 28, fontWeight: FontWeight.w600)),
                  SizedBox(
                    height: 5,
                  ),
                  Text('Enjoy the live game streaming platform', style: GoogleFonts.notoSans(fontSize: 14, fontWeight: FontWeight.w400, color: Colors.white.withOpacity(0.5)))
                ],
              ),
              Container(
                width: 55,
                height: 55,
                decoration: BoxDecoration(
                  image: DecorationImage(fit: BoxFit.cover, image: AssetImage('assets/images/profil5.png')),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(13),
                ),
              )
            ],
          ),
        ),

        SizedBox(
          height: 35,
        ),

        // Featured Live
        FeaturedLiveCard(_featuredLiveCardController),

        SizedBox(
          height: 12,
        ),

        // featured live card indicator
        Center(
          child: SmoothPageIndicator(
            controller: _featuredLiveCardController, // PageController
            count: featuredLive.length,
            effect: SwapEffect(activeDotColor: Theme.of(context).primaryColor, dotColor: Color(0xFF343B5C), dotHeight: 5, dotWidth: 5),
          ),
        ),

        SizedBox(
          height: 18,
        ),

        // Top Streamer
        Container(
          padding: EdgeInsets.symmetric(horizontal: 28),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text('Top Streamer 🔥', style: GoogleFonts.notoSans(fontSize: 24, fontWeight: FontWeight.w600)),
              Text(
                'See All',
                style: GoogleFonts.notoSans(fontSize: 16, fontWeight: FontWeight.w600, foreground: Paint()..shader = gradient.textGradient),
              )
            ],
          ),
        ),

        SizedBox(
          height: 20,
        ),

        // Top Streamer card
        TopStreamerCard(),

        SizedBox(
          height: 150,
        ),
      ],
    );
  }
}
