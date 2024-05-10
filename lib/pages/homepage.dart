import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class Food{
  String name;
  String img;

  Food({required this.name, required this.img});
}

class ControlFoods {
  List<Food> foods = [];

  void addFood(String foodName, String img){
    Food food = Food(name: foodName, img: img);
    foods.add(food);
  }

  void removeFood(String name, String img){
    for(int i = 0; i<foods.length;i++){
      if(name == foods[i].name){
        foods.remove(foods[i]);
        break;
      }
    }
  }
}

class CheckFood {
  String name;
  String img;

  CheckFood({required this.name, required this.img});
}

class ControlCheckFoods{
  List<CheckFood> checkfoods = [];

  void addFood(String foodName, String img){
    CheckFood checkfood = CheckFood(name: foodName, img: img);
    checkfoods.add(checkfood);
  }

  void removeFood(String name, String img){
    for(int i = 0; i<checkfoods.length;i++){
      if(name == checkfoods[i].name){
        checkfoods.remove(checkfoods[i]);
        break;
      }
    }
  }

}

class _HomePageState extends State<HomePage> {
  List<String> foodsScreen = [
    'Burger','Fries','Buritto','Taco','Pizza','Sushi','Egg & bacon','Egg plant','Meat','Ice cream','Cake','Cookies','Donut','Coffee'
  ];

  List<String> foodScreenImgs = [
    'burger','fries','buritto','taco','pizza','sushi','egg','plants','meat','ice_cream','cake','cookis','donut','coffe'
  ];



  void addFoods(){
    for(int i = 0; i < foodsScreen.length; i++)
      controlFoods.addFood(foodsScreen[i], foodScreenImgs[i],);
    setState(() {

    });
  }

  ControlFoods controlFoods = ControlFoods();
  ControlCheckFoods controlCheckFoods = ControlCheckFoods();

  @override
  Widget build(BuildContext context) {

    addFoods();

    return  Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20,),

              // addFoods(),

              Center(
                  child: Container(
                    height: 60,
                    width: 360,
                    decoration: BoxDecoration(
                      color: Color(0xFFEDF1F7),
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(color: Colors.grey)
                    ),
                    child: Row(
                      children: [
                        Padding(padding: EdgeInsets.only(left: 20),
                        child: Icon(CupertinoIcons.search,color: Color(0xFF8F9BB3),size: 30,),),

                        SizedBox(width: 10,),

                        Text('Search a place',style: TextStyle(fontWeight: FontWeight.w400,fontSize: 14,color: Color(0xFF8F9BB3)),)
                      ],
                    ),
                  ),
                ),

              Padding(
                padding: const EdgeInsets.all(20),
                child: Wrap(
                  spacing: 20,
                  runSpacing: 10,
                  children: [
                    for(int i = 0; i<controlFoods.foods.length;i++)
                      InkWell(
                        onTap: (){
                          controlCheckFoods.addFood(controlFoods.foods[i].name, controlFoods.foods[i].img);
                          controlFoods.removeFood(controlFoods.foods[i].name, controlFoods.foods[i].img);
                          setState(() {});
                        },
                        child: Chip(
                          label: Text(controlFoods.foods[i].name),
                          avatar: Image.asset('assets/imgs/${controlFoods.foods[i].img}.png'),
                        ),
                      ),
                  ],
                ),
              ),

              controlCheckFoods.checkfoods.length != 0 && controlFoods.foods.length != 0 ? Divider(height: 2,) : SizedBox(width: 0,),

              controlCheckFoods.checkfoods.length != 0 ? Padding(
                padding: const EdgeInsets.all(20),
                child: Wrap(
                  spacing: 20,
                  runSpacing: 10,
                  children: [
                    for(int i = 0; i<controlCheckFoods.checkfoods.length;i++)
                      InkWell(
                        onTap: (){
                          controlFoods.addFood(controlCheckFoods.checkfoods[i].name, controlCheckFoods.checkfoods[i].img);
                          controlCheckFoods.removeFood(controlCheckFoods.checkfoods[i].name, controlCheckFoods.checkfoods[i].img);
                          setState(() {});
                        },
                        child: Chip(
                          label: Text(foodsScreen[i]),
                          avatar: Image.asset('assets/imgs/${foodScreenImgs[i]}.png'),
                          deleteIcon: Icon(Icons.cancel,color: Colors.red,),
                          onDeleted: (){},
                        ),
                      ),
                  ],
                ),
              ) : SizedBox(width: 0,),
            ],
          ),
        ),
      ),
      bottomNavigationBar: controlCheckFoods.checkfoods.length != 0 ? IconButton(onPressed: (){}, icon: Container(
          height: 60,
          width: 350,
          decoration: BoxDecoration(
              color: Colors.deepPurpleAccent,
              borderRadius: BorderRadius.circular(20)
          ),
          alignment: Alignment.center,
          child: Text('Filter',style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold),))) : null,
    );
  }
}
