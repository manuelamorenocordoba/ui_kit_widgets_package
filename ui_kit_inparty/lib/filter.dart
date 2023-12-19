part of 'ui_kit_inparty.dart';

class FilterOptions extends StatelessWidget {
  const FilterOptions({
    Key? key,
    this.onPressed,
    this.nameFilter,
    this.isSelected = false,
  }) : super(key: key);

  final String? nameFilter;
  final Function? onPressed;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: ElevatedButton(
        style: ButtonStyle(
            shadowColor: MaterialStateProperty.resolveWith<Color>(
                (Set<MaterialState> states) {
              return (states.contains(MaterialState.pressed))
                  ? Colors.black
                  : Colors.grey.withOpacity(0.1);
            }),
            elevation: MaterialStateProperty.resolveWith<double>(
                (Set<MaterialState> states) {
              return (states.contains(MaterialState.pressed)) ? 2 : 1.5;
            }),
            foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
            backgroundColor: MaterialStateProperty.all<Color>(
                isSelected ? const Color.fromARGB(255, 131, 178, 59) :  Theme.of(context).colorScheme.background),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                    side:  BorderSide(
                      color: Theme.of(context).brightness == Brightness.dark ? Colors.white : Colors.grey, 
                      width: 2,
                    )))),
        onPressed: onPressed as void Function()?,
        child: Text(nameFilter!,
            style: TextStyle(
                fontSize: 15,
                color: isSelected ? Theme.of(context).colorScheme.surface : Theme.of(context).colorScheme.onSurface )),
      ),
    );
  }
}

class ParentFilterOptions extends StatefulWidget {
  @override
  _ParentFilterOptionsState createState() => _ParentFilterOptionsState();
}

class _ParentFilterOptionsState extends State<ParentFilterOptions> {
  String _selectedFilter = '';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Container(
          color: Colors.black12,
          padding: const EdgeInsets.all(20.0),
          child: Row(
            children: [
              FilterOptions(
                  nameFilter: 'Filtro 1',
                  isSelected: _selectedFilter == 'Filtro 1',
                  onPressed: () {
                    setState(() {
                      _selectedFilter = 'Filtro 1';
                    });
                  },
                ),
                FilterOptions(
                  nameFilter: 'Filtro 2',
                  isSelected: _selectedFilter == 'Filtro 2',
                  onPressed: () {
                    setState(() {
                      _selectedFilter = 'Filtro 2';
                    });
                  },
                ),
                FilterOptions(
                  nameFilter: 'Filtro 3',
                  isSelected: _selectedFilter == 'Filtro 3',
                  onPressed: () {
                    setState(() {
                      _selectedFilter = 'Filtro 3';
                    });
                  },
                ),
            ],
          ),
        ),
    );
  }
}