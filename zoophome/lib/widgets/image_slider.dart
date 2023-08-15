import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:zoophome/widgets/map1.dart';

class SliderScreen extends StatefulWidget {
  const SliderScreen({super.key});

  @override
  State<SliderScreen> createState() => _SliderScreenState();
}

class _SliderScreenState extends State<SliderScreen> {
  List imageList = [
    {"id": 1, "image_path": 'lib/assets/banner.png'},
    {"id": 2, "image_path": 'lib/assets/banner1.jpg'},
    {"id": 3, "image_path": 'lib/assets/banner.png'}
  ];
  final CarouselController carouselController = CarouselController();
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        backgroundColor: Colors.white,
      leading: IconButton(
        onPressed: () async {
          final newValue = await showModalBottomSheet(
            backgroundColor: Colors.transparent,
            isScrollControlled: true,
            context: context,
            builder: (BuildContext context) {
              return  buildSheet(context);
            },
          );
          late String userAddress = 'Location';
          setState(() {
            if (newValue == '') {
              userAddress = 'Location';
            } else {
              userAddress = newValue;
            }
          });
        },
        icon: Icon(
          Icons.location_on,
          color: Color.fromRGBO(15, 15, 15, 1),
        ),
      ),
      title: Text('ZOOP'),titleTextStyle: TextStyle(color: Color.fromRGBO(38, 112, 169, 1),fontSize: 25 ),
      centerTitle: true,
      actions: [IconButton(onPressed: (){}
      , icon: Icon(Icons.notifications))],
      
    ),
     
       body:Column(children: [ 
         Container(
              child:TextField(
              style: TextStyle(color: Color.fromRGBO(3, 225, 254, 0.612)),
              textAlignVertical: TextAlignVertical.center,
              decoration: InputDecoration(
                filled: true,
                hintText: 'Search For Your Query',
                prefixIcon: Icon(Icons.search),
                prefixIconColor: Color.fromRGBO(8, 188, 238, 0.612),
                hintStyle: TextStyle(
                  fontSize: 15.0,
                  color: Color.fromRGBO(38, 144, 205, 0.561),
                  
                  
                ),
                
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  borderSide: BorderSide(color: Color.fromRGBO(8, 188, 238, 0.612),width: 5.0)
                  
                  
                  
                ),
                
              ),
            ),
              padding: EdgeInsets.symmetric(vertical: 5,horizontal: 20),
              color:Colors.transparent,
              width: 400,
              height: 55,
              margin: EdgeInsets.fromLTRB(0, 5, 0, 0),
        ),
        Container(
          child:Stack(
          
          children: [
            InkWell(
              onTap: () {
                print(currentIndex);
              },
              child: CarouselSlider(
                items: imageList
                    .map(
                      (item) => Image.asset(
                        item['image_path'],
                        fit: BoxFit.cover,
                        width: double.infinity,
                        
                      ),
                    )
                    .toList(),
                carouselController: carouselController,
                options: CarouselOptions(
                  scrollPhysics: const BouncingScrollPhysics(),
                  autoPlay: true,
                  aspectRatio: 1.5,
                  viewportFraction: 1,
                  onPageChanged: (index, reason) {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                ),
              ),
            ),
            Positioned(
              bottom: 10,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: imageList.asMap().entries.map((entry) {
                  return GestureDetector(
                    onTap: () => carouselController.animateToPage(entry.key),
                    child: Container(
                      width: currentIndex == entry.key ? 17 : 7,
                      height: 7.0,
                      margin: const EdgeInsets.symmetric(
                        horizontal: 3.0,
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: currentIndex == entry.key
                              ? Colors.grey
                              : Colors.white),
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
        margin: EdgeInsets.symmetric(vertical: 7,horizontal: 11),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),boxShadow:[ BoxShadow(color: Colors.black,spreadRadius: 1,blurRadius: 2,blurStyle: BlurStyle.outer)]),
        ),
        
       
      ]),
    );
  }
}

Widget buildSheet(context)=>

     DraggableScrollableSheet(
      
      initialChildSize: 0.9,
      minChildSize: 0.9,
      maxChildSize: 1,
      
      builder:(_,controller)=> Container(
  
                        color: Colors.white,
  
                        child: Column(
  
                          children: [
  
                            ListTile(
  
                              leading: Material( 
  
                                color: Colors.transparent,
  
                                child: InkWell(
  
                                  onTap: (){
  
                                    Navigator.of(context).pop();
  
                                  },
  
                                  child: Icon(Icons.arrow_back) // the arrow back icon
  
                                  ),
  
                                ),                          
  
                              title: 
  
                                Text("Location") // Your desired title
  
                                ,
  
                                shape: Border(bottom: BorderSide(color: Colors.black,width: 3.0,style: BorderStyle.solid)),
  
                              ),
  
                              Container(child: TextField(style: TextStyle(color: Color.fromRGBO(3, 225, 254, 0.612)),
              textAlignVertical: TextAlignVertical.center,
              decoration: InputDecoration(
                filled: true,
                hintText: 'Search for a location',
                prefixIcon: Icon(Icons.search),
                prefixIconColor: Color.fromRGBO(8, 188, 238, 0.612),
                hintStyle: TextStyle(
                  fontSize: 15.0,
                  color: Color.fromRGBO(38, 144, 205, 0.561),),
                  border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  borderSide: BorderSide(color: Color.fromRGBO(8, 188, 238, 0.612),width: 5.0))
  
                              )
                              ),
                              padding: EdgeInsets.symmetric(vertical: 5,horizontal: 20),
  
                          ),
                          Container(
                            
                             margin: EdgeInsetsDirectional.only(top: 20),
                            child: 
                              ElevatedButton.icon(onPressed: (){},icon: Icon(Icons.gps_fixed),label: Text("Use Current Location"),style: ElevatedButton.styleFrom(primary: Colors.white,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),fixedSize: Size(320, 45)),
                              )  
                            ),
                          Container(
                           
                             margin: EdgeInsets.symmetric(vertical: 10,horizontal: 0),
                             
                             
                            child: 
                             ElevatedButton.icon(onPressed: (){ osm1();},icon: Icon(Icons.location_on),label: Text("Use Current Location"),style: ElevatedButton.styleFrom(primary: Colors.white,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),fixedSize: Size(320, 45)),
                             )
                            ),
                          
                          Text("Saved Addresses",style: TextStyle(fontSize: 17,fontWeight: FontWeight.w600),),
                          Container(
                             margin: EdgeInsets.symmetric(vertical: 5,horizontal: 10),
                             padding: EdgeInsets.symmetric(vertical: 5,horizontal: 8),
                             decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),border:Border.all(color: Colors.black,width: 1.0)),
                            child:Row(children:[
                              Container(
                                padding: EdgeInsetsDirectional.only(end: 20),
                               
                                child: Icon(Icons.home),
                              ),
                              Expanded(
                                child: Container(child: TextButton(onPressed: () {
                              
                                  
                                },child: Column(mainAxisAlignment: MainAxisAlignment.start,children: [Text("Home",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w800,fontSize: 15),),Text("Hello World",overflow: TextOverflow.fade,style: TextStyle(color: Colors.grey),),Row(children: [IconButton.outlined(onPressed: (){}, icon: Icon(Icons.more_horiz),iconSize: 18),IconButton.outlined(onPressed:(){}, icon:Icon(Icons.share),iconSize: 18,)],)],),),),
                              )

                            ])
                          ),
                          Container(
                             margin: EdgeInsets.symmetric(vertical: 5,horizontal: 10),
                             padding: EdgeInsets.symmetric(vertical: 5,horizontal: 8),
                             decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),border:Border.all(color: Colors.black,width: 1.0)),
                            child:Row(children:[
                              Container(
                               
                                child: Icon(Icons.home),
                              ),
                              Expanded(
                                child: Container(child: TextButton(onPressed: () {
                              
                                  
                                },child:Column(children: [Text("Home",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w800,fontSize: 15),),Text("Hello World abcdeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee",style: TextStyle(color: Colors.grey),),Row(children: [IconButton.outlined(onPressed: (){}, icon: Icon(Icons.more_horiz),iconSize: 18),IconButton.outlined(onPressed:(){}, icon:Icon(Icons.share),iconSize: 18,)],)],)),),
                              ),

                            ])
                          ),
                          
                          ]
  
                        )
  
                      )
     );
      