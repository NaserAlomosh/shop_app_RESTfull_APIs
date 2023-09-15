import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../classes/color_manager.dart';
import '../../classes/widget_size.dart';

class ProductLoading extends StatefulWidget {
  const ProductLoading({super.key});

  @override
  State<ProductLoading> createState() => _ProductLoadingState();
}

class _ProductLoadingState extends State<ProductLoading>
    with SingleTickerProviderStateMixin {
  @override
  void dispose() {
    animationController?.dispose();
    super.dispose();
  }

  AnimationController? animationController;
  Animation? myAnimation;
  @override
  void initState() {
    //
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 400));
    myAnimation =
        Tween<double>(begin: 0.1, end: 1).animate(animationController!)
          ..addListener(() {
            setState(() {
              if (animationController!.isCompleted) {
                animationController?.repeat(reverse: true);
              }
            });
          });
    animationController?.forward();
    //
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              CarouselSlider(
                items: [
                  Opacity(
                    opacity: myAnimation?.value,
                    child: Padding(
                      padding: EdgeInsets.all(
                          AppWidgetSize.defaultHeight(context, 70)),
                      child: Container(
                        width: double.infinity,
                        height: double.infinity,
                        decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(30)),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Padding(
                            padding: EdgeInsets.all(
                                AppWidgetSize.defaultHeight(context, 70)),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: ColorManger.white,
                                  borderRadius: BorderRadius.circular(20)),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
                options: CarouselOptions(
                  height: AppWidgetSize.defaultHeight(context, 4),
                  initialPage: 0,
                  viewportFraction: 1,
                  enableInfiniteScroll: true,
                  reverse: false,
                  autoPlay: true,
                  pageSnapping: true,
                  pauseAutoPlayInFiniteScroll: true,
                  pauseAutoPlayOnTouch: true,
                  autoPlayInterval: const Duration(seconds: 3),
                  autoPlayAnimationDuration: const Duration(seconds: 3),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  scrollDirection: Axis.horizontal,
                ),
              ),
              GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisSpacing: 1,
                mainAxisSpacing: 1,
                crossAxisCount: 2,
                children: List.generate(
                  6,
                  (index) => Opacity(
                    opacity: myAnimation?.value,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        color: Colors.grey[200],
                        child: Padding(
                          padding: EdgeInsets.all(
                            AppWidgetSize.defaultHeight(context, 70),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                flex: 3,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Container(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 10),
                              Expanded(
                                flex: 1,
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(20)),
                                ),
                              ),
                              const SizedBox(height: 10),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 20,
                                    width: 50,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                  ),
                                  const SizedBox(width: 10),
                                  Container(
                                    height: 20,
                                    width: 50,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
