import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce/Home/Cart.dart';
import 'package:ecommerce/Home/Categories.dart';
import 'package:ecommerce/Home/Favourite.dart';
import 'package:ecommerce/Home/Home_Notifier.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List color1 = [Colors.orange.shade600,Colors.blue.shade600];
  List color2 = [Colors.orange.shade900,Colors.blue.shade900];
  final _Controller = PageController();

  appbar(){
    return Container(
      padding: EdgeInsets.only(left: 30,right: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(Icons.location_on_outlined,color: Colors.blue,size: 34,),
                  SizedBox(width: 4,),
                  Container(
                    padding: EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      color: Colors.white,
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(color: Colors.grey.shade200)
                    ),
                    child: Row(
                      children: [
                        Text('Richmond',
                          style: GoogleFonts.raleway(
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                              fontSize: 16
                          ),
                        ),
                        Icon(Icons.keyboard_arrow_down,color: Colors.black,size: 20,),
                      ],
                    ),
                  ),
                ],
              ),
              Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Colors.white
                  ),
                child:  IconButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Favourite()));
                  },
                  icon: Icon(Icons.notifications_none,color: Colors.black,size: 34,),
                )
              ),
            ],
          ),
          SizedBox(height: 20,),
         Row(
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
           children: [
             Expanded(child:
               TextFormField(
                 decoration: InputDecoration(
                     filled: true,
                     fillColor: Colors.white,
                     hintText: 'Search Here...',
                     hintStyle: TextStyle(
                       color: Colors.grey.shade400,
                     ),
                     enabledBorder: OutlineInputBorder(
                         borderRadius: BorderRadius.circular(10),
                     ),
                     focusedBorder: OutlineInputBorder(
                         borderRadius: BorderRadius.circular(10),
                         borderSide: BorderSide(color: Colors.blue,width: 2)
                     )
                 ),
               ),
             ),
             SizedBox(width: 10,),
             InkWell(
               onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Cart()));
               },
               child: Container(
                 padding: EdgeInsets.all(8),
                 decoration: BoxDecoration(
                   gradient: LinearGradient(
                     end: Alignment.topRight,
                     begin: Alignment.topLeft,
                     colors: [Colors.blue.shade400,Colors.blue]
                   ),
                     borderRadius: BorderRadius.circular(10),
                 ),
                 child:  Icon(Icons.settings,color: Colors.white,size: 44,),
               ),
             )
           ],
         )
        ],
      ),
    );
  }

  adds() {
    List<Widget> adWidgets = [];

    for (int index = 0; index < 2; index++) {
      adWidgets.add(
        Card(
          margin: EdgeInsets.all(20),
          shadowColor: color1[index],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          elevation: 8,
          child: Container(
            padding: EdgeInsets.all(15),
            width: 320,
            height: 170,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.centerRight,
                colors: [color1[index], color2[index]],
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Stack(
              children: [
                Positioned(
                  left: 170,
                  top: 0,
                  bottom: 2,
                  child: Container(
                    width: 150,
                    height: 170,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('Images/men.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '30% OFF',
                      style: GoogleFonts.ubuntu(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
                    SizedBox(height: 10,),
                    Text(
                      'NEW COLLECTION',
                      style: GoogleFonts.raleway(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
                    SizedBox(height: 30,),
                    SizedBox(
                      height: 30,
                      width: 120,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            'Get Now',
                            style: GoogleFonts.raleway(
                              color: color1[index],
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    }
    return adWidgets;
  }

  carosile(){
    return Consumer<Home_Notifier>(
        builder: (context,value,child){
      return Column(
        children: [
          CarouselSlider(
            items: adds(),
            options: CarouselOptions(
              height: 220,
              enlargeCenterPage: true,
              autoPlay: true,
              autoPlayCurve: Curves.fastOutSlowIn,
              enableInfiniteScroll: true,
              autoPlayAnimationDuration: Duration(milliseconds:800),
              viewportFraction: 1,
              onPageChanged: (index, reason) {
                value.setValue1(index);
              },
            ),
          ),
          SizedBox(height: 5,),
          Center(
              child:
              AnimatedSmoothIndicator(
                activeIndex: value.value1,
                count: 2,
                effect: ExpandingDotsEffect(
                    activeDotColor: Colors.blue.shade900,
                    dotHeight: 12,
                    dotWidth: 12
                ),
              )
          ),
        ],
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body:SafeArea(
        child: Column(
          children: [
            appbar(),
            SizedBox(height: 20,),
            carosile(),
            SizedBox(height: 10,),
            Categories()
          ],
        ),
      )
    );
  }
}