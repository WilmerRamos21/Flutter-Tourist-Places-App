import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(const MyApp());
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const String appTitle = 'Flutter layout demo';
    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(title: const Text(appTitle)),
        body: const SingleChildScrollView(
          
          child: Column(
            children: [
              ImageSection(image: 'images/A1.jpeg'),
              TitleSection(name: 'Oeschinen Lake Campground', location: 'Kandersteg, Switzerland'),
              ButtonSection(mapsUrl:'https://maps.app.goo.gl/XzL8hJRqUmDREcxB9'),
              TextSection(description: 
                'Lake Oeschinen lies at the foot of the Blüemlisalp in the '
                'Bernese Alps. Situated 1,578 meters above sea level, it '
                'is one of the larger Alpine Lakes. A gondola ride from '
                'Kandersteg, followed by a half-hour walk through pastures '
                'and pine forest, leads you to the lake, which warms to 20 '
                'degrees Celsius in the summer. Activities enjoyed here '
                'include rowing, and riding the summer toboggan run.',
              ),

              ImageSection(image: 'images/Torre.jpeg'),
              TitleSection(name: 'Torre Eiffel ', location: 'París, Francia'),
              ButtonSection(mapsUrl:'https://maps.app.goo.gl/Uft2dcP1V1cg9zXc8'),
              TextSection(description: 'El símbolo indiscutible de la "Ciudad de la Luz" y una de las estructuras más visitadas del mundo.'),


              ImageSection(image: 'images/coliseo.jpeg'),
              TitleSection(name: 'Coliseo Romano', location: 'Roma, Italia'),
              ButtonSection(mapsUrl:'https://maps.app.goo.gl/VbqhVvnWhhZmAc9g8'),
              TextSection(description: 'El impresionante anfiteatro de la antigua Roma que transporta a los visitantes a la época de los gladiadores.'),


              ImageSection(image: 'images/basilica.jpeg'),
              TitleSection(name: 'Basílica de la Sagrada Familia', location: 'Barcelona, España'),
              ButtonSection(mapsUrl:'https://maps.app.goo.gl/SqLS8GRZqEG9tDts6'),
              TextSection(description: 'La obra maestra inacabada del arquitecto Antoni Gaudí, famosa por su arquitectura única y sus fachadas monumentales.'),
            


              ImageSection(image: 'images/museo.jpeg'),
              TitleSection(name: 'Museo del Louvre', location: 'París, Francia'),
              ButtonSection(mapsUrl:'https://maps.app.goo.gl/Wpb6kUmvVr3Wx6417'),
              TextSection(description: 'El museo de arte más grande del mundo, hogar de la Mona Lisa y la Venus de Milo.'),

            

              ImageSection(image: 'images/acropolis.jpeg'),
              TitleSection(name: 'Acrópolis', location: 'Atenas, Grecia'),
              ButtonSection(mapsUrl:'https://maps.app.goo.gl/LuHggwxpN3k9PxKu6'),
              TextSection(description: 'La obra maestra inacabada del arquitecto Antoni Gaudí, famosa por su arquitectura única y sus fachadas monumentales.'),




              ImageSection(image: 'images/bigben.jpeg'),
              TitleSection(name: 'Big Ben y el Parlamento', location: 'Londres, Reino Unido'),
              ButtonSection(mapsUrl:'https://maps.app.goo.gl/NdM8NmCGaq3ymbJN9'),
              TextSection(description: 'El icónico reloj y el corazón político a orillas del río Támesis.'),



              ImageSection(image: 'images/basilica1.jpeg'),
              TitleSection(name: 'Basílica de San Pedro', location: 'Ciudad del Vaticano'),
              ButtonSection(mapsUrl:'https://maps.app.goo.gl/fRjnaUnwprQwvXZj7'),
              TextSection(description: 'El centro espiritual del catolicismo y una joya del Renacimiento que alberga la cúpula de Miguel Ángel.'),

              ImageSection(image: 'images/lagobled.jpeg'),
              TitleSection(name: 'Lago Bled', location: 'Eslovenia'),
              ButtonSection(mapsUrl:'https://maps.app.goo.gl/j18pp4S5BHw7mCEq8'),
              TextSection(description: 'Un paisaje de cuento de hadas con un lago de aguas color esmeralda y una pequeña iglesia situada en una isla central.'),



              ImageSection(image: 'images/laguna.jpeg'),
              TitleSection(name: 'Laguna Azul', location: 'Comino, Malta'),
              ButtonSection(mapsUrl:'https://maps.app.goo.gl/Rir49McK21x6d6VQ9'),
              TextSection(description: 'Un rincón mediterráneo conocido por sus aguas cristalinas de un azul turquesa intenso y su fondo arenoso.'),
            ],
          ),
        ),
      ),
    );
  }
}

class TitleSection extends StatelessWidget {
  const TitleSection({super.key, required this.name, required this.location});

  final String name;
  final String location;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            /*1*/
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /*2*/
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    name,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Text(location, style: TextStyle(color: Colors.grey[500])),
              ],
            ),
          ),
          /*3*/
          Icon(Icons.home, color: Colors.red[500]),
          const Text('41'),
          const FavoriteWidget(),
        ],
      ),
    );
  }
}

class ButtonSection extends StatelessWidget {
  const ButtonSection({super.key, required this.mapsUrl});

  final String mapsUrl;

  Future<void> _openMap() async {
    final Uri url = Uri.parse(mapsUrl);

    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw Exception('No se pudo abrir Google Maps');
    }
  }

  @override
  Widget build(BuildContext context) {
    final Color color = Theme.of(context).primaryColor;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ButtonWithText(
          color: color,
          icon: Icons.call,
          label: 'CALL',
        ),
        GestureDetector(
          onTap: _openMap,
          child: ButtonWithText(
            color: color,
            icon: Icons.near_me,
            label: 'ROUTE',
          ),
        ),
        ButtonWithText(
          color: color,
          icon: Icons.share,
          label: 'SHARE',
        ),
      ],
    );
  }
}

class ButtonWithText extends StatelessWidget {
  const ButtonWithText({
    super.key,
    required this.color,
    required this.icon,
    required this.label,
  });

  final Color color;
  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ),
      ],
    );
  }
}
class TextSection extends StatelessWidget {
  const TextSection({super.key, required this.description});

  final String description;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: Text(description, softWrap: true),
    );
  }
}
class ImageSection extends StatelessWidget {
  const ImageSection({super.key, required this.image});

  final String image;

  @override
  Widget build(BuildContext context) {
    return Image.asset(image, width: 600, height: 240, fit: BoxFit.cover);
  }
}
class FavoriteWidget extends StatefulWidget {
  const FavoriteWidget({super.key});

  @override
  State<FavoriteWidget> createState() => _FavoriteWidgetState();
}
class _FavoriteWidgetState extends State<FavoriteWidget> {
  bool isFavorited = true;
  int favoriteCount = 41;
    @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.all(0),
          child: IconButton(
            padding: const EdgeInsets.all(0),
            alignment: Alignment.center,
            icon: (isFavorited
                ? const Icon(Icons.star)
                : const Icon(Icons.star_border)),
            color: Colors.red[500],
            onPressed: _toggleFavorite,
          ),
        ),
        SizedBox(width: 18, child: SizedBox(child: Text('$favoriteCount'))),
      ],
    );
  }
  void _toggleFavorite() {
  setState(() {
    if (isFavorited) {
      favoriteCount -= 1;
      isFavorited = false;
    } else {
      favoriteCount += 1;
      isFavorited = true;
    }
  });
}
}



