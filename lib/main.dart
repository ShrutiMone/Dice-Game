import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  return runApp(
    DicePage(),
  );
}

class DicePage extends StatefulWidget {
  @override
  State<DicePage> createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftdieno = 1;
  int rightdieno = 2;
  int player1score = 0;
  int player2score = 0;
  String winner='';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blueGrey,
        appBar: AppBar(
          title: Text("DICE GAME"),
          backgroundColor: Colors.grey[800],
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              children: [
                SizedBox(height: 40),
                Text(
                  "Let's Play!",
                  style: TextStyle(fontSize: 30, color: Colors.white),
                ),
                SizedBox(
                  height: 50,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            children: [
                              Text(
                                "PLAYER 1",
                                style: TextStyle(fontSize: 25),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                'Score:$player1score',
                                style: TextStyle(fontSize: 20),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            children: [
                              Text("PLAYER 2", style: TextStyle(fontSize: 25)),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                'Score:$player2score',
                                style: TextStyle(fontSize: 20),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 50),
                Row(
                  children: [
                    Expanded(
                      child: TextButton(
                        onPressed: () {
                          setState(() {
                            leftdieno = Random().nextInt(6) + 1;
                            player1score += leftdieno;
                          });
                        },
                        child: Image.asset('images/dice$leftdieno.png'),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                        child: TextButton(
                      onPressed: () {
                        setState(() {
                          rightdieno = Random().nextInt(6) + 1;
                          player2score += rightdieno;
                        });
                      },
                      child: Image.asset('images/dice$rightdieno.png'),
                    )),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.white)),
                  onPressed: () {
                    setState(() {
                      if(player2score>player1score)
                        winner='PLAYER 2 WINS!';
                      else if(player1score>player2score)
                        winner='PLAYER 1 WINS!';
                      else
                        winner="IT'S A TIE!";
                    });
                  },
                  child: Text("FINISH", style: TextStyle(fontSize:20, color: Colors.black),),
                ),
                SizedBox(height:50 ,child: Divider(thickness: 5,),),

                Text('$winner',style: TextStyle(fontSize: 20, color: Colors.white70, fontWeight: FontWeight.bold),),
                SizedBox(height: 50,child: Divider(thickness: 5,),),
                ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.white)),
                  onPressed: () {
                    setState(() {
                      player1score = 0;
                      player2score = 0;
                      winner='';
                    });
                  },
                  child: Text(
                    "RESET",
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
