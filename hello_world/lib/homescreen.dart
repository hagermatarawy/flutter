import 'package:flutter/material.dart';

class game extends StatefulWidget {
  game({super.key});

  @override
  State<game> createState() => _gameState();
}

class _gameState extends State<game> {
  bool onturn = true;
  List<String> display = ['', '', '', '', '', '', '', '', ''];
  int xscore = 0;
  int oscore = 0;
  int filledboxes = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Padding(
      padding: const EdgeInsets.all(4),
      child: Column(children: [
        Row(children: [
          InkWell(
            onTap: () {
              play(0);
            },
            child: Container(
              width: 160,
              height: 150,
              color: Colors.grey,
              child: Center(
                child: Text(
                  display[0],
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ),
          ),
          SizedBox(
            width: 3,
          ),
          InkWell(
            onTap: () {
              play(1);
            },
            child: Container(
              width: 160,
              height: 150,
              color: Colors.grey,
              child: Center(
                child: Text(
                  display[1],
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ),
          ),
          SizedBox(
            width: 3,
          ),
          InkWell(
            onTap: () {
              play(2);
            },
            child: Container(
              width: 160,
              height: 150,
              color: Colors.grey,
              child: Center(
                child: Text(
                  display[2],
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ),
          ),
        ]),
        SizedBox(
          height: 3,
        ),
        Row(
          children: [
            InkWell(
              onTap: () {
                play(3);
              },
              child: Container(
                width: 160,
                height: 150,
                color: Colors.grey,
                child: Center(
                  child: Text(
                    display[3],
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 3,
            ),
            InkWell(
              onTap: () {
                play(4);
              },
              child: Container(
                width: 160,
                height: 150,
                color: Colors.grey,
                child: Center(
                  child: Text(
                    display[4],
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 3,
            ),
            InkWell(
              onTap: () {
                play(5);
              },
              child: Container(
                width: 160,
                height: 150,
                color: Colors.grey,
                child: Center(
                  child: Text(
                    display[5],
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 3,
        ),
        Row(
          children: [
            InkWell(
              onTap: () {
                play(6);
              },
              child: Container(
                width: 160,
                height: 150,
                color: Colors.grey,
                child: Center(
                  child: Text(
                    display[6],
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 3,
            ),
            InkWell(
              onTap: () {
                play(7);
              },
              child: Container(
                width: 160,
                height: 150,
                color: Colors.grey,
                child: Center(
                  child: Text(
                    display[7],
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 3,
            ),
            InkWell(
              onTap: () {
                play(8);
              },
              child: Container(
                width: 160,
                height: 150,
                color: Colors.grey,
                child: Center(
                  child: Text(
                    display[8],
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 5,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                Text(
                  "Player X ",
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                Text(
                  "$xscore",
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ],
            ),
            Column(
              children: [
                Text(
                  "Player O ",
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                Text(
                  "$oscore",
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ],
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        ElevatedButton(
          onPressed: () {
            setState(() {
              for (int i = 0; i < 9; i++) {
                display[i] = '';
              }
            });
            filledboxes = 0;

          },
          child: Text(
            "Play Again",
            style: TextStyle(color: Colors.black, fontSize: 20),
          ),
        )
      ]),
    )));
  }

  void play(int ind) {
    setState(() {
      if (onturn && display[ind] == '') {
        display[ind] = 'O';
        filledboxes++;
      } else if (!onturn && display[ind] == '') {
        display[ind] = 'X';
        filledboxes++;
      }
      onturn = !onturn;
    });
    checkwinner();
  }

  void checkwinner() {
    if (display[0] == display[1] &&
        display[0] == display[2] &&
        display[0] != '') {
      setState(() {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(
              "Winner",
              style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
            ),
            content: Text(
              'player' + '  ' + display[0] + '  ' + 'Wins',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            actions: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("OK"))
            ],
          ),
        );
        updatescore(display[0]);
      });
    }
    if (display[3] == display[4] &&
        display[3] == display[5] &&
        display[3] != '') {
      setState(() {
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  title: Text(
                    "Winner",
                    style: TextStyle(
                        color: Colors.grey, fontWeight: FontWeight.bold),
                  ),
                  content: Text(
                    'player' + '  ' + display[3] + '  ' + 'Wins',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  actions: [
                    ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text("OK"))
                  ],
                ));
        updatescore(display[3]);
      });
    }
    if (display[6] == display[7] &&
        display[6] == display[8] &&
        display[6] != '') {
      setState(() {
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  title: Text(
                    "Winner",
                    style: TextStyle(
                        color: Colors.grey, fontWeight: FontWeight.bold),
                  ),
                  content: Text(
                    'player' + '  ' + display[6] + '  ' + 'Wins',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  actions: [
                    ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text("OK"))
                  ],
                ));
        updatescore(display[6]);
      });
    }
    if (display[0] == display[3] &&
        display[0] == display[6] &&
        display[0] != '') {
      setState(() {
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  title: Text(
                    "Winner",
                    style: TextStyle(
                        color: Colors.grey, fontWeight: FontWeight.bold),
                  ),
                  content: Text(
                    'player' + '  ' + display[0] + '  ' + 'Wins',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  actions: [
                    ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text("OK"))
                  ],
                ));
        updatescore(display[0]);
      });
    }
    if (display[1] == display[4] &&
        display[1] == display[7] &&
        display[1] != '') {
      setState(() {
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  title: Text(
                    "Winner",
                    style: TextStyle(
                        color: Colors.grey, fontWeight: FontWeight.bold),
                  ),
                  content: Text(
                    'player' + '  ' + display[1] + '  ' + 'Wins',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  actions: [
                    ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text("OK"))
                  ],
                ));
        updatescore(display[1]);
      });
    }
    if (display[2] == display[5] &&
        display[2] == display[8] &&
        display[2] != '') {
      setState(() {
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  title: Text(
                    "Winner",
                    style: TextStyle(
                        color: Colors.grey, fontWeight: FontWeight.bold),
                  ),
                  content: Text(
                    'player' + '  ' + display[2] + '  ' + 'Wins',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  actions: [
                    ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text("OK"))
                  ],
                ));
        updatescore(display[2]);
      });
    }
    if (display[0] == display[4] &&
        display[0] == display[8] &&
        display[0] != '') {
      setState(() {
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  title: Text(
                    "Winner",
                    style: TextStyle(
                        color: Colors.grey, fontWeight: FontWeight.bold),
                  ),
                  content: Text(
                    'player' + '  ' + display[0] + '  ' + 'Wins',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  actions: [
                    ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text("OK"))
                  ],
                ));
        updatescore(display[0]);
      });
    }
    if (display[6] == display[4] &&
        display[6] == display[2] &&
        display[6] != '') {
      setState(() {
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  title: Text(
                    "Winner",
                    style: TextStyle(
                        color: Colors.grey, fontWeight: FontWeight.bold),
                  ),
                  content: Text(
                    'player' + '  ' + display[6] + '  ' + 'Wins',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  actions: [
                    ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text("OK"))
                  ],
                ));
        updatescore(display[6]);
      });
    } else if (filledboxes == 9) {
      setState(() {
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  title: Text(
                    "Winner",
                    style: TextStyle(
                        color: Colors.grey, fontWeight: FontWeight.bold),
                  ),
                  content: Text(
                    "No Player Wins",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  actions: [
                    ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text("OK"))
                  ],
                ));
      });
    }
  }

  void updatescore(String winner) {
    if (winner == 'O') {
      oscore++;
    } else if (winner == 'X') {
      xscore++;
    }
  }
}
