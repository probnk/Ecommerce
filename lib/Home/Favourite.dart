import 'package:ecommerce/Home/FavouriteNotifier.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Favourite extends StatelessWidget {
  Favourite({super.key});

  widget(){
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
              text: '\n My Shoes',
              style: GoogleFonts.abel(
                  fontSize: 30,
                  fontWeight: FontWeight.bold
              )
          ),
          TextSpan(
              text: '\n  Check and Pay your Shoes',
              style: GoogleFonts.abel(
                  color: Colors.grey,
                  fontSize: 16,
              )
          )
        ]
      ),
    );
  }

  ShoesTile(BuildContext context){
    return Container(
      height: 400,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
          itemCount: 3,
          itemBuilder: (context,index){
        return Padding(
          padding: const EdgeInsets.only(left: 4,right: 4,top: 8),
          child: Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20)
            ),
            color: Colors.white,
            child: Container(
              height: 110,
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        text: TextSpan(
                            children: [
                              TextSpan(
                                  text: 'Nike Jordan',
                                  style: GoogleFonts.abel(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold
                                  )
                              ),
                              TextSpan(
                                  text: '\n\$ 180',
                                  style: GoogleFonts.abel(
                                      fontSize: 16,
                                      color: Colors.black
                                  )
                              )
                            ]
                        ),
                      ),
                      SizedBox(height: 8,),
                      Consumer<FavouriteNotifier>(
                          builder: (context,value,child){
                        return Row(
                          children: [
                            Container(
                              width: 40,
                              height: 30,
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.grey.shade300,
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(10)
                                      )
                                  ),
                                  onPressed: () {
                                    if(value.selected >= 1){ value.decrement(); }
                                  },
                                  child: Text('-',
                                      style: GoogleFonts.abel(
                                          color: Colors.black,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold
                                      )
                                  )
                              ),
                            ),
                            SizedBox(width: 10,),
                            Container(
                              padding: EdgeInsets.symmetric(vertical: 6,horizontal: 8),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border:Border.all(color: Colors.grey)
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
                              width: 40,
                              height: 30,
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.grey.shade300,
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(10)
                                      )
                                  ),
                                  onPressed: () {
                                    value.increament();
                                  },
                                  child: Text('+',
                                      style: GoogleFonts.abel(
                                          color: Colors.black,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold
                                      )
                                  )
                              ),
                            ),
                          ],
                        );
                      })
                    ],
                  ),
                  Container(
                    width: 150,
                    height: 100,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('Images/nike.png'),
                        fit: BoxFit.fill
                      )
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      }),
    );
  }

  TotalAmount() {
    return Column(
      children: [
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20)
          ),
          color: Colors.white,
          child: Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20)
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text('Total Amount ',
                    style: GoogleFonts.abel(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                    )
                ),
                Text('\$ 180',
                    style: GoogleFonts.abel(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                    )
                )
              ],
            ),
          ),
        ),
        SizedBox(height: 20,),
        ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue.shade900,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)
                )
            ),
            onPressed: () {},
            child: Text('Check Out',
                style: GoogleFonts.abel(
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                )
            )
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black26,
      appBar: AppBar(
        backgroundColor: Colors.blue.shade900,
        centerTitle: true,
        title: Text('Favourite',
          style:GoogleFonts.abel(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 30
          ) ,
        ),
      ),
      body: ListView(
        children: [
            widget(),
            SizedBox(height: 40,),
            ShoesTile(context),
            SizedBox(height: 40,),
            TotalAmount()
        ],
      ),
    );
  }
}
