import 'package:ecommerce/Home/Home_Notifier.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Categories extends StatefulWidget {
  const Categories({super.key});

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {

  List icons = [Icons.hotel,Icons.house,Icons.flight_sharp,Icons.computer];
  List text = ['Hotels','Real Estate','Flights','Electronics'];
  List images = ['Images/headset1.png','Images/mouse6.png'];

  CategoiresText(String name) {
    return Padding(
      padding: const EdgeInsets.only(left: 10,right: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('$name',
            style: GoogleFonts.ubuntu(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 28
            ),
          ),
          Text('See All',
            style: GoogleFonts.ubuntu(
                color: Colors.blue,
                fontSize: 18
            ),
          ),
        ],
      ),
    );
  }

  CatagoriesBuilder(){
    return  Container(
      height: 200,
      child: GridView.builder(
          itemCount: 4,
          gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 2,
            mainAxisSpacing: 2,
            childAspectRatio: 2.0,
          ) ,
          itemBuilder: (context,index){
            return Consumer<Home_Notifier>(builder: (context,value,child){
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {
                    value.setStates(index);
                  },
                  child: Card(
                    elevation: 8,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)
                    ),
                    shadowColor: value.value == index ? Colors.blue : Colors.black,
                    child: Container(
                      width: 160,
                      height: 70,
                      decoration: BoxDecoration(
                          gradient: value.value == index ? LinearGradient(
                              colors: [Colors.blue.shade300,Colors.blue.shade600]
                          ):LinearGradient(
                              colors: [Colors.white,Colors.white]
                          ),
                          borderRadius: BorderRadius.circular(10)
                      ),
                      child: Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 8),
                            width: 50,
                            height: 50,
                            padding: EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              color: Colors.grey.shade50,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Icon(icons[index],color: Colors.black),
                            ),
                          ),
                          Text(' ${text[index]}',
                              style: GoogleFonts.ubuntu(
                                  color: value.value == index ? Colors.white : Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500
                              )
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              );
            });
          }
      ),
    );
  }

  Products() {
    return Container(
      margin: EdgeInsets.all(5),
      height: 79,
      child: GridView.builder(
          itemCount: 2,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 2,
              mainAxisSpacing: 2,
              childAspectRatio: 1.0
          ),
          itemBuilder: (context,index){
              return Consumer<Home_Notifier>(builder: (context,value2,child){
                return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  elevation: 8,
                  child: Container(
                    margin: EdgeInsets.all(18),
                    padding: EdgeInsets.all(2),
                    decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(20)
                    ),
                    child: Stack(
                      children: [
                        Container(
                            width: 150,
                            height: 150,
                            child: Image.asset('${images[index]}',fit: BoxFit.fill,)),
                        Container(
                          margin: EdgeInsets.only(left: 75),
                          width: 50,
                          height: 50,
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              color: Colors.black12,
                              borderRadius: BorderRadius.circular(30)
                          ),
                          child: IconButton(
                              onPressed: () {
                                value2.set(index);
                              },
                              icon: value2.value2 == index
                                  ? Icon(Icons.favorite,color: Colors.red,)
                                  : Icon(Icons.favorite,color: Colors.white,)),
                        )
                      ],
                    ),
                  ),
                );
              });
          }),
    );
  }

  @override
  Widget build(BuildContext context) {
     return SingleChildScrollView(
       child: Column(
         crossAxisAlignment: CrossAxisAlignment.start,
         children: [
           CategoiresText('Categories'),
           CatagoriesBuilder(),
           CategoiresText('Recently Added'),
           Products()
         ],
       ),
     );
  }
}
