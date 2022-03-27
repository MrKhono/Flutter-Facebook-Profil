import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: CloneFacebook(),
    );
  }
}

class CloneFacebook extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var platform = Theme.of(context).platform;
    return Scaffold(
      appBar: AppBar(
        title: Text("Facebook Profile"),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.topCenter,
              children: [
                Image.asset("images/computer.jpg", height: 200, fit: BoxFit.cover, width: size.width,),
                Padding(
                    padding: EdgeInsets.only(top: 125),
                    child : CircleAvatar(
                      radius: 75,
                      backgroundColor: Colors.white,
                      child: myProfilePic(72),
                    )
                ),

              ],
            ),
            Column(
              children: [
                Text(
                  "Loïc Khono",
                  style: TextStyle(
                    fontSize: 30,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold
                  ),
                ),Padding(
                    padding: EdgeInsets.all(10),
                  child: Text(
                    "Si tu t'apprête à dire oui je le veux, tu dois t'assurer d'avoir bien réfléchis à ce que tu ne veux plus",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.grey
                    ),
                  ) ,
                ),

              ],
            ),
            Row(
              children: [
                Expanded(child: buttonContainer(text: "Modifie le profil")),
                buttonContainer(icon: Icons.border_color)
              ],
            ),
            Divider(thickness: 2,),
            sectionTitleText("A propos de moi"),
            Apropos(icon: Icons.home, text: "Dakar, Sénégal"),
            Apropos(icon: Icons.work, text: "Developpeur IOS"),
            Apropos(icon: Icons.favorite, text: "Célibataire"),
            sectionTitleText("Amis"),
            Card(
              child: Padding(
                  padding: EdgeInsets.only(left: 5),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      listAmis("images/olha.jpg"),
                      listAmis("images/vlada.jpg"),
                      listAmis("images/malik.jpg"),
                      listAmis("images/bia.jpg"),
                    ],
                  ),
                ),
              ),
            ),

          ],
        ),
      )
    );
  }

}

CircleAvatar myProfilePic(double? radius){
  return CircleAvatar(
    radius: 72,
    backgroundImage: AssetImage("images/code.jpg"),
  );
}

Container buttonContainer({IconData? icon, String? text} ){
  return Container(
    margin: EdgeInsets.only(left: 10, right: 10),
    padding: EdgeInsets.all(15),
    decoration : BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color: Colors.blue
    ),
    child: (icon == null)
        ? Center(child: Text(text ?? "", style: TextStyle(color: Colors.white)))
        : Icon(icon, color: Colors.white,),
      height: 50,
  );
}

Row Apropos({IconData? icon, String? text}){
  return Row(
    children: [
      Icon(icon),
      Text(text!)
    ],
  );
}

Widget sectionTitleText(String text){
  return Padding(
      padding: EdgeInsets.all(5),
    child: Text(
      text,
      style: TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 18
      ),
    ),
  );
}

Container listAmis(String image){
  return Container(
    margin: EdgeInsets.only(right: 10),
    height: 150,
    width: 120,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(7)),
        image: DecorationImage(
            image: AssetImage(image),
            fit: BoxFit.cover
        )
    ),
  );
}
