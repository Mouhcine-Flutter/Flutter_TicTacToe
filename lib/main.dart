import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isCross = true;
  late String message;
  late List<String> gameState;

  @override
  void initState() {
    super.initState();
    setState(() {
      gameState = [
        'empty',
        'empty',
        'empty',
        'empty',
        'empty',
        'empty',
        'empty',
        'empty',
        'empty',
      ];
      message= '';
    });
  }

  playGame(int index){
    if(gameState[index]=='empty'){
      setState(() {
        if(isCross){
          gameState[index]='cross';
        }else{
          gameState[index]='circle';
        }
        isCross = !isCross;
        checkWin();
      });
    }
  }

  checkWin() {

    if ((gameState[0] != 'empty') &&
        (gameState[0] == gameState[1]) &&
        (gameState[1] == gameState[2])) {
      // if any user Win update the message state
      setState(() {
        message = '${gameState[0]} wins';
        delay();
      });
    } else if ((gameState[3] != 'empty') &&
        (gameState[3] == gameState[4]) &&
        (gameState[4] == gameState[5])) {
      setState(() {
        message = '${gameState[3]} wins';
        delay();

      });
    } else if ((gameState[6] != 'empty') &&
        (gameState[6] == gameState[7]) &&
        (gameState[7] == gameState[8])) {
      setState(() {
        message = '${gameState[6]} wins';
        delay();

      });
    } else if ((gameState[0] != 'empty') &&
        (gameState[0] == gameState[3]) &&
        (gameState[3] == gameState[6])) {
      setState(() {
        message = '${gameState[0]} wins';
        delay();

      });
    } else if ((gameState[1] != 'empty') &&
        (gameState[1] == gameState[4]) &&
        (gameState[4] == gameState[7])) {
      setState(() {
        message = '${gameState[1]} wins';
        delay();

      });
    } else if ((gameState[2] != 'empty') &&
        (gameState[2] == gameState[5]) &&
        (gameState[5] == gameState[8])) {
      setState(() {
        message = '${gameState[2]} wins';
        delay();

      });
    } else if ((gameState[0] != 'empty') &&
        (gameState[0] == gameState[4]) &&
        (gameState[4] == gameState[8])) {
      setState(() {
        message = '${gameState[0]} wins';
        delay();

      });
    } else if ((gameState[2] != 'empty') &&
        (gameState[2] == gameState[4]) &&
        (gameState[4] == gameState[6])) {
      setState(() {
        message = '${gameState[2]} wins';
        delay();

      });
    } else if (!gameState.contains('empty')) {
      setState(() {
        message = 'Game Draw';
        delay();

      });
    }
  }

  delay(){
    Future.delayed(const Duration(milliseconds: 1600),(){
      setState(() {
        resetGame();
      });
    });
  }

  resetGame(){
    setState(() {
      gameState = [
        'empty',
        'empty',
        'empty',
        'empty',
        'empty',
        'empty',
        'empty',
        'empty',
        'empty',
      ];
      message= '';
    });
  }

  Icon getIcon(String value) {
    switch (value) {
      case ('empty'):
        return Icon(Icons.crop_square,size: 108,color: Colors.grey[350]);
        break;
      case ('cross'):
        return Icon(Icons.clear,size: 108,color: Colors.red);
        break;
      case ('circle'):
        return Icon(Icons.circle_outlined,size: 108,color: Colors.green);
        break;
      default: return Icon(Icons.crop_square,size: 108,color: Colors.grey);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: Text('Tic Tac Toe'), backgroundColor: Colors.grey[700],),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: (){
            resetGame();
          },
          icon: Icon(Icons.refresh),  
          label: Text("Reset"),  
          backgroundColor: Colors.red,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20.0),
              child: Text(
                message,
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              child: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3,),itemCount: 9, itemBuilder: (context,i){
                return SizedBox(
                  width: 100,
                  height: 100,
                  child: MaterialButton(
                      child: getIcon(gameState[i]),
                      onPressed: (){
                        playGame(i);
                      }),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
