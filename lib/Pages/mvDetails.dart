import 'package:flutter/material.dart';
import 'package:netflix_clone/Pages/Homepage.dart';
import 'package:netflix_clone/Widget/video.dart';
import 'package:netflix_clone/data.dart';
import 'package:netflix_clone/main.dart';

class mvDetails extends StatefulWidget {
  final FoxstarmarvelDatum info;
  mvDetails({required this.info});
  @override
  State<mvDetails> createState() => _mvDetailsState();
}

class _mvDetailsState extends State<mvDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              flexibleSpace: FlexibleSpaceBar(
                background: Container(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 50.0),
                          child: SizedBox(
                            height: 250.0,
                            width: 150,
                            child: Image.network(widget.info.poster),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              widget.info.rating,
                              style: TextStyle(color: Colors.white54),
                            ),
                            Text(
                              widget.info.releaseDate,
                              style: TextStyle(color: Colors.white54),
                            )
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 25.0),
                          child: Container(
                            height: 35,
                            width: 400.0,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5)),
                            child: ElevatedButton.icon(
                              onPressed: (() {
                                Navigator.pushReplacement(context, MaterialPageRoute(
                                  builder: ((context) => VideoPlayer()))
                                );}
                                )
                              ,
                              icon: Icon(
                                Icons.play_arrow_rounded,
                                color: Colors.black,
                                size: 34,
                              ),
                              label: Text(
                                'Play',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 18),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: Container(
                            height: 35,
                            width: 400.0,
                            decoration: BoxDecoration(
                                color: Colors.grey.shade300.withOpacity(0.4),
                                borderRadius: BorderRadius.circular(5)),
                            child: ElevatedButton.icon(
                              onPressed: null,
                              icon: Icon(
                                Icons.download,
                                color: Colors.white,
                                size: 34,
                              ),
                              label: Text(
                                'Download',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top:18.0,left: 8.0,right: 8.0),
                          child: Container(
                            height: 70.0,
                            child: Text(
                              widget.info.overview,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(widget.info.poster),
                            fit: BoxFit.cover,
                            colorFilter: ColorFilter.mode(
                                Colors.black87, BlendMode.darken)))),
              ),
              expandedHeight: 600.0,
              leading: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: ((context) => Main())));
                },
              ),
            )
          ],
        ));
  }
}
