import 'package:flutter/material.dart';
import 'package:filem/detail_screen.dart';
import 'package:filem/model/movie.dart';
import 'package:carousel_slider/carousel_slider.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: new ThemeData(scaffoldBackgroundColor: const Color(0xFF151C24)),
      home: new Scaffold(
        appBar: AppBar(
          title: Text('Filem Indonesia'),
        ),
        body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            if (constraints.maxWidth <= 600) {
              return TourismPlaceList();
            } else {
              return TourismPlaceGrid();
            }
          },
        ),
      ),
    );
    ;
  }
}

class TourismPlaceList extends StatelessWidget {

  Widget movieList(List<Movie> movies) => Container(
        height: 250,
        child: ListView.builder(
          itemCount: popularMovie.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return DetailScreen(movie: movies[index]);
                }));
              },
              child: Container(
                  width: 130,
                  margin: EdgeInsets.all(2.0),
                  child: Column(
                    children: <Widget>[
                      Container(
                        child: Image.network(
                          movies[index].posterPath,
                          fit: BoxFit.cover,
                          height: 180,
                        ),
                      ),
                      Text('${movies[index].originalTitle}',
                          style: TextStyle(fontSize: 16.0, color: Colors.white),
                          textAlign: TextAlign.start,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis),
                    ],
                  )),
            );
          },
        ),
      );

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Column(
            children: [
              CarouselSlider(
                options: CarouselOptions(
                  height: 350.0,
                  autoPlay: true,
                  enlargeCenterPage: true,
                  aspectRatio: 2.0,
                  viewportFraction: 0.7,
                ),
                items: newestMovie.map((i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                                return DetailScreen(movie: i);
                              }));
                        },
                        child: Stack(
                          children: <Widget>[
                            Container(
                              width: MediaQuery.of(context).size.width,
                              margin: EdgeInsets.symmetric(horizontal: 5.0),
                              child: Image.network(
                                i.posterPath,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                    height: 150,
                                    decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                            begin: Alignment.topCenter,
                                            end: Alignment.bottomCenter,
                                            colors: [
                                              Colors.transparent,
                                              const Color(0xFF151C24)
                                            ]))),
                              ],
                            ),
                            Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Container(
                                      child: Text(
                                        i.originalTitle,
                                        style: TextStyle(
                                          fontSize: 30.0,
                                          color: Colors.white,
                                          fontFamily: 'Staatliches',
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ],
                                )),
                          ],
                        ),
                      );
                    },
                  );
                }).toList(),
              )
            ],
          ),
          Container(
              padding: EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "FILM POPULER",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16.0, color: Colors.grey),
                  ),
                ],
              )
          ),
          movieList(popularMovie),
          Container(
            height: 320,
            child: DefaultTabController(
              length: 3,
              child: Scaffold(
                appBar: TabBar(
                  tabs: [
                    Tab(
                      text: "Action",
                    ),
                    Tab(
                      text: "Comedy",
                    ),
                    Tab(
                      text: "Romance",
                    ),
                  ],
                ),
                body: TabBarView(
                  children: [
                    movieList(actionMovie),
                    movieList(comedyMovie),
                    movieList(romanceMovie)
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TourismPlaceGrid extends StatelessWidget {

  Widget movieList(List<Movie> movies) => Container(
    height: 250,
    child: ListView.builder(
      itemCount: popularMovie.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return DetailScreen(movie: movies[index]);
            }));
          },
          child: Container(
              width: 130,
              margin: EdgeInsets.all(2.0),
              child: Column(
                children: <Widget>[
                  Container(
                    child: Image.network(
                      movies[index].posterPath,
                      fit: BoxFit.cover,
                      height: 180,
                    ),
                  ),
                  Text('${movies[index].originalTitle}',
                      style: TextStyle(fontSize: 16.0, color: Colors.white),
                      textAlign: TextAlign.start,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis),
                ],
              )),
        );
      },
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scrollbar(child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Column(
            children: [
              CarouselSlider(
                options: CarouselOptions(
                    height: 600.0,
                    autoPlay: true,
                    viewportFraction: 0.4,
                    enlargeCenterPage: true,
                    aspectRatio: 2.0,
                    initialPage: 2
                ),
                items: newestMovie.map((i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                                return DetailScreen(movie: i);
                              }));
                        },
                        child: Stack(
                          children: <Widget>[
                            Container(
                              width: MediaQuery.of(context).size.width,
                              margin: EdgeInsets.symmetric(horizontal: 5.0),
                              child: Image.network(
                                i.posterPath,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                    height: 150,
                                    decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                            begin: Alignment.topCenter,
                                            end: Alignment.bottomCenter,
                                            colors: [
                                              Colors.transparent,
                                              const Color(0xFF151C24)
                                            ]))),
                              ],
                            ),
                            Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Container(
                                      child: Text(
                                        i.originalTitle,
                                        style: TextStyle(
                                          fontSize: 30.0,
                                          color: Colors.white,
                                          fontFamily: 'Staatliches',
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ],
                                )),
                          ],
                        ),
                      );
                    },
                  );
                }).toList(),
              )
            ],
          ),
          Container(
              padding: EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "FILM POPULER",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16.0, color: Colors.grey),
                  ),
                ],
              )
          ),
          movieList(popularMovie),
          Container(
            height: 320,
            child: DefaultTabController(
              length: 3,
              child: Scaffold(
                appBar: TabBar(
                  tabs: [
                    Tab(
                      text: "Action",
                    ),
                    Tab(
                      text: "Comedy",
                    ),
                    Tab(
                      text: "Romance",
                    ),
                  ],
                ),
                body: TabBarView(
                  children: [
                    movieList(actionMovie),
                    movieList(comedyMovie),
                    movieList(romanceMovie)
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
