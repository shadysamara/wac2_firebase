import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wac2_firebase/firebase_excersice/customer/customer_provider.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart Page'),
      ),
      body: Consumer<CustomerProvider>(
        builder: (context, provider, widget) {
          return provider.cartProducts == null
              ? Center(
                  child: Text('No Products In The cart'),
                )
              : ListView.builder(
                  itemCount: provider.cartProducts.length,
                  itemBuilder: (context, index) {
                    return Container(
                      child: Row(
                        children: [
                          Container(
                              height: 100,
                              width: 100,
                              child: Image.network(
                                  provider.cartProducts[index].imageUrl)),
                          Expanded(
                            child: Column(
                              children: [
                                Text(provider.cartProducts[index].productName),
                                Text(provider.cartProducts[index].price
                                    .toString()),
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  });
        },
      ),
    );
  }
}
