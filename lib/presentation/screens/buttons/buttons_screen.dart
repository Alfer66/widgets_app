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
      child: Wrap(
        spacing: 10,
        alignment: WrapAlignment.center,
        children: [
          ElevatedButton(onPressed: (){}, child: const Text('Elevated')),
          const ElevatedButton(onPressed: null, child: Text('Elevated Diseble')),
          
          ElevatedButton.icon(
            onPressed: (){}, 
            icon: const Icon(Icons.access_alarm_outlined), 
            label: const Text('Elevated icon')
          ),

          FilledButton(onPressed: (){}, child: const Text('Filled')),
          FilledButton.icon(
            onPressed: (){}, 
            icon: const Icon(Icons.accessibility_new), 
            label: const Text('Filled Icon')
          ),

          OutlinedButton(onPressed: (){}, child: const Text('Outline')),
          OutlinedButton.icon(
            onPressed: (){}, 
            icon: const Icon(Icons.terminal), 
            label: const Text('Outline Icon')
          ),

          TextButton(onPressed: (){}, child: const Text('Text')),
          TextButton.icon(
            onPressed: (){}, 
            icon: const Icon(Icons.account_box_outlined), 
            label: const Text('Text')
          ),

          const CustomButton(),

          IconButton(onPressed: (){}, icon: const Icon(Icons.app_registration_rounded)),
          IconButton(
            onPressed: (){}, 
            icon: const Icon(Icons.app_registration_rounded),
            style: ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(colors.primary),
              iconColor: const MaterialStatePropertyAll(Colors.white)
            ),
          ),

          const CustomButtonGradient(),
          const CustomButtonNeon(text: 'Neon button',),
          const CustomButtonNeon(withBackground: true, text: 'Neon button background',),

        ]
      ),
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
          onTap: (){},
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text('Boton personalizado', style: TextStyle(color: Colors.white)),
          ),
        ),
      ),
    );
  }
}

class CustomButtonGradient extends StatelessWidget {
  const CustomButtonGradient({super.key});

  @override
  Widget build(BuildContext context){
    final colors = Theme.of(context).colorScheme;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
          colors: [
            colors.primary//,
           // colors.primaryContainer
            , Colors.red
          ]
        )
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: (){},
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text('Boton con degradado', style: TextStyle(color: Colors.white
            )),
          ),
        ),
      ),
    );
  }
}

class CustomButtonNeon extends StatefulWidget {
    final void Function()? onPressed;
    final String text;
  //final bool isNeon;
  
  final bool withBackground;
  const CustomButtonNeon({Key? key, this.onPressed, this.withBackground = false, required this.text}) : super(key: key);

  @override
  _CustomButtonNeonState createState() => _CustomButtonNeonState();
}

class _CustomButtonNeonState extends State<CustomButtonNeon> {

  bool isPressed = false;

  @override
  Widget build(BuildContext context){
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
            for( double i = 1; i < 5; i++)
              BoxShadow(
                color: shadowColor,
                blurRadius: (isPressed ? 5 : 3) * i,
                inset: true,
              ),
            for( double i = 1; i < 5; i++)
              BoxShadow(
                spreadRadius: -1,
                color: shadowColor,
                blurRadius: (isPressed ? 5 : 3) * i,
                blurStyle: BlurStyle.outer,
              ),
          ]
        ),
        child: TextButton(
          onHover: (hovered) => setState(() => isPressed = hovered),
          
          style: TextButton.styleFrom(
            side: const BorderSide(color: Colors.white, width: 4),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            foregroundColor: Colors.transparent,
            surfaceTintColor: Colors.transparent,
            iconColor: Colors.transparent,
          ),
          onPressed: (){},
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
                    blurRadius: 3 * i
                  ),
              ],
            ),
          ),
        ),
      )
    );
  }
}