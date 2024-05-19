import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tempo_timer/blocs/blocs.dart';

class PageHome extends StatefulWidget {
  const PageHome({super.key});

  @override
  State<PageHome> createState() => _PageHomeState();
}

class _PageHomeState extends State<PageHome> {
  @override
  Widget build(BuildContext context) {
    final temporizador = context.watch<Temporizador>();
    return Scaffold(
        backgroundColor: CupertinoColors.black,
        body: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * .1,
            ),
            ClipOval(
              child: Container(
                width: 350,
                height: 350,
                color: const Color.fromARGB(255, 186, 39, 57),
                padding: const EdgeInsets.all(7),
                child: ClipOval(
                  child: Container(
                    padding: const EdgeInsets.all(50),
                    width: 350,
                    height: 350,
                    color: Colors.black,
                    child: Center(
                      child: Text(
                        temporizador.state,
                        style: const TextStyle(
                          color: CupertinoColors.white,
                          fontSize: 50,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      context.read<Temporizador>().start(false);
                    },
                    child: Container(
                      height: 60,
                      margin: const EdgeInsets.only(
                          bottom: 30, left: 20, right: 10),
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 201, 42, 62),
                          borderRadius: BorderRadius.circular(10)),
                      child: const Icon(Icons.stop, color: Colors.white),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      context.read<Temporizador>().restart();
                    },
                    child: Container(
                      height: 60,
                      margin: const EdgeInsets.only(
                          bottom: 30, left: 20, right: 10),
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 201, 42, 62),
                          borderRadius: BorderRadius.circular(10)),
                      child: const Icon(Icons.restart_alt_outlined,
                          color: Colors.white),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      context.read<Temporizador>().start(true);
                    },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 500),
                      height: 60,
                      margin: const EdgeInsets.only(
                          bottom: 30, left: 20, right: 10),
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: 1.0,
                              color: const Color.fromARGB(255, 201, 42, 62)),
                          color: temporizador.state == "00:00:00" || temporizador.isRunning == false
                              ? const Color.fromARGB(255, 201, 42, 62)
                              : const Color.fromARGB(255, 68, 16, 37),
                          borderRadius: BorderRadius.circular(10)),
                      child: Icon(Icons.play_arrow,
                          color: temporizador.state == "00:00:00" || temporizador.isRunning == false
                              ? Colors.white
                              : const Color.fromARGB(255, 201, 42, 62)),
                    ),
                  ),
                ),
              ],
            )
          ],
        ));
  }
}
