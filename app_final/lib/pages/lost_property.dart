import 'package:flutter/material.dart';
import 'package:app_final/pages/find_lost_property.dart';

class LostProperty extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: LostPropertyHome());
  }
}

class LostPropertyHome extends StatelessWidget {
  static const black_titles = Color(0x00090909);

  const LostPropertyHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context,
                '/lost_property.dart'); // Regresar a la ventana anterior
          },
        ),
        centerTitle: true,
        title: const Text(
          'Objetos Perdidos',
          style: TextStyle(
              color: Colors.black,
              fontFamily: 'Urbanist',
              fontWeight: FontWeight.bold,
              fontSize: 25),
        ),
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: TextField(
              onChanged: (value) {
                // Handle search logic here
              },
              decoration: InputDecoration(
                labelText: '',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                ),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 3.0, horizontal: 2.0),
              ),
            ),
          ),
          const SizedBox(height: 10),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              "Categorias",
              style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Urbanist',
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    primary: Colors.black, minimumSize: Size(40, 40)),
                child: const Text("Celulares",
                    style: TextStyle(
                        color: Color(0xFFF6A700),
                        fontFamily: 'Urbanist',
                        fontWeight: FontWeight.bold,
                        fontSize: 20)),
              ),
              ElevatedButton(
                onPressed: () {
                  // Acción del botón 2
                },
                style: ElevatedButton.styleFrom(
                    primary: Colors.black, minimumSize: Size(40, 40)),
                child: const Text("Libros",
                    style: TextStyle(
                        color: Color(0xFFF6A700),
                        fontFamily: 'Urbanist',
                        fontWeight: FontWeight.bold,
                        fontSize: 20)),
              ),
              ElevatedButton(
                onPressed: () {
                  // Acción del botón 3
                },
                style: ElevatedButton.styleFrom(
                    primary: Colors.black, minimumSize: Size(40, 40)),
                child: const Text("PCs",
                    style: TextStyle(
                        color: Color(0xFFF6A700),
                        fontFamily: 'Urbanist',
                        fontWeight: FontWeight.bold,
                        fontSize: 20)),
              ),
              ElevatedButton(
                onPressed: () {
                  // Acción del botón 3
                },
                style: ElevatedButton.styleFrom(
                    primary: Colors.black, minimumSize: Size(40, 40)),
                child: const Text("Otros",
                    style: TextStyle(
                        color: Color(0xFFF6A700),
                        fontFamily: 'Urbanist',
                        fontWeight: FontWeight.bold,
                        fontSize: 20)),
              )
            ],
          ),
          Expanded(
            child: PageView(
              children: [
                buildGridView('Category 1'),
                buildGridView('Category 2'),
                buildGridView('Category 3'),
                buildGridView('Category 4'),
                // Add more categories as needed
              ],
            ),
          ),
          Center(
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  primary: Colors.black, minimumSize: Size(40, 40)),
              child: const Text(
                "Reportar Objeto perdido",
                style: TextStyle(
                    color: Color(0xFFF6A700),
                    fontFamily: 'Urbanist',
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildGridView(String category) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemCount: 4,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    FindLostProperty(), // Navegar a la ventana
              ),
            );
          },
          child: Card(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset('lib/imgs/el_logo.png'),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Iphone 13",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                            Text(
                              "Encontrado:",
                              style: TextStyle(
                                  fontSize: 15, color: Color(0xBBBB87400)),
                            ),
                            // ... (otros textos)
                          ],
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.location_on_outlined,
                              color: Color(0xBBBB87400),
                            ),
                            SizedBox(width: 2),
                            Text(
                              "RGD",
                              style: TextStyle(
                                  color: Color(0xBBBB87400), fontSize: 18),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
