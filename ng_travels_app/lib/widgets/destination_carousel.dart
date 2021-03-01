import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ng_travels_app/models/destination_model.dart';
import 'package:ng_travels_app/screens/destination_screen.dart';

class DestinationCarousel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: EdgeInsets.only(top: 40, left: 20),
              child: Text(
                "Top Destinations",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
                margin: EdgeInsets.only(top: 40, right: 20),
                child: Text("See All",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Theme.of(context).primaryColor)))
          ],
        ),
        Container(
          height: 300,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: hotels.length,
              itemBuilder: (BuildContext context, int index) {
                final destination = hotels[index];
                return GestureDetector(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) =>
                              DestinationScreen(destination: destination))),
                  child: Container(
                    width: 210,
                    margin: EdgeInsets.all(10),
                    child: Stack(
                      alignment: Alignment.topCenter,
                      children: [
                        Positioned(
                          bottom: 15,
                          child: Container(
                            height: 120,
                            width: 200,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '${destination.activities.length} '
                                    'Activities',
                                    style: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.w600,
                                        letterSpacing: 1),
                                  ),
                                  Text(destination.description)
                                ],
                              ),
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black26,
                                offset: Offset(
                                  0.0,
                                  0.2,
                                ),
                              ),
                            ],
                          ),
                          child: Stack(
                            children: [
                              Hero(
                                tag:destination.imageUrl,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Image(
                                    height: 180,
                                    width: 180,
                                    fit: BoxFit.cover,
                                    image: AssetImage(destination.imageUrl),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 10,
                                bottom: 10,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      destination.city,
                                      style: TextStyle(
                                          fontSize: 22,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white,
                                          letterSpacing: 1),
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
                                          destination.country,
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.white,
                                              letterSpacing: 1),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
              }),
        )
      ],
    );
  }
}
