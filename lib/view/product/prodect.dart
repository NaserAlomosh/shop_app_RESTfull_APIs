import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phone_taolet_desktop/model/home/home_model.dart';
import 'package:phone_taolet_desktop/view/product/product_loading.dart';
import 'package:phone_taolet_desktop/view_model/home/home_cubit.dart';

import '../../classes/color_manager.dart';
import '../../classes/widget_size.dart';
import '../../view_model/home/home_state.dart';

class ProdectView extends StatefulWidget {
  const ProdectView({super.key});

  @override
  State<ProdectView> createState() => _ProdectViewState();
}

class _ProdectViewState extends State<ProdectView> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        HomeModel? homeModel = context.read<HomeCubit>().homeModel;
        if (homeModel == null) {
          return const ProductLoading();
        } else {
          return Scaffold(
            floatingActionButton: FloatingActionButton(
              onPressed: () {},
              backgroundColor: ColorManger.primary.withOpacity(0.8),
              child: Icon(
                Icons.search,
                color: ColorManger.white,
              ),
            ),
            backgroundColor: ColorManger.black.withOpacity(0.1),
            body: builderWidget(homeModel, context),
          );
        }
      },
    );
  }

  Widget builderWidget(HomeModel homeModel, BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          CarouselSlider(
            items: homeModel.data!.banners
                .map((e) => Image.network(
                      e.image,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ))
                .toList(),
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
              homeModel.data!.products.length,
              (index) => Container(
                color: ColorManger.white,
                child: Column(
                  children: [
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        color: ColorManger.white,
                        child: Image.network(
                          homeModel.data!.products[index].image,
                          //fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            homeModel.data!.products[index].description,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ),
                          Row(
                            children: [
                              Text('\$${homeModel.data!.products[index].price}',
                                  style: TextStyle(color: ColorManger.primary)),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                '\$${homeModel.data!.products[index].price}',
                                style: const TextStyle(
                                    decoration: TextDecoration.lineThrough),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
//
