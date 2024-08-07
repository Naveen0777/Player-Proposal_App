import 'package:flutter/material.dart';
import 'package:pro/youtube_shorts.dart';

class PixelPerfect extends StatelessWidget {
  const PixelPerfect({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            SizedBox(
                child: Image.asset(
              'assets/images/top.png',
              // height: 300.0,
            )),
            Expanded(
              child: ListView(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                children: [
                  Stack(
                    children: [
                      Image.asset(
                        'assets/images/1.png',
                        width: 400.0,
                        fit: BoxFit.cover,
                      ),
                      Positioned(
                        bottom: 0.0,
                        right: 20.0,
                        child: SizedBox(
                          height: 80.0,
                          child: Image.asset('assets/images/love-arrow.png'),
                        ),
                      )
                    ],
                  ),
                  Stack(
                    children: [
                      Image.asset(
                        'assets/images/2.png',
                        width: 400.0,
                        fit: BoxFit.cover,
                      ),
                      Positioned(
                        bottom: 0.0,
                        right: 20.0,
                        child: SizedBox(
                          height: 80.0,
                          child: Image.asset('assets/images/love-arrow.png'),
                        ),
                      )
                    ],
                  ),
                  Stack(
                    children: [
                      Image.asset(
                        'assets/images/3.png',
                        width: 400.0,
                        fit: BoxFit.cover,
                      ),
                      Positioned(
                        bottom: 0.0,
                        right: 20.0,
                        child: SizedBox(
                          height: 80.0,
                          child: Image.asset('assets/images/down-left.png'),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const YoutubeShortsPlayer()));
              },
              child: Center(
                child: Image.asset(
                  'assets/images/right-arrow.png',
                  height: 80.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
