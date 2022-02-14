import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeSlideshow extends StatefulWidget {
  const HomeSlideshow({Key? key}) : super(key: key);

  @override
  _HomeSlideshowState createState() => _HomeSlideshowState();
}

class _HomeSlideshowState extends State<HomeSlideshow> {

  final controller = CarouselController();
  int activeIndex = 0;
  final urlImages = [
    'https://cdn-icons-png.flaticon.com/512/2132/2132336.png',
    'https://icons.veryicon.com/png/o/education-technology/educational-icon-1/english-9.png',
    'https://pngimage.net/wp-content/uploads/2018/06/maths-logo-png-7.png',
  ];
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "Home",
          style: TextStyle(
            color: Colors.blue,
            fontSize: 25.0,
          ),
        ),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Column(
          children: [
            CarouselSlider.builder(
              carouselController: controller,
                options: CarouselOptions(
                  height: 400,
                  autoPlay: true,
                  // autoPlayAnimationDuration: const Duration(seconds: 5),
                  enlargeCenterPage: true,
                  enableInfiniteScroll: false,
                  onPageChanged: (index, reason) =>
                      setState(() => activeIndex = index),
                ),
              itemCount: urlImages.length,
              itemBuilder: (context, index, realIndex) {
                  final urlImage = urlImages[index];
                  return buildImage(urlImage, index);
              },
            ),
            
            const SizedBox(height: 20.0,),
            
            buildIndicator(),
          ],
        ),
      ),
    );
  }

  Widget buildImage(String urlImage, int index) =>
    Container(
      margin: const EdgeInsets.symmetric(horizontal: 12.0),
      color: Colors.black12,
      child: Image.network(urlImage, fit: BoxFit.cover,),
    );

  Widget buildIndicator() => AnimatedSmoothIndicator(
      activeIndex: activeIndex,
      count: urlImages.length,
    onDotClicked: animateToSlide,
  );

  // on dot click function
  animateToSlide(int index) => controller.animateToPage(index);
}
