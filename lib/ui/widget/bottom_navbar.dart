part of 'widgets.dart';

class BottomNavbar extends StatelessWidget {
  final String icon;
  final bool isSelected;

  BottomNavbar(this.icon, this.isSelected);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Spacer(),
        Image.asset(
         icon,
          width: 26,
        ),
        Spacer(),
        (isSelected)
            ? Container(
                height: 4,
                width: 30,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: purpleColor),
              )
            : SizedBox()
      ],
    );
  }
}
