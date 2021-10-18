import 'package:flutter/material.dart';
import 'package:travel_ui/data.dart';
import 'package:travel_ui/home_screen.dart';

class DetailScreen extends StatefulWidget {
  final Destination destination;
  DetailScreen({Key? key, required this.destination}) : super(key: key);

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ListView(
            children: [
              Stack(
                children: [
                  Container(
                    height: 350,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage(widget.destination.image),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 20,
                    right: 10,
                    left: 10,
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 20,
                          backgroundColor: Colors.white,
                          child: IconButton(
                            icon: Icon(
                              Icons.arrow_back,
                              color: Colors.blue,
                            ),
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => HomeScreen()));
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10),
                    Text(
                      widget.destination.name,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 35,
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15))),
                          child: Center(
                            child: Icon(
                              Icons.star_border_outlined,
                              color: Colors.blue,
                            ),
                          ),
                        ),
                        Text("5.0",
                            style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold)),
                        SizedBox(width: 5),
                        Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15))),
                          child: Center(
                            child: Icon(
                              Icons.timelapse_rounded,
                              color: Colors.blue,
                            ),
                          ),
                        ),
                        Text("12 hari",
                            style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold)),
                        SizedBox(width: 5),
                        Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15))),
                          child: Center(
                            child: Icon(
                              Icons.place_outlined,
                              color: Colors.blue,
                            ),
                          ),
                        ),
                        Text("120 km",
                            style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold)),
                        SizedBox(width: 120),
                        Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15))),
                          child: Center(
                            child: Icon(
                              Icons.favorite_border_sharp,
                              size: 30,
                              color: Colors.blue,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Text(
                      widget.destination.description,
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 30),
              height: 80,
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Total",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        r"$890.00",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    height: 60,
                    width: 150,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.all(
                        Radius.circular(15),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        "Book Now",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
