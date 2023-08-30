import 'package:app_delivery/models/category.dart';
import 'package:app_delivery/models/food_item.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int? choiceIndex;
  late List <FoodItem> filteredFoodList;
  
  
  @override
  void initState() {
   
    super.initState();
    filteredFoodList=listFood;
    
  }
  
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding:const EdgeInsets.symmetric(horizontal:20),
            child: Column(
              children: [
                 Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.grey[100]
                        ),
                        child: const Icon(Icons.menu)
                        ),
                    ),
                    const Column(
                      children: [
                        Text("location"),
                        Row(children: [
                          Icon(Icons.location_on),
                          SizedBox(width: 10,),
                          Text("Nablus,Palestine")
                        ],)
                      ],
                    ),
                       InkWell(
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.grey[100]
                        ),
                        child:const Icon(Icons.notifications)
                        ),
                    ),
                    
                  ],
                ),
                SizedBox(height: MediaQuery.of(context).size.height*0.02,),
                Container(
                  height: MediaQuery.of(context).size.height*0.5,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    
                  ),
                  child: const Image(image: NetworkImage("https://food-images.files.bbci.co.uk/food/recipes/black_and_blue_burger_95881_16x9.jpg"),
                  fit: BoxFit.fill,
                  ),
                ) ,
                 SizedBox(height:MediaQuery.of(context).size.height*0.01 ,),
                  TextField(
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.search,color: Colors.grey,),
                    hintText: 'find your food....',
                    hintStyle:const TextStyle(color: Colors.grey),
                    fillColor: Colors.grey[100],
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6),
                      borderSide: BorderSide.none
                    )
                    

                  ),
                  
                 ),
                 SizedBox(height:MediaQuery.of(context).size.height*0.01 ,),
                 SizedBox(
                  height: MediaQuery.of(context).size.height*0.2 ,
                   child: ListView.builder(
                    scrollDirection: Axis.horizontal, 
                    itemCount: categorys.length,
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsetsDirectional.only(end: 10),
                      child: InkWell(
                        onTap: (){
                          setState(() {
                            if(choiceIndex==null||choiceIndex!=index){
                              choiceIndex=index;  
                            }
                            else{
                              choiceIndex=null;
                              filteredFoodList=listFood;
                            }
                            if(choiceIndex!=null){
                              filteredFoodList=listFood.where((element) => element.category==categorys[index].title).toList();
                            }  
                                              
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          width: MediaQuery.of(context).size.width*0.1,
                          height:MediaQuery.of(context).size.height*0.1, 
                          decoration: BoxDecoration(
                            
                            color: choiceIndex==index? Colors.orange:Colors.grey[100]
                          ),
                          child: Column(
                            children: [
                              Image(image: AssetImage(categorys[index].imageUrl),
                              height:MediaQuery.of(context).size.height*0.1  ,
                              ),
                              SizedBox(height:MediaQuery.of(context).size.height*0.02 ,),
                              Text(categorys[index].title)
                            ],
                          ),
                        ),
                      ),
                    ),
                   ),
                 ),
                 SizedBox(height:MediaQuery.of(context).size.height*0.01 ,),
                GridView.builder(
                  gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing:10,
                    crossAxisSpacing: 10,
                  ), 
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true, 
                  itemCount: filteredFoodList.length,
                  itemBuilder:(context,index)=>Container(
                    
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.0),
                      color: Colors.grey[200]
                    ),
                    child: Padding(
                      padding:const EdgeInsets.all(10) ,
                      child: Stack(
                        alignment: AlignmentDirectional.center,
                        children: [
                          Column(
                          children: [
                            Image(image:NetworkImage( filteredFoodList[index].imageUrl),
                            fit:BoxFit.fill ,
                            width: double.infinity,
                            height: MediaQuery.of(context).size.height*0.85 ,
                            ),
                            SizedBox(height:MediaQuery.of(context).size.height*0.01 ,),
                            Text(filteredFoodList[index].category,
                            style: const TextStyle(
                              color:Colors.black45
                            ),
                            ),
                            SizedBox(height:MediaQuery.of(context).size.height*0.01 ,),
                            Text(filteredFoodList[index].name,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold
                            ),
                            ),
                            SizedBox(height:MediaQuery.of(context).size.height*0.01 ,),
                            Text("\$ ${filteredFoodList[index].price}",
                            style: const TextStyle(
                              color:Colors.orange
                            ),
                            ),
                          ],
                                        
                          ),
                          PositionedDirectional(
                            end: 0,
                            top: 0,
                            child: IconButton(
                              onPressed: (){
                                setState(() {
                                  filteredFoodList[index]=filteredFoodList[index].cobywith(isFavorite: !filteredFoodList[index].isFavorite);

                                  final selectedFoodItem=listFood.firstWhere((element) => element.id==filteredFoodList[index].id);
                                  final selectedFoodItemIndex=listFood.indexOf(selectedFoodItem);
                                  listFood[selectedFoodItemIndex]=filteredFoodList[index];
                                  
                                  if (filteredFoodList[index].isFavorite ){
                                    int cont=0;
                                    
                                      
                                    
                                      favoriteItemList.forEach((element) {
                                        if(element.id==filteredFoodList[index].id) {
                                          cont++;
                                        }
                                        
                                        });
                                        
                                    
                                    if(cont==0) {
                                      favoriteItemList.add(filteredFoodList[index]);
                                    }
                                  }
                                  else {
                                    for (int i=0;i<favoriteItemList.length;i++) {
                                      if(favoriteItemList[i].id==filteredFoodList[index].id) {
                                        favoriteItemList.removeAt(i);
                                      }
                                    }
                                  

                                  }
                                  
                                });
                                debugPrint(favoriteItemList.toString());
                              }, 
                              icon: Icon(
                                 filteredFoodList[index].isFavorite== false
                                ?Icons.favorite_border
                                :Icons.favorite,
                                color: Colors.orange,
                                )
                              ),
                          ) 
                        ]
                      ),
                    ),
                  )
                  ),
            
              
              ],
            ),
            ),
        )
          );
  }
}