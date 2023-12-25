import 'package:chosen_destine/story_brain.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(ChosenDestine());
}

class ChosenDestine extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      home: StoryPage(),
    );
  }
}
//A new storyBrain object from the StoryBrain class.
StoryBrain storyBrain=StoryBrain();
class StoryPage extends StatefulWidget {
  @override
  State<StoryPage> createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 50.0, horizontal: 15.0),
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                flex: 12,
                child: Center(
                  child: Text(
                    //Using the storyBrain object to get the first story title and display it in this Text Widget.
                    storyBrain.getStory(),
                    style: TextStyle(fontSize: 25.0,color: Colors.white),
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Expanded(
                flex: 2,
                child: Visibility(
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.redAccent,
                    ),
                    onPressed: () {
                      setState(() {
                        storyBrain.nextStory(1);
                      });
                    },
                    child: Text(
                      //Using the storyBrain object to get the first choice1 and display it in this Text Widget.
                      storyBrain.getChoice1(),
                      style: TextStyle(fontSize: 20.0, color: Colors.white),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height:20.0,
              ),
              Expanded(
                flex: 2,
                child: Visibility(
                  visible: storyBrain.buttonMustBeVisible(),
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.teal,
                    ),
                    onPressed: () {
                      setState(() {
                        storyBrain.nextStory(2);
                      });
                    },
                    child: Text(
                      //Using the storyBrain object to get the first choice2 and display it in this Text Widget.
                      storyBrain.getChoice2(),
                      style: TextStyle(fontSize: 20.0, color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
