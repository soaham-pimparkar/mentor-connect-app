import 'package:eyic/api/models/coupon_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CouponDetailView extends StatefulWidget {
  CouponDetailView({super.key, required this.coupon});

  Coupon coupon;

  @override
  State<CouponDetailView> createState() => _CouponDetailViewState();
}

class _CouponDetailViewState extends State<CouponDetailView> {
  @override
  Widget build(BuildContext context) {
    Widget backgroundImage = Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(
              "https://cdn.vox-cdn.com/thumbor/PtbtNAmH7zBYiw0DTmwE_q81elU=/1400x1050/filters:format(jpeg)/cdn.vox-cdn.com/uploads/chorus_asset/file/13730190/netflix.jpg"),
          fit: BoxFit.cover,
        ),
      ),
    );

    return Scaffold(
        appBar: AppBar(
          title: Text(widget.coupon.brand),
        ),
        body: Stack(
          children: [
            backgroundImage,
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.white.withOpacity(0.5),
                    Colors.white.withOpacity(1.0),
                  ],
                ),
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    widget.coupon.brand,
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    widget.coupon.category,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    widget.coupon.description,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Colors.black,
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.currency_bitcoin),
                      Text(
                        widget.coupon.price.toString(),
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  TextButton(
                    onPressed: () {
                      Get.back();
                    },
                    child: Container(
                      margin: EdgeInsets.all(16.0),
                      padding: EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        color: Colors.primaries[0][200],
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Text(
                        "Redeem",
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
