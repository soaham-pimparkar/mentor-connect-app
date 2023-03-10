import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:eyic/screens/marketplace/coupon_detail_screen.dart';
import 'package:eyic/api/models/coupon_model.dart';

class MarketplaceHomeScreen extends StatefulWidget {
  const MarketplaceHomeScreen({super.key});

  @override
  State<MarketplaceHomeScreen> createState() => _MarketplaceHomeScreenState();
}

class _MarketplaceHomeScreenState extends State<MarketplaceHomeScreen> {

  @override
  Widget build(BuildContext context) {
    final _categories = Coupon.coupons.map((e) => e.category).toSet().toList();
    final _tokens = 180;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Text("Marketplace",
                style: Theme.of(context).textTheme.headlineMedium),
                Row(
                  children: [
                    Icon(Icons.currency_bitcoin),
                    Text("$_tokens",
                        style: Theme.of(context).textTheme.bodyMedium),
                    Spacer(),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text("Buy Tokens"),
                    ),
                  ],
                ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: _categories.length,
              itemBuilder: (context, index) {
                final category = _categories[index];
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      category,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: Coupon.coupons
                            .where((e) => e.category == category)
                            .map(
                              (e) => Card(
                                color: Colors.primaries[index % 10][200],
                                child: InkWell(
                                  onTap: () {
                                    Get.to(CouponDetailView(coupon: e));
                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(16.0),
                                    width: 200,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          e.brand,
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleMedium,
                                        ),
                                        Text(
                                          e.description,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium,
                                        ),
                                        Row(
                                          children: [
                                            Icon(Icons.currency_bitcoin),
                                            Text(e.price.toString()),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            )
                            .toList(),
                      ),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
