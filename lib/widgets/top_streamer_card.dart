import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:streaming_app_ui/list_gradient.dart';
import 'package:streaming_app_ui/models/streamer.dart';
import 'package:streaming_app_ui/widgets/gradient_button.dart';

class TopStreamerCard extends StatelessWidget {
  final ListGradient gradient = ListGradient();
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 18),
      height: 280,
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: topStreamer.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            height: 280,
            width: 192,
            padding: EdgeInsets.symmetric(vertical: 32),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(17),
              color: Theme.of(context).accentColor,
            ),
            // card inside
            child: Column(
              children: <Widget>[
                Container(
                  width: 77,
                  height: 77,
                  decoration: BoxDecoration(image: DecorationImage(fit: BoxFit.cover, image: AssetImage(topStreamer[index].avatar)), borderRadius: BorderRadius.circular(13)),
                ),
                SizedBox(
                  height: 14,
                ),
                Text(
                  topStreamer[index].name,
                  style: GoogleFonts.notoSans(fontSize: 20, fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  topStreamer[index].title,
                  style: GoogleFonts.notoSans(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.white.withOpacity(0.6)),
                ),
                SizedBox(
                  height: 25,
                ),
                GradientButton(
                    height: 42,
                    width: 121,
                    borderRadius: BorderRadius.circular(10),
                    gradient: gradient.buttonBackgroundColor,
                    child: Text('Follow', style: GoogleFonts.notoSans(fontSize: 16, fontWeight: FontWeight.w600)))
              ],
            ),
          );
        },
      ),
    );
  }
}
