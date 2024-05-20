import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:go_router/go_router.dart';
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';

class ButtonsScreen extends StatelessWidget {
  static const String name = 'buttons_screen';

  const ButtonsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Button Screen'),
      ),
      body: const _ButtonsView(),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.arrow_back_ios_new_rounded),
        onPressed: () => context.pop(),
      ),
    );
  }
}

class _ButtonsView extends StatelessWidget {
  const _ButtonsView();

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: Wrap(spacing: 10, alignment: WrapAlignment.center, children: [
        ElevatedButton(onPressed: () {}, child: const Text('Elevated')),
        const ElevatedButton(onPressed: null, child: Text('Elevated Diseble')),
        ElevatedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.access_alarm_outlined),
            label: const Text('Elevated icon')),
        FilledButton(onPressed: () {}, child: const Text('Filled')),
        FilledButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.accessibility_new),
            label: const Text('Filled Icon')),
        OutlinedButton(onPressed: () {}, child: const Text('Outline')),
        OutlinedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.terminal),
            label: const Text('Outline Icon')),
        TextButton(onPressed: () {}, child: const Text('Text')),
        TextButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.account_box_outlined),
            label: const Text('Text')),
        const CustomButton(),
        IconButton(
            onPressed: () {}, icon: const Icon(Icons.app_registration_rounded)),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.app_registration_rounded),
          style: ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(colors.primary),
              iconColor: const MaterialStatePropertyAll(Colors.white)),
        ),
        const CustomButtonGradient(),
        CustomButtonNeon(
          text: 'Neon button',
          onPressed: () {},
        ),
        CustomButtonNeon(
          withBackground: true,
          text: 'Neon button background',
          onPressed: () {},
        ),
        GlowingButton(
            text: 'Glowing button',
            onPressed: () {},
            color1: Colors.cyan,
            color2: Colors.greenAccent),
        GlowingButton(
            text: 'Glowing button',
            onPressed: () {},
            color1: Colors.cyan,
            color2: Colors.greenAccent),
      ]),
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton({super.key});

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;

    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Material(
        color: color.primary,
        child: InkWell(
          onTap: () {},
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text('Boton personalizado',
                style: TextStyle(color: Colors.white)),
          ),
        ),
      ),
    );
  }
}

class CustomButtonGradient extends StatelessWidget {
  const CustomButtonGradient({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(colors: [
            colors.primary //,
            // colors.primaryContainer
            ,
            Colors.red
          ])),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {},
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text('Boton con degradado',
                style: TextStyle(color: Colors.white)),
          ),
        ),
      ),
    );
  }
}

class CustomButtonNeon extends StatefulWidget {
  final void Function() onPressed;
  final String text;
  //final bool isNeon;

  final bool withBackground;
  const CustomButtonNeon(
      {Key? key,
      required this.onPressed,
      this.withBackground = false,
      required this.text})
      : super(key: key);

  @override
  _CustomButtonNeonState createState() => _CustomButtonNeonState();
}

class _CustomButtonNeonState extends State<CustomButtonNeon> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    Color shadowColor = colors.primary;
    Color backgroundColor = shadowColor.withOpacity(0.7);

    return Listener(
        onPointerDown: (_) => setState(() => isPressed = true),
        onPointerUp: (_) => setState(() => isPressed = false),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 100),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: widget.withBackground
                  ? isPressed
                      ? backgroundColor
                      : Colors.transparent
                  : Colors.transparent,
              boxShadow: [
                for (double i = 1; i < 5; i++)
                  BoxShadow(
                    color: shadowColor,
                    blurRadius: (isPressed ? 5 : 3) * i,
                    inset: true,
                  ),
                for (double i = 1; i < 5; i++)
                  BoxShadow(
                    spreadRadius: -1,
                    color: shadowColor,
                    blurRadius: (isPressed ? 5 : 3) * i,
                    blurStyle: BlurStyle.outer,
                  ),
              ]),
          child: TextButton(
            onHover: (hovered) => setState(() => isPressed = hovered),
            style: TextButton.styleFrom(
              side: const BorderSide(color: Colors.white, width: 4),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              backgroundColor: Colors.transparent,
              shadowColor: Colors.transparent,
              foregroundColor: Colors.transparent,
              surfaceTintColor: Colors.transparent,
              iconColor: Colors.transparent,
            ),
            onPressed: () {},
            child: Text(
              widget.text,
              style: TextStyle(
                color: Colors.white,
                shadows: [
                  for (double i = 1; i < (isPressed ? 8 : 4); i++)
                    Shadow(
                        // color: widget.withBackground
                        //     ? isPressed
                        //         ? Colors.white
                        //         : shadowColor
                        //     : shadowColor,
                        color: shadowColor,
                        blurRadius: 3 * i),
                ],
              ),
            ),
          ),
        ));
  }
}

class GlowingButton extends StatefulWidget {
  final void Function()? onPressed;
  final String text;
  final Color? color1;
  final Color? color2;
  const GlowingButton(
      {Key? key, this.onPressed, required this.text, this.color1, this.color2})
      : super(key: key);

  @override
  _GlowingButtonState createState() => _GlowingButtonState();
}

class _GlowingButtonState extends State<GlowingButton> {
  bool glowing = false;
  double scale = 1.0;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    Color color1 = widget.color1 ?? colors.primary;
    Color color2 = widget.color2 ?? colors.primary.withOpacity(0.5);

    ///para web y descktop cambiar el GestureDetector por MouseRegion

    return GestureDetector(
      //onTapUp: (val) => setState(() { glowing = false, scale = 1.0; }),
      onTapCancel: () => setState(() {
        glowing = false;
        scale = 1.0;
      }),
      onTapDown: (val) => setState(() {
        glowing = true;
        scale = 1.1;
      
      }),

    // return MouseRegion(
    //   onExit: (val){
    //     setState(() {
    //       glowing = false;
    //       scale = 1.0;
    //     });
    //   },
    //   onEnter: (val){
    //     setState(() {
    //       glowing = true;
    //       scale = 1.1;
    //     });
    //   },
      child: AnimatedContainer(
        transform: Matrix4.identity()..scale(scale),
        duration: const Duration(milliseconds: 200),
        height: 48,
        width: 160,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
            gradient: LinearGradient(
              colors: [
                color1,
                color2,
              ],
            ),
            boxShadow: glowing
                ? [
                    // iluminacion horizontal
                    BoxShadow(
                      color: color1.withOpacity(0.6),
                      spreadRadius: 1,
                      blurRadius: 16,
                      offset: const Offset(-8, 0),
                    ),
                    BoxShadow(
                      color: color1.withOpacity(0.6),
                      spreadRadius: 1,
                      blurRadius: 16,
                      offset: const Offset(8, 0),
                    ),
                    // iluminacion vertical
                    BoxShadow(
                      color: color1.withOpacity(0.6),
                      spreadRadius: 16,
                      blurRadius: 32,
                      offset: const Offset(-8, 0),
                    ),
                    BoxShadow(
                      color: color1.withOpacity(0.6),
                      spreadRadius: 16,
                      blurRadius: 32,
                      offset: const Offset(8, 0),
                    ),
                  ]
                : []),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              glowing ? Icons.lightbulb : Icons.lightbulb_outline,
              color: Colors.white,
            ),
            //Text(widget.text, style: const TextStyle(color: Colors.white),),
            Text(
              glowing ? 'Glowing' : 'Dimmed',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
