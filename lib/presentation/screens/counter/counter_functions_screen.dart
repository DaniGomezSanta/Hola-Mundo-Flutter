import 'package:flutter/material.dart';

class CounterFunctionScreen extends StatefulWidget {

  const CounterFunctionScreen({super.key});

  @override
  State<CounterFunctionScreen> createState() => _CounterFunctionScreenState();
}

class _CounterFunctionScreenState extends State<CounterFunctionScreen> {

  int clickCounter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter Functions'),
        actions: [
          IconButton(
          icon: const Icon(Icons.refresh_rounded), 
          onPressed: () { 
            setState(() {
              clickCounter = 0;
            });
           },),
        ],
      ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('$clickCounter', 
                  style: const TextStyle( fontSize: 160, fontWeight: FontWeight.w100 ),),
              Text('Click${ clickCounter == 1 ? '': 's' }', style: const TextStyle( fontSize: 25 ))

              // otra forma de hacerlo:
              // if( clickCounter == 1)
              // const Text('Click', style: TextStyle( fontSize: 25 )),
              // if( clickCounter != 1 )
              // const Text('Clicks', style: TextStyle( fontSize: 25 )),
            ],
            ),
        ),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
        CustomButton( 
          icon: Icons.refresh_rounded,
          onPressed: () {
            setState(() {
              clickCounter = 0;
            });
          },
        ),
        const SizedBox( height: 20,),
        CustomButton( 
          icon: Icons.exposure_minus_1_outlined,
          onPressed: (){
            if(clickCounter == 0) return;
            setState(() {
              clickCounter--;
            });
          },),
        const SizedBox( height: 20,),
         CustomButton( 
          icon: Icons.plus_one,
          onPressed: () {
            setState(() {
              clickCounter++;
            });
          },),
      ],
      )
    );
  }
}

class CustomButton extends StatelessWidget {
  final IconData icon; 
  final VoidCallback? onPressed; 
  
  const CustomButton({
    super.key,
    required this.icon,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
         shape: const StadiumBorder(),
         onPressed: onPressed,
         child: Icon( icon ), 
        );
  }
}