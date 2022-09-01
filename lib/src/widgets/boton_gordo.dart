import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BotonGordo extends StatelessWidget {
  const BotonGordo({
    Key? key,
    required this.icon,
    required this.text,
    required this.onPress,
    this.color1 = const Color.fromARGB(255, 237, 113, 214),
    this.color2 = const Color.fromARGB(255, 77, 7, 64),
  }) : super(key: key);
  final IconData icon;
  final String text;
  final Color color1;
  final Color color2;
  final void Function()? onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Stack(
        children: <Widget>[
          _BotonGordoBadgraund(
            color1: color1,
            color2: color2,
            icon: icon,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const SizedBox(height: 140, width: 40),
              FaIcon(icon, size: 40, color: Colors.white),
              const SizedBox(width: 20),
              Expanded(
                child: Text(text,
                    style: const TextStyle(color: Colors.white, fontSize: 18)),
              ),
              const FaIcon(FontAwesomeIcons.chevronRight, color: Colors.white),
              const SizedBox(width: 40),
            ],
          )
        ],
      ),
    );
  }
}

class _BotonGordoBadgraund extends StatelessWidget {
  const _BotonGordoBadgraund({
    Key? key,
    required this.color1,
    required this.color2,
    required this.icon,
  }) : super(key: key);
  final Color color1;
  final Color color2;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Stack(
          children: [
            Positioned(
              right: -20,
              top: -20,
              child: FaIcon(
                icon,
                size: 150,
                color: Colors.white.withOpacity(0.2),
              ),
            )
          ],
        ),
      ),
      width: double.infinity,
      height: 100,
      margin: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.black.withOpacity(0.2),
                offset: const Offset(4, 6),
                blurRadius: 10)
          ],
          borderRadius: BorderRadius.circular(15),
          gradient: LinearGradient(colors: <Color>[color1, color2])),
    );
  }
}
