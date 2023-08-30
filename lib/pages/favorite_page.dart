import 'package:app_delivery/models/food_item.dart';
import 'package:flutter/material.dart';


class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  

  @override
  Widget build(BuildContext context) {
    return favoriteItemList.isNotEmpty? ListView.builder(
      itemCount: favoriteItemList.length,
      itemBuilder: (conext ,index){
      return Card(
        child: ListTile(
          leading:Image(
            width: 80,
            height: 100,
            fit: BoxFit.fill,
            image :NetworkImage(
              favoriteItemList[index].imageUrl
              ) 
              ),
              title:Text(
                favoriteItemList[index].name
                ) ,
                trailing: IconButton(
                  onPressed: (){
                    setState(() {
                      favoriteItemList[index]=favoriteItemList[index].cobywith(isFavorite:!favoriteItemList[index].isFavorite );
                      final selectedFoodItem=listFood.firstWhere((element) => element.id==favoriteItemList[index].id);
                                  final selectedFoodItemIndex=listFood.indexOf(selectedFoodItem);
                                  listFood[selectedFoodItemIndex]=favoriteItemList[index];
                                  if(favoriteItemList[index].isFavorite==false){
                                    for (int i=0;i<favoriteItemList.length;i++) {
                                      if(favoriteItemList[i].id==favoriteItemList[index].id) {
                                        favoriteItemList.removeAt(i);
                                      }
                                    
                                  }
                                  }
                    });
                  }, 
                  icon: Icon(
                                 favoriteItemList[index].isFavorite== false
                                ?Icons.favorite_border
                                :Icons.favorite,
                                color: Colors.orange,
                  ),
                  ),)
      );
    }
    )
    :const Center(
      child: Text(
        "ther are no items in the list",
        style: TextStyle(
          color: Colors.grey,
          fontSize: 30,
          fontWeight: FontWeight.bold
        ),
        )
        );
  }
}