import 'package:burger/model/mcd_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:burger/model/mcd_place.dart';

var informationTextStyle = const TextStyle(fontFamily: 'Oxygen');

class DetailScreen extends StatelessWidget {
  final McdPlace place;

  DetailScreen({required this.place});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      if (constraints.maxWidth > 800) {
        return DetailWebPage(place: place);
      } else {
        return DetailMobilePage(place: place);
      }
    });
  }
}

class DetailMobilePage extends StatelessWidget {
  final McdPlace place;

  const DetailMobilePage({required this.place});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Stack(children: <Widget>[
              Image.asset(place.imageBanner),
              SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        child: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(Icons.arrow_back),
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ]),
            Container(
              margin: const EdgeInsets.only(top: 16.0),
              child: Text(
                place.name,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 30.0, fontFamily: 'Staatliches'),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Icon(Icons.calendar_today),
                      SizedBox(height: 8.0),
                      Text(
                        place.openDay,
                        style: informationTextStyle,
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Icon(Icons.access_time),
                      SizedBox(height: 8.0),
                      Text(place.openTime, style: informationTextStyle),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Icon(Icons.star_rate),
                      SizedBox(height: 8.0),
                      Text(
                        place.rating,
                        style: informationTextStyle,
                      ),
                    ],
                  )
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.all(8.0),
              child: Text(
                'Menu',
                textAlign: TextAlign.start,
                style: TextStyle(fontSize: 20.0, fontFamily: 'Oswald'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 500,
                width: 600,
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  children: mcdMenuList.map((menu) {
                    return InkWell(
                      onTap: () {},
                      child: Card(
                        margin: const EdgeInsets.only(bottom: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Image.network(
                                menu.imageAsset,
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(height: 8),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                menu.name,
                                style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Row(
                              children: <Widget>[
                                Padding(padding: const EdgeInsets.all(8.0)),
                                SizedBox(height: 8.0),
                                Text(
                                  menu.price,
                                  style: informationTextStyle,
                                ),
                                FavoriteButton(),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DetailWebPage extends StatefulWidget {
  final McdPlace place;

  DetailWebPage({required this.place});

  @override
  State<DetailWebPage> createState() => _DetailWebPageState();
}

class _DetailWebPageState extends State<DetailWebPage> {
  final _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 16,
          horizontal: 64,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                "Menu McDonald's",
                style: TextStyle(
                  fontFamily: 'Staatliches',
                  fontSize: 32,
                ),
              ),
              SizedBox(height: 32),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Column(
                          children: [
                            ClipRRect(
                              child: Image.network(widget.place.imageBanner),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            SizedBox(height: 16),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 32),
                  Expanded(
                    child: Card(
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          children: <Widget>[
                            Container(
                              child: Text(
                                widget.place.name,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 30.0,
                                  fontFamily: 'Staatliches',
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: <Widget>[
                                    Icon(Icons.calendar_today),
                                    SizedBox(width: 8.0),
                                    Text(
                                      widget.place.openDay,
                                      style: informationTextStyle,
                                    ),
                                  ],
                                ),
                                FavoriteButton(),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Icon(Icons.access_time),
                                SizedBox(
                                  width: 8.0,
                                ),
                                Text(
                                  widget.place.openTime,
                                  style: informationTextStyle,
                                ),
                              ],
                            ),
                            SizedBox(height: 8),
                            Row(
                              children: <Widget>[
                                Icon(Icons.star_rate),
                                SizedBox(width: 8.0),
                                Text(
                                  widget.place.rating,
                                  style: informationTextStyle,
                                ),
                              ],
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(vertical: 16.0),
                              child: Text(
                                widget.place.description,
                                textAlign: TextAlign.justify,
                                style: TextStyle(
                                  fontSize: 16.0,
                                  fontFamily: 'Oxygen',
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}

class FavoriteButton extends StatefulWidget {
  @override
  _FavoriteButtonState createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          setState(() {
            isFavorite = !isFavorite;
          });
        },
        icon: Icon(
          isFavorite ? Icons.favorite : Icons.favorite_border,
          color: Colors.red,
        ));
  }
}
