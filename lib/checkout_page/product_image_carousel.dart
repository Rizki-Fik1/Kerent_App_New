// custom_image_carousel.dart
import 'package:flutter/material.dart';

class CustomImageCarousel extends StatefulWidget {
  final List<String> imgList;

  const CustomImageCarousel({super.key, required this.imgList});

  @override
  _CustomImageCarouselState createState() => _CustomImageCarouselState();
}

class _CustomImageCarouselState extends State<CustomImageCarousel> {
  int _current = 0;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: 200, // Adjust this value as needed
          child: PageView.builder(
            controller: _pageController,
            itemCount: widget.imgList.length,
            onPageChanged: (index) {
              setState(() {
                _current = index;
              });
            },
            itemBuilder: (context, index) {
              return Image.network(
                widget.imgList[index],
                fit: BoxFit.cover,
              );
            },
          ),
        ),
        Positioned(
          top: 10,
          right: 12,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: const Color(0xff686D76),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              "${_current + 1}/${widget.imgList.length}",
              style: const TextStyle(color: Colors.white, fontSize: 14),
            ),
          ),
        ),
      ],
    );
  }
}