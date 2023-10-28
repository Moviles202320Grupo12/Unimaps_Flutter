import 'package:flutter/material.dart';


class SelectTutorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFCFAF8),
      body: ListView(
        children: <Widget>[
          SizedBox(height: 15.0),
          Container(
              padding: EdgeInsets.only(right: 15.0),
              width: MediaQuery.of(context).size.width - 30.0,
              height: MediaQuery.of(context).size.height - 50.0,
              child: GridView.count(
                crossAxisCount: 2,
                primary: false,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 15.0,
                childAspectRatio: 0.8,
                children: <Widget>[
                  _buildCard('Mobile Development', 'Juana Cabrera', 'lib/imgs/tutors.png',
                      context),
                  _buildCard('PMC', 'Juan Carlos Garcia', 'lib/imgs/tutor2.png',
                      context),
                  _buildCard('Calculus', 'Santiago Restrepo',
                      'lib/imgs/tutor3.png', context),
                  _buildCard('Biology', 'Jorge Ardila', 'lib/imgs/tutor4.png',
                      context)
                ],
              )),
          SizedBox(height: 15.0)
        ],
      ),
    );
  }

  Widget _buildCard(String subject, String name, String imgPath, context) {
    return Padding(
        padding: EdgeInsets.only(top: 5.0, bottom: 5.0, left: 5.0, right: 5.0),
        child: InkWell(

            child: Container(

                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 3.0,
                          blurRadius: 5.0)
                    ],
                    color: Colors.white),
                child: Column(children: [

                  Hero(
                      tag: imgPath,
                      child: Container(
                          height: 75.0,
                          width: 75.0,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(imgPath),
                                  fit: BoxFit.contain)))),
                  SizedBox(height: 7.0),
                  Text(name,
                      style: TextStyle(
                          color: Color(0xFFCC8053),
                          fontFamily: 'Varela',
                          fontSize: 14.0)),
                  Text(subject,
                      style: TextStyle(
                          color: Color(0xFF575E67),
                          fontFamily: 'Varela',
                          fontSize: 11.0)),
                  Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Container(color: Color(0xFFEBEBEB), height: 1.0)),
                  Padding(
                      padding: EdgeInsets.only(left: 5.0, right: 5.0),
                      child: Row(

                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [

                            Container(height: 20,child: ElevatedButton(onPressed: () {},style: ElevatedButton.styleFrom(
                              primary: Color.fromRGBO(254, 211, 83, 0.7),
                              //side: const BorderSide(width: 2, color: Colors.black, style: BorderStyle.solid)
                            ),child: const Text('Book a session', style: TextStyle(color: Colors.black, fontSize: 11),)),)
                          ]))
                ]))));
  }
}