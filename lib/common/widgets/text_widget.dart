
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TipsTexts extends StatelessWidget {
  const TipsTexts({
    super.key, required this.infoTitle, required this.infoSubTitle,
  });


  final String infoTitle;
  final String infoSubTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 5),
          child: Text(
              infoTitle,
              style: GoogleFonts.bebasNeue(
                fontSize: 22,
              )),
        ),
        Text(
          infoSubTitle,
          style: GoogleFonts.nunito(
              fontWeight: FontWeight.w700, color: Colors.white, fontSize: 18),
        ),
      ],
    );
  }
}