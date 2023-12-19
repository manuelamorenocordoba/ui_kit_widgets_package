part of 'ui_kit_inparty.dart';

class CardsScreen extends StatelessWidget {

  static const String name = 'cards_screen';

  const CardsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cards Screen'),
      ),
      body: const Text(''),
    );
  }
}


class CustomCard extends StatelessWidget {

  final Widget child;
  final double width;
  final double height;
  final Color cardColor;
  final Color cardShadowColor;

  const CustomCard({
    super.key,
    required this.child,
    this.width = 250,
    this.height = 165,
    this.cardColor = Colors.white,
    this.cardShadowColor = const Color.fromARGB(150, 219, 239, 190),
  });
  
  @override
  Widget build(BuildContext context) {

    return SizedBox(
      width: width,
      height: height,
      child: Card(
        shadowColor: cardShadowColor,
        elevation: 10.0,
        child: Container(
          padding:  const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.background,
            borderRadius: BorderRadius.circular(15.0),
            boxShadow: [
              BoxShadow(
                color: cardShadowColor,
                blurRadius: 10.0,
                spreadRadius: .5,
                offset: const Offset(0.1, 0.5)
              )
            ]
          ),
          child: child,
        ),
      ),
    );
  }
}

class ParentWidgetCard extends StatefulWidget {
  @override
  _ParentWidgetCardState createState() => _ParentWidgetCardState();
}

class _ParentWidgetCardState extends State<ParentWidgetCard> {
  @override
  Widget build(BuildContext context) {
    return const CustomCard(
      child: Column(
        children: <Widget>[
          Text('Texto de la tarjeta'),
          Icon(Icons.star),
        ],
      ),
    );
  }
}

class AlertCustomCard extends StatelessWidget {

  final Widget child;
  final double width;
  final double height;
  final Color? cardColor;
  final Color cardShadowColor;

  const AlertCustomCard({
    super.key,
    required this.child,
    this.width = 250,
    this.height = 165,
    this.cardColor,
    this.cardShadowColor = const Color.fromARGB(45, 251, 70, 15),
  });
  
  @override
  Widget build(BuildContext context) {

    return SizedBox(
      width: width,
      height: height,
      child: Card(
        shadowColor: cardShadowColor,
        elevation: 10.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
          side: Theme.of(context).brightness == Brightness.dark 
            ? const BorderSide(color: Colors.white, width: .0) 
            : BorderSide.none,
        ),
        child: Container(
          padding:  const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.background,
            borderRadius: BorderRadius.circular(15.0),
            boxShadow: [
              BoxShadow(
                color: cardShadowColor,
                blurRadius: 10.0,
                spreadRadius: .5,
                offset: const Offset(0.9, 0.5)
              )
            ]
          ),
          child: child,
        ),
      ),
    );
  }
}

class ParentWidgetAlertCard extends StatefulWidget {
  @override
  _ParentWidgetAlertCardState createState() => _ParentWidgetAlertCardState();
}

class _ParentWidgetAlertCardState extends State<ParentWidgetAlertCard> {
  @override
  Widget build(BuildContext context) {
    return const AlertCustomCard(
      child: Column(
        children: <Widget>[
          Text('Tarjeta de alerta'),
          Icon(Icons.star),
        ],
      ),
    );
  }
}