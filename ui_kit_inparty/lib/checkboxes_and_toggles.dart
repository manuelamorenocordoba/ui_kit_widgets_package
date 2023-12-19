part of 'ui_kit_inparty.dart';

class CustomCheckbox extends StatelessWidget {

  final String text;
  final double width;
  final double height;
  final bool? isSelected;
  final Function? onPressed;
  final Color boderSideCheckboxColor;
  final Color activeCheckboxColor;
  final Color checkColor;

  const CustomCheckbox({
    super.key,
    required this.text,
    this.boderSideCheckboxColor = Colors.black38,
    this.activeCheckboxColor = const Color.fromARGB(150, 219, 239, 190),
    this.checkColor = const Color.fromARGB(255, 182, 213, 134),
    this.isSelected,
    this.onPressed,
    this.width = 200,
    this.height = 150,
  });
  
  @override
  Widget build(BuildContext context) {

    return CheckboxListTile(
          title: Text(text,
          style: const TextStyle(fontSize: 20.0)),
          value: isSelected,
          side: BorderSide(color: const Color(0xFFF7FEF5)),
          activeColor: activeCheckboxColor,
          checkColor: checkColor,
          onChanged: (bool? value){
            onPressed?.call();
          },
      );
  }
}

class ParentWidgetCheckbox extends StatefulWidget {
  @override
  _ParentWidgetCheckboxState createState() => _ParentWidgetCheckboxState();
}

class _ParentWidgetCheckboxState extends State<ParentWidgetCheckbox> {
  bool _isSelected = false;

  @override
  Widget build(BuildContext context) {
    return CustomCheckbox(
      text: 'Ejemplo checkbox',
      isSelected: _isSelected,
      onPressed: () {
        setState(() {
          _isSelected = !_isSelected;
        });
      },
    );
  }
}


class CustomSwitch extends StatelessWidget {

  final String text;
  final double width;
  final double height;
    final bool isDisabled;

  final bool isSelected;
  final Function? onPressed;
  final Color activeColor;
  final Color activeTrackColor;

  const CustomSwitch({
    super.key,
    required this.text,
    this.activeColor = Colors.white,
    this.activeTrackColor = const Color.fromARGB(255, 139, 184, 79),
    required this.isSelected,
    required this.isDisabled,
    this.onPressed,
    this.width = 163,
    this.height = 165,
  });
  
  @override
  Widget build(BuildContext context) {

    return SwitchListTile(
          title: Text(text),
          activeColor: activeColor,
          thumbColor: MaterialStateProperty.all(Colors.white),
          activeTrackColor: activeTrackColor,
          hoverColor: const Color(0xFFF7FEF5),
          value: isSelected,
          onChanged: isDisabled ? null : (bool? value) {
            onPressed?.call();
          }
      );
  }
}



class ParentWidgetSwitch extends StatefulWidget {
  @override
  _ParentWidgetSwitchState createState() => _ParentWidgetSwitchState();
}

class _ParentWidgetSwitchState extends State<ParentWidgetSwitch> {
  bool _isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomSwitch(
          text: 'Ejemplo switch',
          isSelected: _isSelected,
          isDisabled: false,
          onPressed: () {
            setState(() {
              _isSelected = !_isSelected;
            });
          },
        ),
        const CustomSwitch(
          text: 'Ejemplo switch disable',
          isSelected: false,
          isDisabled: true,
          onPressed: null,
        ),
      ],
      
    );
  }
}
class CustomExpansionTile extends StatelessWidget {
  final Function(int) onOptionSelected;
  final int selectedOption;
  final String toggleTitle;
  final List<String> options;

  const CustomExpansionTile({
    Key? key,
    required this.onOptionSelected,
    required this.selectedOption,
    required this.toggleTitle,
    required this.options,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        decoration: BoxDecoration(
          color:Theme.of(context).colorScheme.onSurface,
          borderRadius: BorderRadius.circular(15.0),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 5.0,
              spreadRadius: 0.5,
              offset: Offset(0.7,0.5),
            )
          ],
        ),
        child: ExpansionTile(
          title: Text(toggleTitle),
          children: options.asMap().entries.map((entry) {
            int option = entry.key + 1;
            String title = entry.value;
            return _buildOption(option, title, () => onOptionSelected(option));
          }).toList(),
        ),
      ),
    );
  }

  Widget _buildOption(int option, String title, void Function()? onTap) {
    return Container(
      color: selectedOption == option ? const Color.fromARGB(60, 195, 213, 165) : null,
      child: ListTile(
        title: Text(title),
        onTap: onTap,
      ),
    );
  }
}

class ParentWidgetToggle extends StatefulWidget {
  @override
  _ParentWidgetState createState() => _ParentWidgetState();
}

class _ParentWidgetState extends State<ParentWidgetToggle> {
  int selectedOption = 1;
  final List<String> options = ['Opción 1', 'Opción 2', 'Opción 3'];

  @override
  Widget build(BuildContext context) {
    return CustomExpansionTile(
      onOptionSelected: (option) {
        setState(() {
          selectedOption = option;
        });
      },
      selectedOption: selectedOption,
      toggleTitle: 'Título',
      options: options,
    );
  }
}