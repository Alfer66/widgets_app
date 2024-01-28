import 'package:flutter/material.dart';

class UiControlsScreen extends StatelessWidget {
  const UiControlsScreen({super.key});

  static const name = 'ui_controls_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('UI Controls'),
      ),
      body: _UiControlsView(),
    );
  }
}

class _UiControlsView extends StatefulWidget {
  const _UiControlsView();

  @override
  State<_UiControlsView> createState() => _UiControlsViewState();
}

enum Transportation { car, plane, boat, submarine }

class _UiControlsViewState extends State<_UiControlsView> {

  bool isDeveloper = false;
  Transportation selectTransportation = Transportation.car;
  bool wantsBreakfast = false;
  bool wantsLunch = false;
  bool wantsDinner = false;

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const ClampingScrollPhysics(),
      children: [
        SwitchListTile(
          title: const Text('Developer mode'),
          subtitle: const Text('Controles adicionales'),
          value: isDeveloper,
          onChanged: (value) => setState(() => isDeveloper = value),
        ),
        ExpansionTile(
          title: const Text('Vehículo de transporte'),
          subtitle: Text('$selectTransportation'),
          children: [
            RadioListTile(
              title: const Text('By Car'),
              subtitle: const Text('Viajar por auto'),
              value: Transportation.car,
              groupValue: selectTransportation,
              onChanged: (value) =>
                  setState(() => selectTransportation = Transportation.car),
            ),
            RadioListTile(
              title: const Text('By Boat'),
              subtitle: const Text('Viajar por barco'),
              value: Transportation.boat,
              groupValue: selectTransportation,
              onChanged: (value) =>
                  setState(() => selectTransportation = Transportation.boat),
            ),
            RadioListTile(
              title: const Text('By Plane'),
              subtitle: const Text('Viajar por avión'),
              value: Transportation.plane,
              groupValue: selectTransportation,
              onChanged: (value) =>
                  setState(() => selectTransportation = Transportation.plane),
            ),
            RadioListTile(
              title: const Text('By Submarine'),
              subtitle: const Text('Viajar por submarino'),
              value: Transportation.submarine,
              groupValue: selectTransportation,
              onChanged: (value) => setState(
                  () => selectTransportation = Transportation.submarine),
            )
          ],
        ),

        CheckboxListTile(
          title: const Text('¿Desayuno?'),
          value: wantsBreakfast, 
          onChanged: (value) => setState(() => wantsBreakfast = !wantsBreakfast),
        ),
        CheckboxListTile(
          title: const Text('¿Almuerzo?'),
          value: wantsLunch, 
          onChanged: (value) => setState(() => wantsLunch = !wantsLunch),
        ),
        CheckboxListTile(
          title: const Text('¿Cena?'),
          value: wantsDinner, 
          onChanged: (value) => setState(() => wantsDinner = !wantsDinner),
        ),
      ],
    );
  }
}
