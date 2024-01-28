import 'package:flutter/material.dart';

class MenuItem {
  final String title;
  final String subTitle;
  final String link;
  final IconData icon;

  const MenuItem({
    required this.title,
    required this.subTitle,
    required this.link,
    required this.icon,
  });
}

const appMenuItems = <MenuItem>[
  MenuItem(
    title: 'Botones',
    subTitle: 'Varios botones en Flutter',
    link: '/buttons',
    icon: Icons.smart_button_outlined
  ),

  MenuItem(
    title: 'Tarjetas',
    subTitle: 'Un contenedor estilizado',
    link: '/cards',
    icon: Icons.credit_card
  ),

  MenuItem(
    title: 'ProgressIndicators',
    subTitle: 'Generales y controlados',
    link: '/progress',
    icon: Icons.refresh_rounded
  ),

  MenuItem(
    title: 'Custom snackbar example',
    subTitle: 'Ejemplo de snacbar personalizado',
    link: '/snacbar_screen_custom',
    icon: Icons.chat_bubble_sharp
  ),

  MenuItem(
    title: 'Snackbar y diálogos',
    subTitle: 'Indicadores en pantalla',
    link: '/snackbar_screen',
    icon: Icons.info_outline_rounded
  ),

  MenuItem(
    title: 'Animated container',
    subTitle: 'Stateful widget animado',
    link: '/animated_screen',
    icon: Icons.check_box_outline_blank_rounded
  ),
];
