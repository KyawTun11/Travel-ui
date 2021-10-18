import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travel_ui/data.dart';
import 'package:travel_ui/detail_screen.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _index = 0;
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(right: 15, top: 50),
              child: Container(
                margin: EdgeInsets.only(left: 20),
                height: 40,
                width: 150,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.grey,
                      child: Image(
                        width: 40,
                        image: AssetImage("images/profile.png"),
                      ),
                    ),
                    SizedBox(width: 10),
                    Center(
                      child: Text(
                        "Hi Abdullah!",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            //SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Where would",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "you like to visit ?",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 60,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15)),
                          child: TextFormField(
                            decoration: InputDecoration(
                              hintText: "Search Places",
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide.none,
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide.none,
                              ),
                              prefixIcon: Icon(Icons.search),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: IconButton(
                          icon: Icon(
                            Icons.menu_rounded,
                            size: 30,
                          ),
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 30),
            Container(
              height: 400,
              child: PageView.builder(
                  itemCount: destinations.length,
                  controller: PageController(viewportFraction: 0.7),
                  onPageChanged: (int index) => setState(() => _index = index),
                  itemBuilder: (context, i) {
                    return Transform.scale(
                      scale: i == _index ? 1.0 : 0.9,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => DetailScreen(
                                    destination: destinations[i],
                                  )));
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              height: 400,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: AssetImage(destinations[i].image),
                                ),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Container(
                                    height: 80,
                                    width: double.infinity,
                                    padding: EdgeInsets.all(15),
                                    margin: EdgeInsets.only(
                                        bottom: 10, right: 10, left: 10),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: Colors.white),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          destinations[i].name,
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        SizedBox(height: 5),
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.location_on,
                                              size: 15,
                                              color: Colors.blue,
                                            ),
                                            SizedBox(width: 10),
                                            Text(
                                              destinations[i].places,
                                              style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.grey,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Row(
        children: [
          buildNavigationItem(Icons.home, 0),
          buildNavigationItem(Icons.search, 1),
          buildNavigationItem(Icons.browser_not_supported_outlined, 2),
          buildNavigationItem(Icons.person_outline_outlined, 3),
        ],
      ),
    );
  }

  Widget buildNavigationItem(IconData icon, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Container(
        child: Icon(
          icon,
          size: 30,
          color: index == _selectedIndex ? Colors.blue : Colors.grey,
        ),
        height: 70,
        width: MediaQuery.of(context).size.width / 4,
        decoration: index == _selectedIndex
            ? BoxDecoration(
                borderRadius: BorderRadius.circular(15),
              )
            : BoxDecoration(),
      ),
    );
  }
}
