import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:parctica6_app_memory/provider/game-provider.dart';
import 'package:parctica6_app_memory/shared/shared-constants.dart';
import 'package:provider/provider.dart';

class GameCardDetails extends StatefulWidget {
  const GameCardDetails({super.key});

  @override
  State<GameCardDetails> createState() => _GameCardDetailsState();
}

class _GameCardDetailsState extends State<GameCardDetails> {
  @override
  Widget build(BuildContext context) {
    final gameProvider = Provider.of<GameProvider>(context, listen: false);

    Map<String, dynamic> dataCardDetailsById =
        gameProvider.objectsGridGame[gameProvider.detailsCard];

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            dataCardDetailsById['name'],
            style: SharedConstants.getItimFontGoogle
                .copyWith(fontSize: 25, fontWeight: FontWeight.bold, color: SharedConstants.colorGreyText),
          ),
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          centerTitle: true,
          leadingWidth: 40,
          leading: CircleAvatar(
            backgroundColor: Colors.white,
            child: IconButton(
              icon: Icon(
                Icons.arrow_back_ios_new,
                size: 25,
                color: SharedConstants.colorGrey,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              splashColor: Colors.white,
            ),
          ),
          actions: [
            CircleAvatar(
              backgroundColor: Colors.white,
              child: IconButton(
                icon: Icon(
                  Icons.share,
                  size: 25,
                  color: SharedConstants.colorGrey,
                ),
                onPressed: () {},
                splashColor: Colors.white,
              ),
            )
          ],
        ),
        bottomNavigationBar: bottomBar(),
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              pinned: false,
              snap: true,
              floating: true,
              expandedHeight: 250.0,
              automaticallyImplyLeading: false, // remove back button
              backgroundColor: SharedConstants.colorPink,
              flexibleSpace:
                  FlexibleSpaceBar(background: _carouselImagen(context)),
            ),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  ListTile(
                    title: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(dataCardDetailsById['title'],
                            textAlign: TextAlign.start,
                            style: SharedConstants.getItimFontGoogle.copyWith(
                                fontSize: 26, fontWeight: FontWeight.bold, color: SharedConstants.colorGreyText))
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    height: 1,
                    color: Colors.grey,
                  ),
                  ListTile(
                    title: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(dataCardDetailsById['description'],
                            textAlign: TextAlign.justify,
                            style: SharedConstants.getEx2FontGoogle
                                .copyWith(fontSize: 18)),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 15, right: 15, top: 20),
                    height: 1,
                    color: Colors.grey,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

// imagen a mostrar
  Widget _carouselImagen(context) {
    return ListView(
      children: [
        CarouselSlider(
          items: [
//1st Image of Slider
            Container(
              margin: EdgeInsets.all(6.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                image: DecorationImage(
                  image: NetworkImage(
                      "https://m.atcdn.co.uk/a/media/w800h600/7692b807f5cd4ed48afcbd298f68397f.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
            ),

//2nd Image of Slider
            Container(
              margin: EdgeInsets.all(6.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                image: DecorationImage(
                  image: NetworkImage(
                      "https://m.atcdn.co.uk/a/media/w800h600/52c3be39c6074cc3ba6008b3f2c874f7.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
            ),

//3rd Image of Slider
            Container(
              margin: EdgeInsets.all(6.0),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 90, 0, 245),
                borderRadius: BorderRadius.circular(8.0),
                image: DecorationImage(
                  image: NetworkImage(
                      "https://m.atcdn.co.uk/a/media/w800h600/c193cf8a98ed4070b742d9a9b69fcb7f.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
            ),

//4th Image of Slider
            Container(
              margin: EdgeInsets.all(6.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                image: DecorationImage(
                  image: NetworkImage(
                      "https://m.atcdn.co.uk/a/media/w800h600/b717c861f83848558124e54b9b6d51b9.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
            ),

//5th Image of Slider
            Container(
              margin: EdgeInsets.all(6.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                image: DecorationImage(
                  image: NetworkImage(
                      "https://m.atcdn.co.uk/a/media/w800h600/35a8a8685d664d33a8ae59d14793fa4f.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],

//Slider Container properties
          options: CarouselOptions(
            height: 250.0,
            enlargeCenterPage: true,
            aspectRatio: 16 / 10,
            autoPlayCurve: Curves.fastOutSlowIn,
            enableInfiniteScroll: true,
            viewportFraction: 1.2,
          ),
        ),
      ],
    );
  }

  Widget bottomBar() {
    return BottomAppBar(
        color: Color.fromARGB(255, 161, 14, 241),
        shape: CircularNotchedRectangle(),
        child: Container(
            height: 70,
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      IconButton(
                          icon: Icon(
                            Icons.call,
                            size: 30,
                            color: Colors.white70,
                          ),
                          onPressed: () {}),
                      Text('Call seller')
                    ],
                  ),

                  Column(
                    children: [
                      IconButton(
                          icon:
                              Icon(Icons.chat, size: 30, color: Colors.white70),
                          onPressed: () {}),
                      Text('Text seller')
                    ],
                  ),
// button 1
                ])));
  }
}
