import 'package:flutter/material.dart';
import 'package:netflix_clone/data.dart';
import 'package:dio/dio.dart';
import 'dart:convert';

class pfetch extends StatefulWidget {
  const pfetch({super.key});

  @override
  State<pfetch> createState() => _pfetchState();
}

class _pfetchState extends State<pfetch> {
   List<Data> practiceList = <Data>[];
   List<Data> _moviesData = <Data>[];
   String poster = " ";
   void getData() async{
         var dio = Dio();
        var response = await dio.get('https://deeppatel3399.github.io/Marvel-Flix-API/db.json');
        var zeta = jsonDecode(response.toString());
        // print(zeta["MARVELSTUDIOSORIGINALSMOVIES"][0]["data"][0]["poster"]);
        poster = zeta["MARVELSTUDIOSORIGINALSMOVIES"][0]["data"][4]["poster"];
   }
  
   Future<List<Data>> fetchData() async{
     var dio = Dio();
     final response = await dio.get('https://deeppatel3399.github.io/Marvel-Flix-API/db.json');
    
     var data = <Data>[];

     if(response.statusCode == 200){
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
          _moviesData.addAll(value);
          // _moviesData.addAll(value);
     })
     }
     );
    // TODO: implement initState
    super.initState();
     }
  @override
  Widget build(BuildContext context) {
    getData();
    // print(_moviesData[0]);
    return Scaffold(
      backgroundColor: Colors.black,
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
                // Padding(
                  //   padding: EdgeInsets.only(top: 20.0, right: 100.00),
                  //   child: Text(
                  //     "Continue watching for spark",
                  //     style: TextStyle(
                  //         color: Colors.white,
                  //         fontWeight: FontWeight.bold,
                  //         fontSize: 20.0),
                  //   ),
                  // ),
                //   Padding(
                //     padding: const EdgeInsets.only(top: 10.0),
                //     child: Row(
                //       children: [
                //         Padding(
                //           padding: const EdgeInsets.only(left: 15.0),
                //           child: SizedBox(
                //           width: 100.0,
                //           child: Column(
                //             children: [
                //               SizedBox(
                //                 height: 150.0,
                //                 width: 150.0,
                //                 child: Image.asset('images/mv2.jpg'),
                //               ),
                //               LinearProgressIndicator(
                //                 value: 50.0,
                //               ),
                //               Row(
                //                  mainAxisAlignment : MainAxisAlignment.spaceBetween,
                //                 children: [
                //                   IconButton(
                //                       onPressed: null,
                //                       icon: Image.asset(
                //                         "icons/info.png",
                //                         scale: 22.0,
                //                         color: Colors.white,
                //                       )),
                //                       IconButton(
                //                       onPressed: null,
                //                       icon: Image.asset(
                //                         "icons/more.png",
                //                         scale: 22.0,
                //                         color: Colors.white,
                //                       ))
                //                 ],
                //               )
                //             ],
                //           ),
                //       ),
                //         ),
                //         Padding(
                //         padding: const EdgeInsets.only(left: 15.0),
                //         child: SizedBox(
                //           width: 100.0,
                //           child: Column(
                //             children: [
                //               SizedBox(
                //                 height: 150.0,
                //                 width: 150.0,
                //                 child: Image.asset("images/mv2.jpg"),
                //               ),
                //               LinearProgressIndicator(
                //                 value: 50.0,
                //               ),
                //               Row(
                //                  mainAxisAlignment : MainAxisAlignment.spaceBetween,
                //                 children: [
                //                   IconButton(
                //                       onPressed: null,
                //                       icon: Image.asset(
                //                         "icons/info.png",
                //                         scale: 22.0,
                //                         color: Colors.white,
                //                       )),
                //                       IconButton(
                //                       onPressed: null,
                //                       icon: Image.asset(
                //                         "icons/more.png",
                //                         scale: 22.0,
                //                         color: Colors.white,
                //                       ))
                //                 ],
                //               )
                //             ],
                //           ),
                //         ),
                //       ),
                // ]),
                //   )
                // ,
            child: SizedBox(
              height: 400.0,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 20.0, right: 100.00),
                    child: Text(
                      "Continue watching for spark",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 15.0),
                          child: SizedBox(
                          width: 100.0,
                          child: Column(
                            children: [
                              SizedBox(
                                height: 150.0,
                                width: 150.0,
                                child: Image.network(poster,scale: 1.0,),
                              ),
                              LinearProgressIndicator(
                                value: 50.0,
                              ),
                              Row(
                                 mainAxisAlignment : MainAxisAlignment.spaceBetween,
                                children: [
                                  IconButton(
                                      onPressed: null,
                                      icon: Image.asset(
                                        "icons/info.png",
                                        scale: 22.0,
                                        color: Colors.white,
                                      )),
                                      IconButton(
                                      onPressed: null,
                                      icon: Image.asset(
                                        "icons/more.png",
                                        scale: 22.0,
                                        color: Colors.white,
                                      ))
                                ],
                              )
                            ],
                          ),
                      ),
                        ),
                        Padding(
                        padding: const EdgeInsets.only(left: 15.0),
                        child: SizedBox(
                          width: 100.0,
                          child: Column(
                            children: [
                              SizedBox(
                                height: 150.0,
                                width: 150.0,
                                child: Image.asset("images/mv2.jpg"),
                              ),
                              LinearProgressIndicator(
                                value: 50.0,
                              ),
                              Row(
                                 mainAxisAlignment : MainAxisAlignment.spaceBetween,
                                children: [
                                  IconButton(
                                      onPressed: null,
                                      icon: Image.asset(
                                        "icons/info.png",
                                        scale: 22.0,
                                        color: Colors.white,
                                      )),
                                      IconButton(
                                      onPressed: null,
                                      icon: Image.asset(
                                        "icons/more.png",
                                        scale: 22.0,
                                        color: Colors.white,
                                      ))
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                ]),
                  )
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 400.0,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 20.0, right: 200.00),
                    child: Text(
                      "popular on netflix",
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
                        return ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: _moviesData[0].marvelstudiosoriginalsmovies[0].data.length,
                          itemBuilder: ((_, index){
                               return Padding(
                                 padding: const EdgeInsets.all(8.0),
                                 child: SizedBox(
                                   width: 100.0,
                                   height: 100.0,
                                   child: Image.network(_moviesData[0].marvelstudiosoriginalsmovies[0].data[index].poster,scale: 1.0,),
                                 ),
                               );
                          } ));
                      }),
                  ))
                ],
              ),
            ),
          ),
          ],
              
        ),

    );
  }
}