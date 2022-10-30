import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:custom_bottom_navigation_bar/custom_bottom_navigation_bar.dart';
import 'package:custom_bottom_navigation_bar/custom_bottom_navigation_bar_item.dart';
import 'package:dio/dio.dart';
import 'package:netflix_clone/Pages/mvDetails.dart';
import 'package:netflix_clone/data.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Data> practiceList = <Data>[];
  List<Data> _moviesData = <Data>[];
  void getData() async {
    var dio = Dio();
    var response = await dio
        .get('https://deeppatel3399.github.io/Marvel-Flix-API/db.json');
    var zeta = jsonDecode(response.toString());
    print(zeta["MARVELSTUDIOSORIGINALSMOVIES"][0]["data"][0]["title"]);
  }

  Future<List<Data>> fetchData() async {
    var dio = Dio();
    final response = await dio
        .get('https://deeppatel3399.github.io/Marvel-Flix-API/db.json');

    var data = <Data>[];

    if (response.statusCode == 200) {
      var fdata = jsonDecode(response.toString());
      setState(() {
        data.add(Data.fromJson(fdata));
      });
    }
    return data;
  }

  @override
  void initState() {
    fetchData().then((value) => {
          setState(() {
            // practiceList.addAll(value);
            _moviesData.addAll(value);
          })
        });
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // getData();
    int selecteditem = 0;
    PageController pageController = PageController();

    void routeTodetail(FoxstarmarvelDatum info){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: ((context) => mvDetails(info: info,))));
    }

    return Scaffold(
      backgroundColor: Colors.black,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: Colors.black,
            leading: Image.asset(
              'icons/netflix.png',
              scale: 22.0,
            ),
            actions: <Widget>[
              Padding(
                padding: const EdgeInsets.only(right: 15.0),
                child: MaterialButton(
                  onPressed: () {},
                  child: Text(
                    'TV shows',
                    style: TextStyle(color: Colors.white, fontSize: 18.0),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 15.0),
                child: MaterialButton(
                  onPressed: () {},
                  child: Text(
                    'Movies',
                    style: TextStyle(color: Colors.white, fontSize: 18.0),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 15.0),
                child: MaterialButton(
                  onPressed: () {},
                  child: Text(
                    'My List',
                    style: TextStyle(color: Colors.white, fontSize: 18.0),
                  ),
                ),
              ),
            ],
          ),
          SliverToBoxAdapter(
            child: Container(
              height: 200.0,
              child: Image.asset('images/daredevil.jpg',
              fit: BoxFit.cover,),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    MaterialButton(
                      onPressed: () {},
                      child: Column(
                        children: [
                          Image.asset(
                            'icons/add.png',
                            scale: 22.0,
                            color: Colors.white,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text(
                              'My List',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 18.0),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5)),
                      child: ElevatedButton.icon(
                          onPressed: null,
                          icon: Image.asset(
                            'icons/play.png',
                            scale: 22.0,
                          ),
                          label: Text(
                            'Play',
                            style:
                                TextStyle(color: Colors.black, fontSize: 18.0),
                          )),
                    ),
                    MaterialButton(
                      onPressed: () {},
                      child: Column(
                        children: [
                          Image.asset(
                            'icons/info.png',
                            scale: 22.0,
                            color: Colors.white,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text(
                              'info',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 18.0),
                            ),
                          )
                        ],
                      ),
                    ),
                  ]),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 215.0,
              child: Column(
                children: [
                  SizedBox(
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 20.0, right: 169.00),
                          child: Text(
                            "Marverl Original Movies",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0),
                          ),
                        ),
                        SizedBox(
                            height: 170.0,
                            child: FutureBuilder(
                              future: fetchData(),
                              builder: ((context, snapshot) {
                                if(_moviesData.length < 1){
                                    return Scaffold(
                                      backgroundColor: Colors.black,
                                          body: Center(
                                            child: LoadingAnimationWidget.halfTriangleDot(
                                            color: Color.fromARGB(255, 100, 100, 100),
                                            size: 40,
                                          ),
                                         ));
                                }else{
                                   return ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: 2,
                                    // _moviesData[0]
                                    //     .marvelstudiosoriginalsmovies[0]
                                    //     .data
                                    //     .length,
                                    itemBuilder: ((_, index) {
                                      return GestureDetector(
                                        onTap: null,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: SizedBox(
                                            width: 100.0,
                                            height: 100.0,
                                            
                                            child: Image.network(
                                              _moviesData[0]
                                                  .marvelstudiosoriginalsmovies[
                                                      0]
                                                  .data[index]
                                                  .poster,
                                              scale: 10.0,
                                            fit: BoxFit.cover,),
                                          ),
                                        ),
                                      );
                                    }));}
                              }),
                            ))
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
       // SliverToBoxAdapter(
          //   child: SizedBox(
          //     height: 215.0,
          //     child: Column(
          //       children: [
          //         SizedBox(
          //           child: Column(
          //             children: [
          //               Padding(
          //                 padding: EdgeInsets.only(top: 20.0, right: 200.00),
          //                 child: Text(
          //                   "All Marvel Movies",
          //                   style: TextStyle(
          //                       color: Colors.white,
          //                       fontWeight: FontWeight.bold,
          //                       fontSize: 20.0),
          //                 ),
          //               ),
          //               SizedBox(
          //                   height: 170.0,
          //                   child: FutureBuilder(
          //                     future: fetchData(),
          //                     builder: ((context, snapshot) {
          //                       if(_moviesData.length < 1){
          //                           return Scaffold(
          //                             backgroundColor: Colors.black,
          //                                 body: Center(
          //                                   child: LoadingAnimationWidget.halfTriangleDot(
          //                                   color: Color.fromARGB(255, 100, 100, 100),
          //                                   size: 40,
          //                                 ),
          //                                ));
          //                       }else{   
          //                       return ListView.builder(
          //                           scrollDirection: Axis.horizontal,
          //                           itemCount: _moviesData[0]
          //                               .movieslist[0]
          //                               .data
          //                               .length,
          //                           itemBuilder: ((_, index) {
          //                             return GestureDetector(
          //                               onTap: null,
          //                               child: Padding(
          //                                 padding: const EdgeInsets.all(8.0),
          //                                 child: SizedBox(
          //                                   width: 100.0,
          //                                   height: 100.0,
          //                                   child: Image.network(
          //                                     _moviesData[0]
          //                                         .movieslist[0]
          //                                         .data[index]
          //                                         .poster,
          //                                     scale: 1.0,
          //                                   ),
          //                                 ),
          //                               ),
          //                             );
          //                           }));}
          //                     })
          //                   ))
          //             ],
          //           ),
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
          // SliverToBoxAdapter(
          //   child: SizedBox(
          //     height: 215.0,
          //     child: Column(
          //       children: [
          //         SizedBox(
          //           child: Column(
          //             children: [
          //               Padding(
          //                 padding: EdgeInsets.only(top: 20.0, right: 230.00),
          //                 child: Text(
          //                   "Popular Movies",
          //                   style: TextStyle(
          //                       color: Colors.white,
          //                       fontWeight: FontWeight.bold,
          //                       fontSize: 20.0),
          //                 ),
          //               ),
          //               SizedBox(
          //                   height: 170.0,
          //                   child: FutureBuilder(
          //                     future: fetchData(),
          //                     builder: ((context, snapshot) {
          //                       if(_moviesData.length < 1){
          //                           return Scaffold(
          //                             backgroundColor: Colors.black,
          //                                 body: Center(
          //                                   child: LoadingAnimationWidget.halfTriangleDot(
          //                                   color: Color.fromARGB(255, 100, 100, 100),
          //                                   size: 40,
          //                                 ),
          //                                ));
          //                       }else{
          //                           return ListView.builder(
          //                           scrollDirection: Axis.horizontal,
          //                           itemCount: _moviesData[0]
          //                               .popularmovies[0]
          //                               .data
          //                               .length,
          //                           itemBuilder: ((_, index) {
          //                             return GestureDetector(
          //                               onTap: null,
          //                               child: Padding(
          //                                 padding: const EdgeInsets.all(8.0),
          //                                 child: SizedBox(
          //                                   width: 100.0,
          //                                   height: 100.0,
          //                                   child: Image.network(
          //                                     _moviesData[0]
          //                                         .popularmovies[0]
          //                                         .data[index]
          //                                         .poster,
          //                                     scale: 1.0,
          //                                   ),
          //                                 ),
          //                               ),
          //                             );
          //                           }));}
          //                     }),
          //                   ))
          //             ],
          //           ),
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 215.0,
              child: Column(
                children: [
                  SizedBox(
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 20.0, right: 180.00),
                          child: Text(
                            "Sony X Marvel Movies",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0),
                          ),
                        ),
                        SizedBox(
                            height: 170.0,
                            child: FutureBuilder(
                              future: fetchData(),
                              builder: ((context, snapshot) {
                                if(_moviesData.length < 1){
                                    return Scaffold(
                                      backgroundColor: Colors.black,
                                          body: Center(
                                            child: LoadingAnimationWidget.halfTriangleDot(
                                            color: Color.fromARGB(255, 100, 100, 100),
                                            size: 40,
                                          ),
                                         ));
                                }else{
                                return ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount:2,
                                    // _moviesData[0]
                                    //     .sonymarvel[0]
                                    //     .data
                                    //     .length,
                                    itemBuilder: ((_, index) {
                                      return GestureDetector(
                                        onTap: () => routeTodetail( _moviesData[0]
                                                  .sonymarvel[0]
                                                  .data[index]),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: SizedBox(
                                            width: 100.0,
                                            height: 100.0,
                                            child: Image.network(
                                              _moviesData[0]
                                                  .sonymarvel[0]
                                                  .data[index]
                                                  .poster,
                                              scale: 1.0,
                                            ),
                                          ),
                                        ),
                                      );
                                    }));}
                              }),
                            ))
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          // SliverToBoxAdapter(
          //   child: SizedBox(
          //     height: 215.0,
          //     child: Column(
          //       children: [
          //         SizedBox(
          //           child: Column(
          //             children: [
          //               Padding(
          //                 padding: EdgeInsets.only(top: 20.0, right: 200.00),
          //                 child: Text(
          //                   "All Marvel Series",
          //                   style: TextStyle(
          //                       color: Colors.white,
          //                       fontWeight: FontWeight.bold,
          //                       fontSize: 20.0),
          //                 ),
          //               ),
          //               SizedBox(
          //                   height: 170.0,
          //                   child: FutureBuilder(
          //                     future: fetchData(),
          //                     builder: ((context, snapshot) {
          //                       if(_moviesData.length < 1){
          //                           return Scaffold(
          //                             backgroundColor: Colors.black,
          //                                 body: Center(
          //                                   child: LoadingAnimationWidget.halfTriangleDot(
          //                                   color: Color.fromARGB(255, 100, 100, 100),
          //                                   size: 40,
          //                                 ),
          //                                ));
          //                       }else{
          //                       return ListView.builder(
          //                           scrollDirection: Axis.horizontal,
          //                           itemCount: _moviesData[0]
          //                               .serieslist[0]
          //                               .data
          //                               .length,
          //                           itemBuilder: ((_, index) {
          //                             return GestureDetector(
          //                               onTap: null,
          //                               child: Padding(
          //                                 padding: const EdgeInsets.all(8.0),
          //                                 child: SizedBox(
          //                                   width: 100.0,
          //                                   height: 100.0,
          //                                   child: Image.network(
          //                                     _moviesData[0]
          //                                         .serieslist[0]
          //                                         .data[index]
          //                                         .poster,
          //                                     scale: 1.0,
          //                                   ),
          //                                 ),
          //                               ),
          //                             );
          //                           }));}
          //                     }),
          //                   ))
          //             ],
          //           ),
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
          // SliverToBoxAdapter(
          //   child: SizedBox(
          //     height: 215.0,
          //     child: Column(
          //       children: [
          //         SizedBox(
          //           child: Column(
          //             children: [
          //               Padding(
          //                 padding: EdgeInsets.only(top: 20.0, right: 230.00),
          //                 child: Text(
          //                   "Popular Series",
          //                   style: TextStyle(
          //                       color: Colors.white,
          //                       fontWeight: FontWeight.bold,
          //                       fontSize: 20.0),
          //                 ),
          //               ),
          //               SizedBox(
          //                   height: 170.0,
          //                   child: FutureBuilder(
          //                     future: fetchData(),
          //                     builder: ((context, snapshot) {
          //                       if(_moviesData.length < 1){
          //                           return Scaffold(
          //                             backgroundColor: Colors.black,
          //                                 body: Center(
          //                                   child: LoadingAnimationWidget.halfTriangleDot(
          //                                   color: Color.fromARGB(255, 100, 100, 100),
          //                                   size: 40,
          //                                 ),
          //                                ));
          //                       }else{
          //                       return ListView.builder(
          //                           scrollDirection: Axis.horizontal,
          //                           itemCount: _moviesData[0]
          //                               .popularseries[0]
          //                               .data
          //                               .length,
          //                           itemBuilder: ((_, index) {
          //                             return GestureDetector(
          //                               onTap: null,
          //                               child: Padding(
          //                                 padding: const EdgeInsets.all(8.0),
          //                                 child: SizedBox(
          //                                   width: 100.0,
          //                                   height: 100.0,
          //                                   child: Image.network(
          //                                     _moviesData[0]
          //                                         .popularseries[0]
          //                                         .data[index]
          //                                         .poster,
          //                                     scale: 1.0,
          //                                   ),
          //                                 ),
          //                               ),
          //                             );
          //                           }));}
          //                     }),
          //                   ))
          //             ],
          //           ),
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
          // SliverToBoxAdapter(
          //   child: SizedBox(
          //     height: 215.0,
          //     child: Column(
          //       children: [
          //         SizedBox(
          //           child: Column(
          //             children: [
          //               Padding(
          //                 padding: EdgeInsets.only(top: 20.0, right: 169.00),
          //                 child: Text(
          //                   "FoxStar Marvel Series",
          //                   style: TextStyle(
          //                       color: Colors.white,
          //                       fontWeight: FontWeight.bold,
          //                       fontSize: 20.0),
          //                 ),
          //               ),
          //               SizedBox(
          //                   height: 170.0,
          //                   child: FutureBuilder(
          //                     future: fetchData(),
          //                     builder: ((context, snapshot) {
          //                       if(_moviesData.length < 1){
          //                           return Scaffold(
          //                             backgroundColor: Colors.black,
          //                                 body: Center(
          //                                   child: LoadingAnimationWidget.halfTriangleDot(
          //                                   color: Color.fromARGB(255, 100, 100, 100),
          //                                   size: 40,
          //                                 ),
          //                                ));
          //                       }else{
          //                       return ListView.builder(
          //                           scrollDirection: Axis.horizontal,
          //                           itemCount: _moviesData[0]
          //                               .foxstarmarvel[0]
          //                               .data
          //                               .length,
          //                           itemBuilder: ((_, index) {
          //                             return GestureDetector(
          //                               onTap: null,
          //                               child: Padding(
          //                                 padding: const EdgeInsets.all(8.0),
          //                                 child: SizedBox(
          //                                   width: 100.0,
          //                                   height: 100.0,
          //                                   child: Image.network(
          //                                     _moviesData[0]
          //                                         .foxstarmarvel[0]
          //                                         .data[index]
          //                                         .poster,
          //                                     scale: 1.0,
          //                                   ),
          //                                 ),
          //                               ),
          //                             );
          //                           }));}
          //                     }),
          //                   ))
          //             ],
          //           ),
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
          // SliverToBoxAdapter(
            // child: SizedBox(
            //   height: 215.0,
            //   child: Column(
            //     children: [
            //       SizedBox(
            //         child: Column(
            //           children: [
            //             Padding(
            //               padding: EdgeInsets.only(top: 20.0, right: 240.00),
            //               child: Text(
            //                 "Marvel Lovers",
            //                 style: TextStyle(
            //                     color: Colors.white,
            //                     fontWeight: FontWeight.bold,
            //                     fontSize: 20.0),
            //               ),
            //             ),
            //             SizedBox(
            //                 height: 170.0,
            //                 child: FutureBuilder(
            //                   future: fetchData(),
            //                   builder: ((context, snapshot) {
            //                     if(_moviesData.length < 1){
            //                         return Scaffold(
            //                           backgroundColor: Colors.black,
            //                               body: Center(
            //                                 child: LoadingAnimationWidget.halfTriangleDot(
            //                                 color: Color.fromARGB(255, 100, 100, 100),
            //                                 size: 40,
            //                               ),
            //                              ));
            //                     }else{
            //                     return ListView.builder(
            //                         scrollDirection: Axis.horizontal,
            //                         itemCount:
            //                             _moviesData[0].others[0].data.length,
            //                         itemBuilder: ((_, index) {
            //                           return GestureDetector(
            //                             onTap: null,
            //                             child: Padding(
            //                               padding: const EdgeInsets.all(8.0),
            //                               child: SizedBox(
            //                                 width: 100.0,
            //                                 height: 100.0,
            //                                 child: Image.network(
            //                                   _moviesData[0]
            //                                       .others[0]
            //                                       .data[index]
            //                                       .poster,
            //                                   scale: 1.0,
            //                                 ),
            //                               ),
            //                             ),
            //                           );
            //                         }));}
            //                   }),
            //                 ))
            //           ],
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
          // ),
        ],
      ),
    );
  }
}
