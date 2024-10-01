import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeP extends StatefulWidget {
  const HomeP ({Key? key}) : super(key: key);

    @override
  State<HomeP> createState() => _HomePState();
}

class _HomePState extends State<HomeP> {
  TextEditingController _searchController = TextEditingController();

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
                left: 328,
                top: 258,
                child: Container(
                    width: 298,
                    height: 157,
                    decoration: ShapeDecoration(
                        color: Color(0xFFFBC87B),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                        ),
                    ),
                ),
            ),
            Positioned(
                left: 16,
                top: 89,
                child: SizedBox(
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

            //search seciton
            Positioned(
                left: 16,
                top: 170,
                child: Container(
                    width: 361,
                    height: 53,
                    child: Stack(
                        children: [
                            Positioned(
                                left: 0,
                                top: 0,
                                child: Container(
                                    width: 361,
                                    height: 53,
                                    decoration: ShapeDecoration(
                                        color: Color(0xFF191919),
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(28),
                                        ),
                                    ),
                                ),
                            ),
                            Positioned(
                                left: 67,
                                top: 13,
                                child: SizedBox(
                                    child: TextField(
                                      controller: _searchController,
                                        style: TextStyle(
                                            color: Color(0xFFF8F8F8),
                                            fontSize: 13,
                                            fontFamily: 'Plus Jakarta Sans',
                                            fontWeight: FontWeight.w600,
                                            height: 0,
                                        ),
                                        decoration: InputDecoration(
                                          hintText: 'Search on Ke’rent',
                                          hintStyle: TextStyle(
                                            color: Color(0xFFF8F8F8),
                                            fontSize: 13,
                                            fontFamily: 'Plus Jakarta Sans',
                                            fontWeight: FontWeight.w600,
                                            height: 0,
                                          ),
                                          border: InputBorder.none
                                        ),
                                    ),
                                ),
                            ),
                            Positioned(
                                left: 67,
                                top: 30,
                                child: SizedBox(
                                    width: 119,
                                    height: 11,
                                    child: Opacity(
                                        opacity: 0.50,
                                        child: Text(
                                            'Mouse - Keyboard -Other',
                                            style: TextStyle(
                                                color: Color(0xFFF8F8F8),
                                                fontSize: 9,
                                                fontFamily: 'Plus Jakarta Sans',
                                                fontWeight: FontWeight.w600,
                                                height: 0,
                                            ),
                                        ),
                                    ),
                                ),
                            ),
                            Positioned(
                                left: 17,
                                top: 18,
                                child: Container(
                                    width: 21,
                                    height: 20,
                                    clipBehavior: Clip.antiAlias,
                                    decoration: BoxDecoration(),
                                    child: Image(
                                      image: AssetImage('lib/assets/search-icon.png')),
                                ),
                            ),
                        ],
                    ),
                ),
            ),
            Positioned(
                left: 20,
                top: 476,
                child: SizedBox(
                    child: Text(
                        'latest item',
                        style: TextStyle(
                            color: Color(0xFFF8F8F8),
                            fontSize: 20,
                            fontFamily: 'Plus Jakarta Sans',
                            fontWeight: FontWeight.w700,
                            height: 0,
                        ),
                    ),
                ),
            ),
            Positioned(
                left: 327,
                top: 480,
                child: SizedBox(
                    child: Text(
                        'Show all',
                        style: TextStyle(
                            color: Color(0xFF31363F),
                            fontSize: 11,
                            fontFamily: 'Plus Jakarta Sans',
                            fontWeight: FontWeight.w700,
                            height: 0,
                        ),
                    ),
                ),
            ),
            Positioned(
                left: 16,
                top: 259,
                child: Container(
                    width: 298,
                    height: 157,
                    decoration: ShapeDecoration(
                        color: Color(0xFFD4C4FC),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                        ),
                    ),
                ),
            ),
            Positioned(
                left: 16,
                top: 533,
                child: Container(
                    width: 153,
                    height: 153,
                    decoration: ShapeDecoration(
                        color: Color(0xFF31363F),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                        ),
                    ),
                ),
            ),
            Positioned(
                left: 181,
                top: 534,
                child: Container(
                    width: 153,
                    height: 153,
                    decoration: ShapeDecoration(
                        color: Color(0xFF31363F),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                        ),
                    ),
                ),
            ),
            Positioned(
                left: 346,
                top: 533,
                child: Container(
                    width: 153,
                    height: 153,
                    decoration: ShapeDecoration(
                        color: Color(0xFF31363F),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                        ),
                    ),
                ),
            ),
            Positioned(
                left: 42,
                top: 559,
                child: Container(
                    width: 102.11,
                    height: 102.11,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage("https://via.placeholder.com/102x102"),
                            fit: BoxFit.fill,
                        ),
                    ),
                ),
            ),
            Positioned(
                left: 212,
                top: 564,
                child: Container(
                    width: 92,
                    height: 93,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage("https://via.placeholder.com/92x93"),
                            fit: BoxFit.fill,
                        ),
                    ),
                ),
            ),
            Positioned(
                left: 123,
                top: 539,
                child: Container(
                    width: 40,
                    height: 20,
                    decoration: ShapeDecoration(
                        color: Color(0xFFFFEEAD),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                        ),
                    ),
                ),
            ),
            Positioned(
                left: 288,
                top: 540,
                child: Container(
                    width: 40,
                    height: 20,
                    decoration: ShapeDecoration(
                        color: Color(0xFFFFEEAD),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                        ),
                    ),
                ),
            ),
            Positioned(
                left: 288,
                top: 540,
                child: Container(
                    width: 40,
                    height: 20,
                    decoration: ShapeDecoration(
                        color: Color(0xFFFFEEAD),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                        ),
                    ),
                ),
            ),
            Positioned(
                left: 37,
                top: 281,
                child: SizedBox(
                    width: 160,
                    height: 56,
                    child: Text(
                        'Try renting something new',
                        style: TextStyle(
                            color: Color(0xFF101014),
                            fontSize: 20,
                            fontFamily: 'Plus Jakarta Sans',
                            fontWeight: FontWeight.w700,
                            height: 0,
                        ),
                    ),
                ),
            ),
            Positioned(
                left: 355,
                top: 281,
                child: SizedBox(
                    width: 160,
                    height: 56,
                    child: Text(
                        'Try renting something new',
                        style: TextStyle(
                            color: Color(0xFF101014),
                            fontSize: 20,
                            fontFamily: 'Plus Jakarta Sans',
                            fontWeight: FontWeight.w700,
                            height: 0,
                        ),
                    ),
                ),
            ),
            Positioned(
                left: 37,
                top: 352,
                child: SizedBox(
                    child: Text(
                        'Rent or lease your items',
                        style: TextStyle(
                            color: Color(0xFF101014),
                            fontSize: 10,
                            fontFamily: 'Plus Jakarta Sans',
                            fontWeight: FontWeight.w600,
                            height: 0,
                        ),
                    ),
                ),
            ),
            Positioned(
                left: 355,
                top: 352,
                child: SizedBox(
                    child: Text(
                        'Rent or lease your items',
                        style: TextStyle(
                            color: Color(0xFF101014),
                            fontSize: 10,
                            fontFamily: 'Plus Jakarta Sans',
                            fontWeight: FontWeight.w600,
                            height: 0,
                        ),
                    ),
                ),
            ),
            Positioned(
                left: 143,
                top: 545,
                child: SizedBox(
                    child: Text(
                        '4.0',
                        style: TextStyle(
                            color: Color(0xFF101014),
                            fontSize: 8,
                            fontFamily: 'Plus Jakarta Sans',
                            fontWeight: FontWeight.w600,
                            height: 0,
                        ),
                    ),
                ),
            ),
            Positioned(
                left: 308,
                top: 546,
                child: SizedBox(
                    child: Text(
                        '3,7',
                        style: TextStyle(
                            color: Color(0xFF101014),
                            fontSize: 8,
                            fontFamily: 'Plus Jakarta Sans',
                            fontWeight: FontWeight.w600,
                            height: 0,
                        ),
                    ),
                ),
            ),
            Positioned(
                left: 37,
                top: 375,
                child: Container(
                    width: 77,
                    height: 30,
                    decoration: ShapeDecoration(
                        color: Color(0xFF101014),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                        ),
                    ),
                ),
            ),
            Positioned(
                left: 52,
                top: 381,
                child: SizedBox(
                    width: 47,
                    height: 18,
                    child: Text(
                        'Rent Now',
                        style: TextStyle(
                            color: Color(0xFFF8F8F8),
                            fontSize: 10,
                            fontFamily: 'Plus Jakarta Sans',
                            fontWeight: FontWeight.w600,
                            height: 0,
                        ),
                    ),
                ),
            ),
            Positioned(
                left: 177,
                top: 268,
                child: Container(
                    width: 128,
                    height: 139,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('lib/assets/Laptop Silver.png'),
                            fit: BoxFit.fill,
                        ),
                    ),
                ),
            ),
            Positioned(
                left: 332,
                top: 305,
                child: Container(width: 128, height: 139),
            ),
            Positioned(
                left: 128,
                top: 542,
                child: Container(
                    width: 13,
                    height: 13,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(),
                    child: Image(
                      image: AssetImage('lib/assets/icon_star.png')),
                ),
            ),
            Positioned(
                left: 293,
                top: 543,
                child: Container(
                    width: 13,
                    height: 13,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(),
                    child: Image(
                      image: AssetImage('lib/assets/icon_star.png')),
                ),
            ),
            Positioned(
                left: 293,
                top: 543,
                child: Container(
                    width: 13,
                    height: 13,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(),
                    child: Image(
                      image: AssetImage('lib/assets/icon_star.png')),
                ),
            ),
            Positioned(
                left: 28,
                top: 698,
                child: SizedBox(
                    width: 130,
                    child: Text(
                        'Laptop 2 IN 1 NEC VersaPro',
                        style: TextStyle(
                            color: Color(0xFFF8F8F8),
                            fontSize: 10,
                            fontFamily: 'Plus Jakarta Sans',
                            fontWeight: FontWeight.w600,
                            height: 0,
                        ),
                    ),
                ),
            ),
            Positioned(
                left: 186,
                top: 699,
                child: SizedBox(
                    width: 152,
                    child: Text(
                        'Mouse Wireless Laptop 2.4Ghz',
                        style: TextStyle(
                            color: Color(0xFFF8F8F8),
                            fontSize: 10,
                            fontFamily: 'Plus Jakarta Sans',
                            fontWeight: FontWeight.w600,
                            height: 0,
                        ),
                    ),
                ),
            ),
            Positioned(
                left: 28,
                top: 720,
                child: SizedBox(
                    width: 85,
                    child: Text(
                        'RP. 150.000/Hari',
                        style: TextStyle(
                            color: Color(0xFFF8F8F8),
                            fontSize: 10,
                            fontFamily: 'Plus Jakarta Sans',
                            fontWeight: FontWeight.w700,
                            height: 0,
                        ),
                    ),
                ),
            ),
            Positioned(
                left: 186,
                top: 721,
                child: SizedBox(
                    width: 85,
                    child: Text(
                        'RP. 5.000/Hari',
                        style: TextStyle(
                            color: Color(0xFFF8F8F8),
                            fontSize: 10,
                            fontFamily: 'Plus Jakarta Sans',
                            fontWeight: FontWeight.w700,
                            height: 0,
                        ),
                    ),
                ),
            ),
            Positioned(
                left: 186,
                top: 721,
                child: SizedBox(
                    width: 85,
                    child: Text(
                        'RP. 5.000/Hari',
                        style: TextStyle(
                            color: Color(0xFFF8F8F8),
                            fontSize: 10,
                            fontFamily: 'Plus Jakarta Sans',
                            fontWeight: FontWeight.w700,
                            height: 0,
                        ),
                    ),
                ),
            ),
            Positioned(
                left: 0,
                top: 778,
                child: Container(
                    width: 393,
                    height: 74,
                    decoration: BoxDecoration(color: Color(0xFF191919)),
                ),
            ),
            Positioned(
                left: 78,
                top: 821.75,
                child: SizedBox(
                    width: 19.60,
                    height: 5,
                    child: Text(
                        'Home',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 6,
                            fontFamily: 'Plus Jakarta Sans',
                            fontWeight: FontWeight.w600,
                            height: 0,
                        ),
                    ),
                ),
            ),
            Positioned(
                left: 305.61,
                top: 822,
                child: SizedBox(
                    width: 15,
                    height: 5,
                    child: Text(
                        'Chat',
                        style: TextStyle(
                            color: Color(0xFF686D76),
                            fontSize: 6,
                            fontFamily: 'Plus Jakarta Sans',
                            fontWeight: FontWeight.w600,
                            height: 0,
                        ),
                    ),
                ),
            ),
            Positioned(
                left: 168.52,
                top: 765,
                child: Container(
                    width: 60.96,
                    height: 56,
                    decoration: ShapeDecoration(
                        gradient: LinearGradient(
                            begin: Alignment(0.00, -1.00),
                            end: Alignment(0, 1),
                            colors: [Color(0xFFFF8225), Color(0xFFB43F3F)],
                        ),
                        shape: OvalBorder(),
                        shadows: [
                            BoxShadow(
                                color: Color(0xFFFFFFFF),
                                blurRadius: 0,
                                offset: Offset(0, 0),
                                spreadRadius: 4,
                            ),BoxShadow(
                                color: Color(0x4CB43F3F),
                                blurRadius: 0,
                                offset: Offset(0, 0),
                                spreadRadius: 5,
                            )
                        ],
                    ),
                ),
            ),
            Positioned(
                left: 0,
                top: 818,
                child: Container(
                    width: 393,
                    height: 34,
                    padding: const EdgeInsets.only(top: 13),
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(color: Colors.white.withOpacity(0)),
                    child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                            Container(
                                width: 134,
                                height: 5,
                                decoration: ShapeDecoration(
                                    color: Color(0xFFF8F8F8),
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
                                ),
                            ),
                        ],
                    ),
                ),
            ),
        ],
    ),
)
    )
  );
}
}