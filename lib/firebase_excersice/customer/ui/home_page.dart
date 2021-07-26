import 'package:badges/badges.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wac2_firebase/firebase_excersice/admin/admin_main_page.dart';
import 'package:wac2_firebase/firebase_excersice/customer/customer_provider.dart';
import 'package:wac2_firebase/firebase_excersice/customer/ui/cart_page.dart';
import 'package:wac2_firebase/firebase_excersice/models/category_model.dart';
import 'package:wac2_firebase/firebase_excersice/models/product_model.dart';
import 'package:wac2_firebase/firebase_excersice/models/slider_models.dart';
import 'package:wac2_firebase/firebase_excersice/providers/auth_provider.dart';
import 'package:wac2_firebase/firebase_excersice/utilities/routers.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
        actions: [
          Visibility(
              visible: Provider.of<AuthProvider>(context, listen: false)
                  .userModel
                  .isAdmin,
              child: IconButton(
                  onPressed: () {
                    AppRouter.router.pushToNewWidget(AdminMainPage());
                  },
                  icon: Icon(Icons.settings))),
          GestureDetector(
            onTap: () {
              AppRouter.router.pushToNewWidget(CartPage());
            },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 15),
              child: Badge(
                stackFit: StackFit.passthrough,

                position: BadgePosition.bottomEnd(),
                badgeContent: Text(Provider.of<CustomerProvider>(context)
                    .cartProducts
                    .length
                    .toString()),

                child: Icon(Icons.shopping_cart),
                // child: IconButton(
                //     onPressed: () {
                //       AppRouter.router.pushToNewWidget(CartPage());
                //     },
                //     icon: Icon(Icons.shopping_cart)),
              ),
            ),
          )
        ],
      ),
      body: Consumer<CustomerProvider>(
        builder: (context, provider, widget) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                height: MediaQuery.of(context).size.height / 4,
                child: SliderWidget(provider.sliders),
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Text('Categories',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                    )),
              ),
              Container(
                  margin: EdgeInsets.only(bottom: 10),
                  height: 90,
                  child: CategoriesList(provider.categories)),
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Text('Products',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                    )),
              ),
              Expanded(
                child: provider.products == null
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : Container(
                        margin: EdgeInsets.all(10),
                        child: ProductsWidget(provider.products)),
              )
            ],
          );
        },
      ),
    );
  }
}

class SliderWidget extends StatelessWidget {
  List<SliderModel> sliders;
  SliderWidget(this.sliders);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return CarouselSlider(
      options: CarouselOptions(autoPlay: true, height: 400.0),
      items: sliders.map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.symmetric(horizontal: 2),
                decoration: BoxDecoration(color: Colors.amber),
                child: Image.network(
                  i.imagePath,
                  fit: BoxFit.cover,
                ));
          },
        );
      }).toList(),
    );
  }
}

class CategoriesList extends StatelessWidget {
  List<CategoryModel> categories;
  CategoriesList(this.categories);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Provider.of<CustomerProvider>(context, listen: false)
                  .getCategoryProducts(categories[index].id);
            },
            child: Stack(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 5),
                  height: 90,
                  width: 160,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                          colorFilter: ColorFilter.mode(
                              Colors.black.withOpacity(0.3), BlendMode.darken),
                          fit: BoxFit.cover,
                          image: NetworkImage(categories[index].imageurl))),
                ),
                Positioned.fill(
                    child: Align(
                  alignment: Alignment.center,
                  child: Text(categories[index].name,
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                      )),
                ))
              ],
            ),
          );
        });
  }
}

class ProductsWidget extends StatelessWidget {
  List<ProductModel> products;
  ProductsWidget(this.products);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisSpacing: 10, crossAxisSpacing: 10, crossAxisCount: 2),
      itemCount: products.length,
      itemBuilder: (context, index) {
        return Container(
          color: Colors.grey.withOpacity(0.2),
          height: 150,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                height: 120,
                margin: EdgeInsets.all(5),
                child: Image.network(
                  products[index].imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
              Row(
                children: [
                  Column(
                    children: [
                      Text(products[index].productName),
                      Text(products[index].price.toString()),
                    ],
                  ),
                  Spacer(),
                  IconButton(
                      onPressed: () {
                        Provider.of<CustomerProvider>(context, listen: false)
                            .addToCart(products[index]);
                      },
                      icon: Icon(Icons.add))
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
