part of 'ui_kit_inparty.dart';

class SearchInputComponent extends StatelessWidget {
  final TextEditingController controller;
  final Function? onPressed;

  const SearchInputComponent({
    Key? key,
    required this.controller,
    this.onPressed
    }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 60,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 6,
                offset: const Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
              labelText: 'Search bar',
              suffixIcon: DecoratedBox(
                decoration: const BoxDecoration(),
                child: Container(
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 4,
                        offset: const Offset(0, 3), // changes position of shadow
                      ),
                    ],
                    color: const Color.fromARGB(255, 139, 184, 79),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.search, color: Colors.white),
                    onPressed: onPressed as void Function()?,
                  ),
                ),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide.none),
              filled: true,
              fillColor: Theme.of(context).colorScheme.background,
              ),
            ),
          ),
      );
  }
}

class ParentWidgetSearch extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SearchInputComponent(
      controller: _controller,
      onPressed: () {
        print('Botón de búsqueda presionado');
      },
    );
  }
}