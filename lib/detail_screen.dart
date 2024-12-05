import 'package:flutter/material.dart';
import 'package:welcome_bandung/model/tourism_place.dart';

var informationTextStyle = const TextStyle(fontFamily: 'Roboto');

class DetailScreen extends StatelessWidget {

  final TourismPlace place;

  const DetailScreen({super.key, required this.place});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth > 800) {
          return DetailWebPage(place: place);
        } else {
          return DetailMobilePage(place: place);
        }
      },
    );
  }
}

class DetailMobilePage extends StatelessWidget {

  final TourismPlace place;

  const DetailMobilePage({Key? key, required this.place});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    Image.asset(place.imageAsset),
                    SafeArea(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.grey,
                              child: IconButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  icon: const Icon(
                                      Icons.arrow_back, color: Colors.white)
                              ),
                            ),
                            const FavoriteButton()
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10.0),
                  child: Text(
                    place.name,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: 'Sansita',
                        fontSize: 30.0
                    ),
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
                          SizedBox(height: 4.0),
                          Text(
                              place.openDays,
                              style: informationTextStyle
                          )
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          Icon(Icons.access_time),
                          SizedBox(height: 4.0),
                          Text(
                              place.openTime,
                              style: informationTextStyle)
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          Icon(Icons.monetization_on),
                          SizedBox(height: 4.0),
                          Text(
                              place.ticketPrice,
                              style: informationTextStyle)
                        ],
                      )
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    place.description,
                    textAlign: TextAlign.center,
                    style: informationTextStyle,
                  ),
                ),
                SizedBox(
                    height: 225,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: place.imageUrls.map((url) {
                        return Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Image.network(url),
                            )
                        );
                      }).toList(),
                    ))
              ],
            ),
          )
      ),
    );
  }
}

class DetailWebPage extends StatelessWidget {
  final TourismPlace place;

  const DetailWebPage({Key? key, required this.place});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.symmetric(
              vertical: 16, horizontal: 64
          ),
          child: SingleChildScrollView(
            child: Center(
              child: SizedBox(
                width: 1200,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Bandung Travel',
                      style: TextStyle(
                          fontFamily: 'Sansita',
                          fontSize: 33
                      ),
                    ),
                    const SizedBox(height: 32),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              ClipRRect(
                                child: Image.asset(place.imageAsset),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              const SizedBox(height: 16),
                              //This Container should be inside the ScrollBar
                              Container(
                                height: 150,
                                padding: const EdgeInsets.only(bottom: 16),
                                child: ListView(
                                  scrollDirection: Axis.horizontal,
                                  children: place.imageUrls.map((url) {
                                    return Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Image.network(url),
                                      ),
                                    );
                                  }).toList(),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 32),
                        Expanded(
                          child: Card(
                            child: Container(
                              padding: const EdgeInsets.all(16),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  Container(
                                    child: Text(
                                      place.name,
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                        fontSize: 30.0,
                                        fontFamily: 'Sansita',
                                      ),
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: <Widget>[
                                          const Icon(Icons.calendar_today),
                                          const SizedBox(width: 8.0),
                                          Text(
                                            place.openDays,
                                            style: informationTextStyle,
                                          ),
                                        ],
                                      ),
                                      const FavoriteButton(),
                                    ],
                                  ),
                                  Row(
                                    children: <Widget>[
                                      const Icon(Icons.access_time),
                                      const SizedBox(width: 8.0),
                                      Text(
                                        place.openTime,
                                        style: informationTextStyle,
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 8.0),
                                  Row(
                                    children: <Widget>[
                                      const Icon(Icons.monetization_on),
                                      const SizedBox(width: 8.0),
                                      Text(
                                        place.ticketPrice,
                                        style: informationTextStyle,
                                      ),
                                    ],
                                  ),
                                  Container(
                                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                                    child: Text(
                                      place.description,
                                      textAlign: TextAlign.justify,
                                      style: const TextStyle(
                                        fontSize: 16.0,
                                        fontFamily: 'Roboto',
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )
          )
      )
    );
  }

}

class FavoriteButton extends StatefulWidget {
  const FavoriteButton({Key? key}): super(key: key);

  @override
  _FavoriteButtonState createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {

  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return IconButton(onPressed: () {
      setState(() {
        isFavorite = !isFavorite;

      });
    }, icon: Icon(
      isFavorite ? Icons.favorite : Icons.favorite_border,
      color: Colors.red,
    ));
  }
}