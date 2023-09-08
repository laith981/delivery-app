import 'package:app_delivery/models/food_item.dart';
import 'package:app_delivery/widgets/product_discription_widget.dart';
import 'package:flutter/material.dart';

class ProductDetailsPage extends StatefulWidget {
   FoodItem foodItem;
   ProductDetailsPage({super.key, required this.foodItem});

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  late bool isFavorite;
  int quantete=1;
 _incresQuantete(){
    setState(() {
      quantete++;
    });
  }
 _decresQuantete(){
    setState(() {
      if(quantete>1) {
        quantete--;
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Center(child: Text(widget.foodItem.name)),
        actions: [IconButton(
          onPressed: (){
            setState(() {
               int? index;
              for(int i=0;i<listFood.length;i++){
                if (listFood[i].id==widget.foodItem.id){
                  listFood[i]= listFood[i].cobywith(isFavorite: !listFood[i].isFavorite);
                  widget.foodItem=listFood[i]; 
                  for(int j=0;j<favoriteItemList.length;j++){
                  if(favoriteItemList[j].id==listFood[i].id){
                    index=j;
                    break;
                  }
                  
                 

                }
                if(index==null) {
                    favoriteItemList.add(listFood[i]);
                  }
                  else{
                    favoriteItemList.removeAt(index);
                  }
                             
                }
                
                 
                
                
              }
            });
        }, icon:Icon(
           widget.foodItem.isFavorite?Icons.favorite:Icons.favorite_border,
           color: Colors.orange,
        )
        )
        ],
      ),
      body: SafeArea(
        child:Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                                      children: [
                                        DecoratedBox(
                                          decoration: BoxDecoration(
                                            color: Colors.grey[200]
                                          ),
                                          child: Image(image:NetworkImage( widget.foodItem.imageUrl),
                                          fit:BoxFit.fill ,
                                          width: double.infinity,
                                          height: MediaQuery.of(context).size.height*0.5 ,
                                          ),
                                        ),
                                        SizedBox(height:MediaQuery.of(context).size.height*0.01 ,),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              
                                              children: [
                                                Text(widget.foodItem.category,
                                                style: const TextStyle(
                                                  color:Colors.black45
                                                ),
                                                ),
                                                SizedBox(height:MediaQuery.of(context).size.height*0.03 ,),
                                                Text(widget.foodItem.name,
                                                style: const TextStyle(
                                                  fontWeight: FontWeight.bold
                                                ),
                                                ),
                                              ],
                                            ),
                                            DecoratedBox(
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(30),
                                                color: Colors.grey
                                                ),
                                                child: Row(
                                                  children: [
                                                    IconButton(onPressed:quantete>1? _decresQuantete:null, 
                                                    icon:const Icon(Icons.remove)
                                                        ),
                                                    Text("$quantete"),
                                                    IconButton(onPressed: _incresQuantete, 
                                                    icon:const Icon(Icons.add)
                                                      )
                                                  ],
                                                ),
                                                )
                                          ],
                                        ),
                                        SizedBox(height:MediaQuery.of(context).size.height*0.01 ,),
                
                                        const Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            ProductDiscriptionWidget(titel: "size", value: "medium"),
                                            SizedBox(
                                              height: 45,
                                              child: VerticalDivider()
                                              ),
                                            ProductDiscriptionWidget(titel: "Caloris", value: "150 KCal"),
                                            SizedBox(
                                              height: 45,
                                              child: VerticalDivider()
                                              ),
                                            ProductDiscriptionWidget(titel: "Cooking", value: "5 - 10 Mins"),
                                          ],
                                        ),
                                        const Text("lern mor abut this productlern mor abut this productlern mor abut this productlern mor abut this productlern mor abut this productlern mor abut this productlern mor abut this productlern mor abut this product lern mor abut this productlern mor abut this productlern mor abut this productlern mor abut this productlern mor abut this productlern mor abut this productlern mor abut this productlern mor abut this product ",
                                        style: TextStyle(
                                          color: Colors.black45,
                                          fontSize: 15
                                          ),
                                        )
                                      ],
                                                    
                                      ),
                ),
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 1, 
                    child: Text("\$${(quantete*widget.foodItem.price).toStringAsFixed(2)}",
                    style: const TextStyle(
                      color: Colors.deepOrange,
                      fontSize: 24,
                      fontWeight: FontWeight.bold
                    ),
                    )
                    ),
                  Expanded(flex: 2, child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))
                    ),
                    onPressed: (){}, 
                    child: const Text("Checkout")
                    )
                      ,),
                
                ],
                ),
            ],
          ),
          
        ),
        ),
    );
  }
}