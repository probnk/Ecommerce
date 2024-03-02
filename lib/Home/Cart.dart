import 'package:ecommerce/Home/FavouriteNotifier.dart';
import 'package:ecommerce/Home/Home_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Cart extends StatelessWidget {
  Cart({super.key});

  List images = ["Images/chair1.jfif","chair2.jfif","chair3.jfif","chair4.jfif","pic5.png","pic6.png"];
  List title = [" B2 Lounge\n  chair"," D4 Lounge\n  arm wood",
                " Ox eyes\n  chair"," Dc duplex\n  high",
                " Aavansah\n  easy chair"," Duplo high\n  chair"];
  List price = [165.00,120.00,200.00,150.00,290.00,149.99];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 12,right: 12,top: 8),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              IconButton(
                                  onPressed: () {
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Home()));
                                  },
                                  icon: Icon(Icons.arrow_back_ios)
                              ),
                              Text('Cart',
                                  style: GoogleFonts.abel(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold
                                  )
                              )
                            ],
                          ),
                          Icon(Icons.shopping_bag_outlined,size: 28,)
                        ],
                      ),
                      ListView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: title.length,
                          itemBuilder: (context,index){
                        return SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)
                            ),
                            child: Container(
                              padding: EdgeInsets.all(8),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                 Consumer<FavouriteNotifier>(
                                     builder: (context,value,child){
                                      return  Radio(
                                          value:1 ,
                                          groupValue: value.isSelected,
                                          onChanged: (isTrue){
                                            value.changeState();
                                      });
                                 }),
                                  SizedBox(width: 4,),
                                  Container(
                                      padding: const EdgeInsets.all(11),
                                      decoration: BoxDecoration(
                                        color:Colors.grey.shade200,
                                        borderRadius:BorderRadius.circular(20)
                                      ),
                                      child: Image.asset("${images[index]}",scale: 3.8,)
                                  ),
                                  SizedBox(width: 4,),
                                  Column(
                                    children: [
                                      Text(" ${title[index]}",
                                          style: GoogleFonts.abel(
                                              color: Colors.black,
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold
                                          )
                                      ),
                                      Text("\$${price[index]}",
                                          style: GoogleFonts.abel(
                                              color: Colors.grey,
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold
                                          )
                                      )
                                    ],
                                  ),
                                  SizedBox(width: 4,),
                                  Consumer<FavouriteNotifier>(
                                      builder: (context,value,child){
                                        return Row(
                                          children: [
                                            Container(
                                              width: 25,
                                              height: 25,
                                              child: ElevatedButton(
                                                  style: ElevatedButton.styleFrom(
                                                      backgroundColor: Colors.grey.shade300,
                                                      shape: RoundedRectangleBorder(
                                                          borderRadius: BorderRadius.circular(10)
                                                      ),
                                                    padding: EdgeInsets.zero,
                                                  ),
                                                  onPressed: () {
                                                    if(value.selected >= 1){ value.decrement(); }
                                                  },
                                                  child: Text('-',
                                                      style: GoogleFonts.abel(
                                                          color: Colors.black,
                                                          fontSize: 16,
                                                          fontWeight: FontWeight.bold
                                                      )
                                                  )
                                              ),
                                            ),
                                            SizedBox(width: 10,),
                                            Container(
                                              padding: EdgeInsets.symmetric(vertical: 6,horizontal: 8),
                                              decoration: BoxDecoration(
                                                  color:Colors.grey,
                                                  borderRadius: BorderRadius.circular(10),
                                              ),
                                              child: Text('${value.selected}',
                                                  style: GoogleFonts.abel(
                                                      color: Colors.black,
                                                      fontSize: 20,
                                                      fontWeight: FontWeight.bold
                                                  )
                                              ),
                                            ),
                                            SizedBox(width: 10,),
                                            Container(
                                              width: 25,
                                              height: 25,
                                              child: ElevatedButton(
                                                  style: ElevatedButton.styleFrom(
                                                    backgroundColor: Colors.grey.shade300,
                                                    shape: RoundedRectangleBorder(
                                                        borderRadius: BorderRadius.circular(10)
                                                    ),
                                                    padding: EdgeInsets.zero,
                                                  ),
                                                  onPressed: () {
                                                   value.increament();
                                                  },
                                                  child: Text('+',
                                                      style: GoogleFonts.abel(
                                                          color: Colors.black,
                                                          fontSize: 16,
                                                          fontWeight: FontWeight.bold
                                                      )
                                                  )
                                              ),
                                            ),
                                          ],
                                        );
                                      }),
                                  SizedBox(width: 4,),
                                ],
                              ),
                            ),
                          ),
                        );
                      })
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(200),
                  width: 350,
                  height: 180,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                    )
                  ),
                  child: Text('Hello',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.abel(
                           color: Colors.black,
                           fontWeight: FontWeight.bold,
                           fontSize: 30
                      ),
                  ),
                )
              ],
            )
          ]
        ),
      ),
    );
  }
}