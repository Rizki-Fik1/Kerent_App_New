import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeP extends StatelessWidget {
  const HomeP ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    double screenWidth = mediaQueryData.size.width;
    double screenHeight = mediaQueryData.size.height;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: 
Container(
    width: screenWidth,
    height: screenHeight,
    clipBehavior: Clip.antiAlias,
    decoration: BoxDecoration(color: Color(0xFF101014)),
    child: Stack(
        children: [
            Positioned(
                left: 16,
                top: 89,
                child: SizedBox(
                    child: Transform.rotate(
                    angle: 0.05, 
                    child: Text(
                        'Hai, Qiqi!',
                        style: TextStyle(
                            color: Color(0xFFF8F8F8),
                            fontSize: 20,
                            fontFamily: 'Plus Jakarta Sans',
                            fontWeight: FontWeight.w800,
                            height: 0,
                        ),
                    ),
                    )
                ),
            ),
            Positioned(
                left: 16,
                top: 117,
                child: SizedBox(
                    child: Opacity(
                        opacity: 0.50,
                        child: Text(
                            'Siap untuk merental?',
                            style: TextStyle(
                                color: Color(0xFFF8F8F8),
                                fontSize: 13,
                                fontFamily: 'Plus Jakarta Sans',
                                fontWeight: FontWeight.w600,
                                height: 0,
                            ),
                        ),
                    ),
                ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 150,left: 4),
            child: Container(
              height: 53,
              width: 361,
              decoration: ShapeDecoration(
                color: Color(0xFF191919),
                shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(28),
              ),
              ),
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search,size: 40,)
                ),
              ),
            )
            )
        ],
    ),
)
    )
  );
}
}