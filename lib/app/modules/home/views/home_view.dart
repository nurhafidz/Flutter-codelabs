import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Shop',
          style: TextStyle(color: Colors.grey.shade800),
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('This is a snackbar')));
            },
            icon: const Icon(Icons.search),
            color: Colors.grey.shade800,
          )
        ],
      ),
      // body: controller.obx((data) => ListView.builder(
      //     itemCount: data!.length,
      //     itemBuilder: (context, index) => Text(data?[index]['title']))),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [
          Container(
              child: Padding(
            padding: EdgeInsets.only(bottom: 10),
            child: CarouselSlider(
              options: CarouselOptions(
                height: 200.0,
                autoPlay: true,
              ),
              items: [
                'https://fakestoreapi.com/img/81XH0e8fefL._AC_UY879_.jpg',
                'https://fakestoreapi.com/img/71HblAHs5xL._AC_UY879_-2.jpg',
                'https://fakestoreapi.com/img/71z3kpMAYsL._AC_UY879_.jpg',
                'https://fakestoreapi.com/img/51eg55uWmdL._AC_UX679_.jpg',
                'https://fakestoreapi.com/img/61pHAEJ4NML._AC_UX679_.jpg'
              ].map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                        width: MediaQuery.of(context).size.width,
                        margin:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 1,
                              blurRadius: 7,
                              offset:
                                  Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        padding: EdgeInsets.only(bottom: 10),
                        child: Image.network('$i'));
                  },
                );
              }).toList(),
            ),
          )),
          Container(
            padding: EdgeInsets.only(bottom: 20, top: 10),
            child: Text(
              "Product",
              textAlign: TextAlign.left,
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
            ),
          ),
          Container(
            child: controller.obx(
              (data) => GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 10.0,
                ),
                itemCount: 10,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      // Get.toNamed("/detail");
                      Get.toNamed('/detail',
                          arguments: data![index]['id'].toString());
                    },
                    child: Ink(
                        // margin:
                        //     EdgeInsets.only(left: 5, top: 5, right: 5, bottom: 5),
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 1,
                              blurRadius: 7,
                              offset:
                                  Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        // child: Text(
                        //   data?[index]['title'],
                        //   style: TextStyle(color: Colors.grey.shade700),
                        // ),
                        child: Column(
                          children: <Widget>[
                            Container(
                              constraints: BoxConstraints(
                                minWidth: 100,
                                maxWidth: 160,
                              ),
                              height: 100,
                              margin: EdgeInsets.only(
                                  left: 0, top: 0, right: 0, bottom: 10),
                              child: Image.network(data?[index]['image']),
                            ),
                            Container(
                              constraints:
                                  BoxConstraints(minWidth: 100, maxWidth: 160),
                              margin: EdgeInsets.only(
                                  left: 0, top: 0, right: 0, bottom: 5),
                              height: 40,
                              child: Text(
                                data?[index]['title'],
                                textAlign: TextAlign.center,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                              ),
                            ),
                            Container(
                              width: 160,
                              child: Row(
                                children: [
                                  Container(
                                    width: 80,
                                    child: Text(r'$ ' +
                                        data![index]['price'].toString()),
                                  ),
                                  Container(
                                    width: 80,
                                    child: Text(
                                        r'⭐ ' +
                                            data[index]['rating']['rate']
                                                .toString(),
                                        textAlign: TextAlign.right),
                                  )
                                ],
                              ),
                            )
                          ],
                        )
                        // child: childre,
                        // child: Text(data?[index]['title'])
                        ),
                  );
                },
              ),
            ),
          )
        ]),
      )),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Account',
          ),
        ],
        showUnselectedLabels: true,
      ),
    );
  }
}
