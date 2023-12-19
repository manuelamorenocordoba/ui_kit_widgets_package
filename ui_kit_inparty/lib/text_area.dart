part of 'ui_kit_inparty.dart';


class TextAreaComponent extends StatelessWidget {
  final TextEditingController controller;
  final Function? onPressed;
  final double height;

  const TextAreaComponent({
    Key? key,
    this.height = 120.0,
    required this.controller,
    this.onPressed
    }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: height,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.background,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 6,
                offset: const Offset(0, 3), 
              ),
            ],
          ),
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
              labelText: 'Text area',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide.none),
              filled: true,
              fillColor:Theme.of(context).colorScheme.background,
              ),
            ),
          ),
      );
  }
}

class ParentWidgetTextArea extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextAreaComponent(
      controller: _controller,
      onPressed: () {
        print('Botón de búsqueda presionado');
      },
    );
  }
}