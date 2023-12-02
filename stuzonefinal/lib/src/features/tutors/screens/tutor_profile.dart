import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 40),
            const CircleAvatar(
              radius: 70,
              backgroundColor: Color.fromRGBO(254, 211, 83, 0.7),
              backgroundImage: AssetImage('lib/imgs/tutors.png'),

            ),
            const SizedBox(height: 20),
            itemProfile('Name', 'Juana Cabrera', CupertinoIcons.person),
            const SizedBox(height: 10),
            itemProfile('Phone', '3193195533', CupertinoIcons.phone),
            const SizedBox(height: 10),
            itemProfile('Subject', 'Mobile Development', CupertinoIcons.book),
            const SizedBox(height: 10),
            itemProfile('Email', 'juana23@gmail.com', CupertinoIcons.mail),
            const SizedBox(height: 20,),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(15), backgroundColor: Colors.black,
                    //side: const BorderSide(width: 2, color: Colors.black, style: BorderStyle.solid)
                  ),
                  child: const Text('Edit Profile')
              ),
            )
          ],
        ),
      ),
    );
  }

  itemProfile(String title, String subtitle, IconData iconData) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: const Color.fromRGBO(254, 211, 83, 0.7),width: 2),
        borderRadius: BorderRadius.circular(10),

      ),
      child: ListTile(
        title: Text(title),
        subtitle: Text(subtitle),
        leading: Icon(iconData),
        tileColor: Colors.white,
      ),
    );
  }
}