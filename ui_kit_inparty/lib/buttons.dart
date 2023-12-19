part of 'ui_kit_inparty.dart';

class CustomElevatedButton extends StatelessWidget {

  final String text;
  final Function? onPressed;
  final double width;
  final double height;
  final MaterialStateProperty<Color?> backgroundColor;
  final Color textColor;

  const CustomElevatedButton({
    super.key,
    required this.text,
    this.width = 143,
    this.height = 50,
    this.backgroundColor = const MaterialStatePropertyAll(Color.fromARGB(255, 151, 204, 69)),

    this.textColor = const Color.fromARGB(255, 255, 255, 255),
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {

    return SizedBox(
      width: width,
      height: height,
      child:  ElevatedButton(
        onPressed: onPressed as void Function()?,
        style: ButtonStyle(
          backgroundColor: backgroundColor,
          shape: MaterialStatePropertyAll(
            RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15)
            )
          )
        ),
        child:  Text(
          text,
          style: TextStyle(
            color: textColor
          ),
        ),
      )
    );
  }
}

class CustomOutlinedButton extends StatelessWidget {

  final String text;
  final double width;
  final double height;
  final MaterialStateProperty<Color?>? backgroundColor;
  final Color borderSideColor;
  final Color textColor;
  final Function? onPressed;

  const CustomOutlinedButton({
    super.key,
    required this.text,
    this.width = 143,
    this.height = 50,
    this.backgroundColor,
    this.borderSideColor = const Color.fromARGB(255, 131, 178, 59),
    this.textColor = const Color.fromARGB(255, 131, 178, 59),
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {

    return SizedBox(
      width: width,
      height: height,
      child: OutlinedButton(
        onPressed: onPressed as void Function()?,
        style: ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(Theme.of(context).colorScheme.background),
          shape: MaterialStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15)
            )
          ),
          side: MaterialStatePropertyAll(
            BorderSide(
              width: 1.5,
              color: borderSideColor,
            )
          ),
          overlayColor: MaterialStateProperty.resolveWith<Color?>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.hovered) || 
                  (states.contains(MaterialState.focused) ||
                  (states.contains(MaterialState.pressed))))
                return Color.fromARGB(255, 151, 204, 69);
              return null; 
            },
          ),
          foregroundColor: MaterialStateProperty.resolveWith<Color?>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.hovered) ||
                  states.contains(MaterialState.focused) ||
                  states.contains(MaterialState.pressed))
                return Colors.white;
              return textColor; 
            },
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: textColor,
          ),
        ),
      ),
    );

  }
}

class CustomOutlinedButtonWithIcon extends StatelessWidget {
  final String text;
  final double width;
  final double height;
  final MaterialStateProperty<Color?> backgroundColor;
  final Color borderSideColor;
  final Color textColor;
  final Function? onPressed;
  final Icon icon;

  const CustomOutlinedButtonWithIcon({
    Key? key,
    required this.text,
    required this.icon,
    this.width = 143,
    this.height = 50,
    this.backgroundColor = const MaterialStatePropertyAll(Colors.white),
    this.borderSideColor = const Color.fromARGB(255, 131, 178, 59),
    this.textColor = const Color.fromARGB(255, 131, 178, 59),
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: OutlinedButton(
        onPressed: onPressed as void Function()?,
        style: ButtonStyle(
          backgroundColor:  MaterialStatePropertyAll(Theme.of(context).colorScheme.background),
          shape: MaterialStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          side: MaterialStatePropertyAll(
            BorderSide(
              width: 1.5,
              color: borderSideColor,
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon,
            Spacer(),
            Text(text, style: TextStyle(color: textColor)),
          ],
        ),
      ),
    );
  }
}

class CustomIconButton extends StatelessWidget {

  final Icon icon;
  final double width;
  final double height;
  final Function? onPressed;
  final MaterialStateProperty<Color?> iconColor;
  final MaterialStateProperty<Color?> backgroundColor;
  

  const CustomIconButton({
    super.key,
    required this.icon,
    this.width = 50,
    this.height = 50,
    required this.iconColor,
    required this.backgroundColor,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: IconButton(
        onPressed: onPressed as void Function()?,
        icon: icon,
        style: ButtonStyle(
          iconColor: iconColor,
          backgroundColor: backgroundColor,
          shape: MaterialStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15)
            )
          ),
        ),
      ),
    );
  }
}