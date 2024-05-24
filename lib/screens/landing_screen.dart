import 'package:flutter/material.dart';
import 'package:madini/screens/home/components/popular_product.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          height: 60,
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Search...',
              contentPadding: EdgeInsets.all(20),
              suffixIcon: Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide.none,
              ),
              filled: true,
              // contentPadding: EdgeInsets.zero,
            ),
          ),
        ),
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //add spacer
                    // Spacer(),
                    Column(
                      // padding: const EdgeInsets.all(8.0),
                      children: [
                        Image.asset('assets/images/sand_icon.jpg',
                            width: 30, height: 30),
                        Text(
                          'Construction',
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    // Spacer(),
                    Column(
                      children: [
                        Image.asset('assets/images/industry_icon.jpg',
                            width: 30, height: 30),
                        Text('Industry'),
                      ],
                    ),
                    // Spacer(),
                    Column(
                      children: [
                        Image.asset('assets/images/precious_icon.jpg',
                            width: 30, height: 30),
                        Text('Precious'),
                      ],
                    ),
                  ],
                ),
              ),
              //add horizontal line
              Container(
                height: 0.3,
                color: Colors.grey,
                margin: EdgeInsets.symmetric(horizontal: 10),
              ),

              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        // Icon(Icons.map, size: 50),
                        Image.asset('assets/images/delivery_icon.jpg',
                            width: 30, height: 30),
                        SizedBox(width: 8),
                        Column(
                          children: [
                            Text(
                              'Delivery',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text('Muyenga'),
                          ],
                        )
                      ],
                    ),
                    Container(
                      // padding: EdgeInsets.all(10.0),
                      margin: EdgeInsets.all(4.0),
                      width: 1,
                      height: 50,
                      color: Colors.grey,
                    ),
                    Row(
                      children: [
                        // Icon(Icons.people, size: 50),
                        Image.asset('assets/images/ASM_icon.jpg',
                            width: 30, height: 30),
                        SizedBox(width: 8),
                        // Text('1218 Artisanals'),

                        Column(
                          children: [
                            Text(
                              'ASM Impact ',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text('1,218 Artisanals'),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),

              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.all(5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  //add four menu items horizontal
                  children: [
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          'Sand',
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        )),
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          'Aggregates',
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.w300),
                        )),
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          'Earth',
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.w300),
                        )),
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          'Dimension Stones',
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.w300),
                        )),
                    //add menu item

                    //add menu item
                    //add menu item
                    //add menu item
                  ],
                ),
              ),

              // SizedBox(height: 20),

              SizedBox(height: 20),

              PopularProducts(
                page: 1,
                category_id: 1,
              ),
              SizedBox(height: 20),
              TextButton(
                  onPressed: () {},
                  child: Text(
                    'Value Added',
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: Colors.black),
                  )),
              PopularProducts(
                page: 1,
                category_id: 2,
              ),
              SizedBox(height: 20),
              TextButton(
                  onPressed: () {},
                  child: Text(
                    'Hardware',
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: Colors.black),
                  )),
              TextButton(
                  onPressed: () {},
                  child: Text(
                    'Safety',
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: Colors.black),
                  )),
              PopularProducts(
                page: 1,
                category_id: 3,
              ),
              TextButton(
                  onPressed: () {},
                  child: Text(
                    'Tools',
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: Colors.black),
                  )),
              SizedBox(height: 20),
              PopularProducts(
                page: 1,
                category_id: 4,
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
