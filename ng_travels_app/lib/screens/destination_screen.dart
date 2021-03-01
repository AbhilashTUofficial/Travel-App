import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ng_travels_app/models/activity_model.dart';
import 'package:ng_travels_app/models/destination_model.dart';

class DestinationScreen extends StatefulWidget {
  final Destination destination;

  DestinationScreen({this.destination});

  @override
  _DestinationScreenState createState() => _DestinationScreenState();
}

class _DestinationScreenState extends State<DestinationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.only(bottomLeft: Radius.circular(30)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 6,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: Hero(
                  tag: widget.destination.imageUrl,
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30)),
                    child: Image(
                      image: AssetImage(widget.destination.imageUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30, left: 15, right: 15),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: Icon(Icons.arrow_back),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        color: Colors.black54,
                        iconSize: 26,
                      ),
                      Row(
                        children: [
                          IconButton(
                            icon: Icon(Icons.search),
                            onPressed: () {},
                            color: Colors.black54,
                            iconSize: 26,
                          ),
                          IconButton(
                            icon: Icon(Icons.sort),
                            onPressed: () {},
                            color: Colors.black54,
                            iconSize: 26,
                          ),
                        ],
                      ),
                    ]),
              ),
              Positioned(
                bottom: 20,
                left: 20,
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.destination.city,
                          style: TextStyle(
                            fontSize: 24,
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 1,
                          ),
                        ),
                        Row(
                          children: [
                            Icon(
                              FontAwesomeIcons.locationArrow,
                              size: 12,
                              color: Colors.white,
                            ),
                            SizedBox(width: 5),
                            Text(
                              widget.destination.country,
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                  letterSpacing: 1),
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Positioned(
                right: 20,
                bottom: 20,
                child: IconButton(
                  icon: Icon(Icons.location_on),
                  onPressed: () {},
                  iconSize: 30,
                  color: Colors.white,
                ),
              )
            ],
          ),
          Expanded(
            child: ListView.builder(
                itemCount: widget.destination.activities.length,
                itemBuilder: (context, int index) {
                  Activity activity = widget.destination.activities[index];
                  return Stack(
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(40, 5, 20, 5),
                        height: 170,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20)),
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(100, 20, 20, 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 120,
                                    child: Text(
                                      activity.name,
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black87),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        "\$${activity.price}",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 22),
                                      ),
                                      Text(
                                        "Per pax",
                                        style: TextStyle(
                                            fontSize: 12, color: Colors.grey),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Text(
                                activity.type,
                                style: TextStyle(color: Colors.grey),
                              ),
                              SizedBox(height: 10),
                              Row(
                                children: [
                                  Container(
                                    alignment: Alignment.center,
                                    width: 60,
                                    decoration: BoxDecoration(
                                        color: Theme.of(context).accentColor,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: (Text(activity.startTimes[0])),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Container(
                                    alignment: Alignment.center,
                                    width: 60,
                                    decoration: BoxDecoration(
                                        color: Theme.of(context).accentColor,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: (Text(activity.startTimes[1])),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left:15,top:15,bottom:15,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image(
                            image: AssetImage(activity.imageUrl),
                            width: 120,
                            fit: BoxFit.cover,
                          ),
                        ),
                      )
                    ],
                  );
                }),
          )
        ],
      ),
    );
  }
}
