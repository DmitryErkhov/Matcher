import 'package:dyalr3/people.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  int indexCard = 0;

  List<Person> listCard = [
    Person(age: "25", name: "Кирилл", surName: "Ковальчук", about: "Ну вообще я Кирилл и круто играю в игры. А на самом деле люблю всех", img: "https://sun9-47.userapi.com/impg/PnS0m4job7H5_dnvbzYcudyqDfFSy1HGWeTT-w/fjBACk-xDO0.jpg?size=1731x2160&quality=95&sign=02e331d49c756e86c82581b9605d1c5e&type=album"),
    Person(age: "20", name: "Павел", surName: "Латышев", about: "В жизни есть два прекрасных дела, покушать после 12 (Дня и Ночи)", img: "https://sun1-17.userapi.com/impg/ooET1rITiX2w13t7tyqITCiUUsjubCvMRvTvlw/kP2EurVkQoM.jpg?size=2160x2160&quality=96&sign=024b983666f70bbe71df1cb972496c78&type=album"),
    Person(age: "24", name: "Денис", surName: "Дерябин", about: "Примерный заводчанин, ищу ту, кто дождется из армии)))", img: "https://sun1-93.userapi.com/impg/1anOUUAbqdAWTVb1twV2XVcYAWtemc_cG-_n-A/LQ6Njlrk810.jpg?size=1620x2160&quality=96&sign=c268a15f531870454180654c7e697a7f&type=album"),
    Person(age: "19", name: "Аня", surName: "Петрова", about: "Люблю печеньки, но могу полюбить и тебя", img: "https://sun1-94.userapi.com/impg/9bvR00zt21FtcCDhBJoa4rcfxYg8G_veBUI34g/lxg4UTEPReM.jpg?size=1080x1616&quality=96&sign=2469401f2c9b3839567f6692e9c8bcd3&type=album")
  ];

  List<Person> favoriteList = [];

  List<Person> likeList = [];

  void _likePeople() {
    setState(() {
      likeList.add(listCard[indexCard]);
      indexCard == 3 ? indexCard = 0 :  indexCard++;
    });
  }
  void _dislikePeople(){
    setState(() {
      indexCard == 0 ? indexCard = 3 :  indexCard--;
    });
  }
  void _FavoritePeople(){
    favoriteList.add(listCard[indexCard]);
    setState(() {
      print("Анкет в избранном: ${favoriteList.length}");
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: const Icon(Icons.favorite), onPressed: () {
              showDialog(context: context, builder: (BuildContext context){
                return AlertDialog(
                  title: Text("Понравившиеся анкеты", style: TextStyle(fontFamily: "Dancing", fontSize: 24, fontWeight: FontWeight.w600),),
                  content: ListView.builder(
                    // shrinkWrap: true,
                    // physics: const NeverScrollableScrollPhysics(),
                    itemCount: likeList.length,
                    itemBuilder: (BuildContext context, int index){
                      return Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Row(
                          children: [
                            Image.network(likeList[index].img, width: 70, height: 70,),
                            Text('${likeList[index].surName} ${likeList[index].name}, ${likeList[index].age}'),
                      ],
                    ),
                  );
                },
              ),
            );
          });
        }
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.sort), onPressed: () { }
            )
        ],
        // цвет
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text('Matcher', style: TextStyle(fontFamily: "Dancing", fontSize: 32, fontWeight: FontWeight.w600),),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.all( 20 ),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 80),
                width: MediaQuery.of(context).size.width,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                    child: Image.network(listCard[indexCard].img, width: MediaQuery.of(context).size.width, height: MediaQuery.of(context).size.height,)
                )
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 125,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Colors.white
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 35),
                    child: Text("${listCard[indexCard].surName} ${listCard[indexCard].name} , ${listCard[indexCard].age}", style: TextStyle(fontWeight: FontWeight.w900, fontSize: 20),),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 15, left: 15, right: 15),
                    child: Text(listCard[indexCard].about, style: TextStyle(fontStyle: FontStyle.italic), textAlign: TextAlign.center,),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 100),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    width: 50,
                    height: 50,
                    child: IconButton(
                        icon: const Icon(Icons.thumb_down_outlined, color: Colors.white,), onPressed: () {_dislikePeople();}
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    width: 50,
                    height: 50,
                    child: IconButton(
                        icon: const Icon(Icons.star_border, color: Colors.white,), onPressed: () {_FavoritePeople();}
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.pink,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    width: 50,
                    height: 50,
                    child: IconButton(
                        icon: const Icon(Icons.favorite_outline, color: Colors.white,), onPressed: () {_likePeople();}
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
