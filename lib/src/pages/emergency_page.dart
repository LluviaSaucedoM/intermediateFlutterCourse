import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:designs/src/widgets/boton_gordo.dart';
import 'package:designs/src/widgets/headers.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ItemBoton {
  final IconData icon;
  final String texto;
  final Color color1;
  final Color color2;

  ItemBoton(this.icon, this.texto, this.color1, this.color2);
}

class EmergencyPage extends StatelessWidget {
  const EmergencyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final items = <ItemBoton>[
      ItemBoton(FontAwesomeIcons.carBurst, 'Motor Accident',
          const Color(0xff6989F5), const Color(0xff906EF5)),
      ItemBoton(FontAwesomeIcons.plus, 'Medical Emergency',
          const Color(0xff66A9F2), const Color(0xff536CF6)),
      ItemBoton(FontAwesomeIcons.masksTheater, 'Theft / Harrasement',
          const Color(0xffF2D572), const Color(0xffE06AA3)),
      ItemBoton(FontAwesomeIcons.personBiking, 'Awards',
          const Color(0xff317183), const Color(0xff46997D)),
      ItemBoton(FontAwesomeIcons.carBurst, 'Motor Accident',
          const Color(0xff6989F5), const Color(0xff906EF5)),
      ItemBoton(FontAwesomeIcons.plus, 'Medical Emergency',
          const Color(0xff66A9F2), const Color(0xff536CF6)),
      ItemBoton(FontAwesomeIcons.masksTheater, 'Theft / Harrasement',
          const Color(0xffF2D572), const Color(0xffE06AA3)),
      ItemBoton(FontAwesomeIcons.personBiking, 'Awards',
          const Color(0xff317183), const Color(0xff46997D)),
      ItemBoton(FontAwesomeIcons.carBurst, 'Motor Accident',
          const Color(0xff6989F5), const Color(0xff906EF5)),
      ItemBoton(FontAwesomeIcons.plus, 'Medical Emergency',
          const Color(0xff66A9F2), const Color(0xff536CF6)),
      ItemBoton(FontAwesomeIcons.masksTheater, 'Theft / Harrasement',
          const Color(0xffF2D572), const Color(0xffE06AA3)),
      ItemBoton(FontAwesomeIcons.personBiking, 'Awards',
          const Color(0xff317183), const Color(0xff46997D)),
    ];

    List<Widget> itemMap = items
        .map((item) => FadeInLeft(
              duration: const Duration(milliseconds: 250),
              child: BotonGordo(
                icon: item.icon,
                text: item.texto,
                color1: item.color1,
                color2: item.color2,
                onPress: () {},
              ),
            ))
        .toList();
    return Scaffold(
        body: Stack(
      children: <Widget>[
        Container(
          margin: const EdgeInsets.only(top: 200),
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: <Widget>[
              const SizedBox(height: 50),
              ...itemMap,
            ],
          ),
        ),
        const _Encabezado()
      ],
    ));
  }
}

class _Encabezado extends StatelessWidget {
  const _Encabezado({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const IconHeder(
          icon: FontAwesomeIcons.plus,
          titulo: 'Asistencia Medica',
          subtitulo: 'has solicitado',
          color1: Color(0xff906EF5),
          color2: Color(0xff6989F5),
        ),
        Positioned(
            right: 0,
            top: 40,
            child: RawMaterialButton(
              onPressed: () {},
              shape: const CircleBorder(),
              padding: const EdgeInsets.all(15),
              child: const FaIcon(
                FontAwesomeIcons.ellipsisVertical,
                color: Colors.white,
              ),
            ))
      ],
    );
  }
}

class BotonGordoTem extends StatelessWidget {
  const BotonGordoTem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BotonGordo(
      icon: FontAwesomeIcons.motorcycle,
      text: 'Motor Accident',
      color1: const Color.fromARGB(255, 245, 154, 105),
      color2: const Color(0xff906EF5),
      onPress: () {},
    );
  }
}

class PageHeder extends StatelessWidget {
  const PageHeder({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const IconHeder(
      icon: FontAwesomeIcons.plus,
      titulo: 'Asistencia Medica',
      subtitulo: 'Has Solicitado',
      color1: Color(0xff66A9F2),
      color2: Color(0xff536CF6),
    );
  }
}
