import 'package:flutter/material.dart';



class RankingTutor extends StatelessWidget {
  const RankingTutor({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFCFAF8),
      body: ListView(
        children: <Widget>[
          const SizedBox(height: 15.0),
          Container(
              padding: const EdgeInsets.only(right: 15.0),
              width: MediaQuery.of(context).size.width - 30.0,
              height: MediaQuery.of(context).size.height - 50.0,
              child: GridView.count(
                crossAxisCount: 2,
                primary: false,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 15.0,
                childAspectRatio: 0.8,
                children: <Widget>[
                  _buildCard('Mobile Development', 'Juana Cabrera', 'assets/images/tutors/tutor (1).jpg', "5",
                     context),
                  _buildCard('PMC', 'Pedro Perez', 'assets/images/tutors/tutor2 (1).png', "3.5",
                      context),
                  _buildCard('Calculus', 'Julian Gomez',
                      'assets/images/tutors/tutor3 (1).png', "2", context),
                  _buildCard('Biology', 'Lucas Rios', 'assets/images/tutors/tutor4 (1).png', "4",
                     context)
                ],
              )),
          const SizedBox(height: 15.0)
        ],
      ),
    );
  }

  Widget _buildCard(String subject, String name, String imgPath, String ranking, context) {
    return Padding(
        padding: const EdgeInsets.only(top: 5.0, bottom: 5.0, left: 5.0, right: 5.0),
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
                  const SizedBox(height: 7.0),
                  Text(name,
                      style: const TextStyle(
                          color: Color(0xFFCC8053),
                          fontFamily: 'Varela',
                          fontSize: 14.0)),
                  Text(subject,
                      style: const TextStyle(
                          color: Color(0xFF575E67),
                          fontFamily: 'Varela',
                          fontSize: 11.0)),
                  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(color: const Color(0xFFEBEBEB), height: 1.0)),
                      
Center(
                child: TextButton(
  onPressed: () {},
  
  style: TextButton.styleFrom(
    
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
    ),
  ),
  child: Text(ranking),
),
              ),

                            Padding(
                      padding: const EdgeInsets.only(left: 5.0, right: 5.0),
                      child: Row(

                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [

                            SizedBox(height: 20,child: ElevatedButton(onPressed: () {},style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromRGBO(254, 211, 83, 0.7),minimumSize: Size.zero, // Set this
    padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                    //side: const BorderSide(width: 2, color: Colors.black, style: BorderStyle.solid)
                  ),child: const Text('Rate', style: TextStyle(color: Colors.black, fontSize: 11),)),) 
                          ]))
                ]))));
  }
}