import 'package:cs4990_project/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';
import 'auth.dart';

// running our app
void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Daily Motive',
      theme: new ThemeData(primarySwatch: Colors.grey),
      home: LoginPage(),
      routes: <String, WidgetBuilder>{
        '/LoginPage' : (context) => LoginPage(),
        '/CreateAccount' : (context) => CreateAccount(),
        '/MoodPage' : (context) => MoodPage(),
        '/ProfilePage' : (context) => ProfilePage(),
        '/lonelyVideo1' : (context) => LonelyVideo1(),
        '/lonelyVideo2' : (context) => LonelyVideo2(),
        '/lonelyVideo3' : (context) => LonelyVideo3(),
        '/lazyVideo1' : (context) => LazyVideo1(),
        '/lazyVideo2' : (context) => LazyVideo2(),
        '/lazyVideo3' : (context) => LazyVideo3(),
        '/angryVideo1' : (context) => AngryVideo1(),
        '/angryVideo2' : (context) => AngryVideo2(),
        '/angryVideo3' : (context) => AngryVideo3(),
        '/overwhelmedVideo1' : (context) => OverwhelmedVideo1(),
        '/overwhelmedVideo2' : (context) => OverwhelmedVideo2(),
        '/overwhelmedVideo3' : (context) => OverwhelmedVideo3()
      }
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  State createState() => new LoginPageState();
}

class LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {

  @override
  void initState() {
    super.initState();
  }
  Auth auth = Auth();

  final emailController = TextEditingController();
  final pwController = TextEditingController();


  @override
  Widget build(BuildContext context) {

    return new Scaffold(

      backgroundColor: Colors.white,
      body: new Stack(fit: StackFit.expand, children: <Widget>[
        new Image(
          image: new AssetImage("assets/motivation.jpeg"),
          fit: BoxFit.cover,
          colorBlendMode: BlendMode.darken,
          color: Colors.black87,
        ),
        new Theme(
          data: new ThemeData(
              brightness: Brightness.dark,
              inputDecorationTheme: new InputDecorationTheme(
                // hintStyle: new TextStyle(color: Colors.blue, fontSize: 20.0),
                labelStyle:
                new TextStyle(color: Colors.white, fontSize: 25.0),
              )),
          isMaterialAppTheme: true,
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              new Padding(
                padding: const EdgeInsets.only(top: 60.0),
              ),

              Container(
                child: Stack(
                    children: <Widget>[
                      Container(
                        child: Text(
                            'Daily Motive!',
                            style: TextStyle(fontFamily: 'BalooTammudu2',
                            color: Colors.amber,
                            fontSize: 60.0, fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                        ),
                      )
                    ]
                ),
              ),

              new Container(

                padding: const EdgeInsets.all(40.0),
                child: new Form(
                  autovalidate: true,
                  child: new Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[

                      // email user field
                      new TextFormField(
                        decoration: new InputDecoration(
                            labelText: "Enter Email", fillColor: Colors.white70),
                        keyboardType: TextInputType.emailAddress,
                        controller: emailController,
                      ),

                      // password user field (using obscureText (***))
                      new TextFormField(
                        decoration: new InputDecoration(
                          labelText: "Enter Password",
                        ),
                        obscureText: true,
                        keyboardType: TextInputType.text,
                        controller: pwController,
                      ),

                      new Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                      ),

                      new MaterialButton(
                        height: 50.0,
                        minWidth: 150.0,
                        color: Colors.orange,
                        child: new Text("Login"),
                        splashColor: Colors.red,
                        textColor: Colors.black,
                        onPressed: () async {
                          dynamic output = await auth.signIn(emailController.text, pwController.text);
                          if(output == null)
                          {
                            print("Sign-in error");
                          }
                          else{
                            print("Successfully signed in!");
                            print(output);
                            Navigator.pushNamed(context, '/MoodPage');
                          }
                        },
                      ),


                      new Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                      ),

                      new Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                              'New to Daily Motive?',
                            style: TextStyle(fontFamily: 'BalooTammudu2',
                            color: Colors.white),
                          ),
                          SizedBox(width: 5.0),
                          InkWell(
                            onTap: () {
                              Navigator.pushNamed(context, '/CreateAccount');
                            },
                            child: Text('Create an account',
                            style: TextStyle(
                              color: Colors.green,
                              fontFamily: 'BalooTammudu2',
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline
                            ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ]
      ),
    );
  }
}


class CreateAccount extends StatelessWidget{

  Auth auth = Auth();

  final emailController = TextEditingController();
  final pwController = TextEditingController();


  @override
  Widget build(BuildContext context) {

    return new Scaffold(

      backgroundColor: Colors.white,
      body: new Stack(fit: StackFit.expand, children: <Widget>[
        new Image(
          image: new AssetImage("assets/motivation.jpeg"),
          fit: BoxFit.cover,
          colorBlendMode: BlendMode.darken,
          color: Colors.black87,
        ),
        new Theme(
          data: new ThemeData(
            brightness: Brightness.dark,
            inputDecorationTheme: new InputDecorationTheme(
              // hintStyle: new TextStyle(color: Colors.blue, fontSize: 20.0),
              labelStyle:
              new TextStyle(color: Colors.white, fontSize: 25.0),
            )),
          isMaterialAppTheme: true,
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              new Padding(
                padding: const EdgeInsets.only(top: 100.0),
              ),

              Text(
                'Create an Account:',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.amber,
                  fontFamily: 'BalooTammudu2',
                  height: 1,
                  fontSize: 40,
                  fontWeight: FontWeight.bold),
              ),

              new Container(

                padding: const EdgeInsets.all(40.0),
                child: new Form(
                  autovalidate: true,
                  child: new Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[

                      new Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                      ),

                      // email user field
                      new TextFormField(
                        decoration: new InputDecoration(
                          labelText: "Enter Email", fillColor: Colors.white70),
                        keyboardType: TextInputType.emailAddress,
                        controller: emailController,
                      ),


//                      new Padding(
//                        padding: const EdgeInsets.only(top: 20.0),
//                      ),

                      // password user field (using obscureText (***))
                      new TextFormField(
                        decoration: new InputDecoration(
                          labelText: "Enter Password",
                        ),
                        obscureText: true,
                        keyboardType: TextInputType.text,
                        controller: pwController,
                      ),

                      new Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                      ),

                      new MaterialButton(
                        height: 50.0,
                        minWidth: 150.0,
                        color: Colors.orange,
                        child: new Text("Create Account"),
                        splashColor: Colors.red,
                        textColor: Colors.black,
                        onPressed: () async {
                          dynamic output = await auth.signUp(emailController.text, pwController.text);
                          if(output == null)
                          {
                            print("Error: Could not register new user.");
                          }
                          else{
                            print("Successfully signed up!");
                            print(output);
                            Navigator.pushNamed(context, '/LoginPage');
                          }
                        },
                      ),



                      new Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                      ),


                      MaterialButton(
                        textColor: Colors.black87,
                        color: Colors.orange,
                        child: Text('Back to Login Page'),
                        onPressed: () {
                          Navigator.pushNamed(context, '/LoginPage');
                        },
                      ),


                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ]
      ),
    );
  }
}


class MoodPage extends StatefulWidget {
  @override
  State createState() => new MoodPageState();
}


class MoodPageState extends State<MoodPage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.orange[300],

      body: Center(


        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            Text(
              'How are you feeling today?',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'BalooTammudu2',
                height: 1,
                fontSize: 50,
                fontWeight: FontWeight.bold),
            ),


            new Padding(
              padding: const EdgeInsets.only(top: 60.0),
            ),

            new MaterialButton(
              height: 50.0,
              minWidth: 150.0,
              color: Colors.yellow[100],
              child: new Text("Lonely 😞",
                style: new TextStyle(
                  fontSize: 27.0,
                  color: Colors.black,
                ),
              ),
              splashColor: Colors.black87,
              textColor: Colors.black,
              onPressed: () {
                _incrementCounter();
                Navigator.pushNamed(context, '/lonelyVideo1');
              },
            ),

            new Padding(
              padding: const EdgeInsets.only(top: 30.0),
            ),

            new MaterialButton(
              height: 50.0,
              minWidth: 150.0,
              color: Colors.yellow[100],
              child: new Text("Lazy 😴",
                style: new TextStyle(
                  fontSize: 30.0,
                  color: Colors.black,
                ),
              ),
              splashColor: Colors.black87,
              textColor: Colors.black,
              onPressed: () {
                _incrementCounter();
                Navigator.pushNamed(context, '/lazyVideo1');
              },
            ),


            new Padding(
              padding: const EdgeInsets.only(top: 30.0),
            ),


            new MaterialButton(
              height: 50.0,
              minWidth: 150.0,
              color: Colors.yellow[100],
              child: new Text("Angry 🤬",
                style: new TextStyle(
                  fontSize: 26.0,
                  color: Colors.black87,
                ),
              ),
              splashColor: Colors.black,
              textColor: Colors.black,
              onPressed: () {
                _incrementCounter();
                Navigator.pushNamed(context, '/angryVideo1');
              },
            ),

            new Padding(
              padding: const EdgeInsets.only(top: 30.0),
            ),

            new MaterialButton(
              height: 50.0,
              minWidth: 150.0,
              color: Colors.yellow[100],
              child: new Text("Overwhelmed 😣",
                style: new TextStyle(
                  fontSize: 15.5,
                  color: Colors.black87,
                ),
              ),
              splashColor: Colors.black,
              textColor: Colors.black,
              onPressed: () {
                _incrementCounter();
                Navigator.pushNamed(context, '/overwhelmedVideo1');
              },
            ),

            new Padding(
              padding: const EdgeInsets.only(top: 60.0),
            ),

            MaterialButton(
              textColor: Colors.black87,
              color: Colors.redAccent,
              child: Text('Profile Page'),
              onPressed: () {
                Navigator.pushNamed(context, '/ProfilePage');
              },
            ),

            new Padding(
              padding: const EdgeInsets.only(top: 20.0),
            ),


            MaterialButton(
              textColor: Colors.black87,
              color: Colors.redAccent,
              child: Text('Back to Login Page'),
              onPressed: () {
                Navigator.pushNamed(context, '/LoginPage');
              },
            ),


          ],
        ),
      ),
    );
  }
}

class BadOverlayWindow extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => BadOverlayWindowState();
}

class OkayOverlayWindow extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => OkayOverlayWindowState();
}

class GoodOverlayWindow extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => GoodOverlayWindowState();
}

class BadOverlayWindowState extends State<BadOverlayWindow>
  with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> scaleAnimation;

  @override
  void initState() {
    super.initState();

    controller =
      AnimationController(vsync: this, duration: Duration(milliseconds: 450));
    scaleAnimation =
      CurvedAnimation(parent: controller, curve: Curves.elasticInOut);

    controller.addListener(() {
      setState(() {});
    });

    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        color: Colors.transparent,
        child: ScaleTransition(
          scale: scaleAnimation,
          child: Container(
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0))),
            child: Padding(
              padding: const EdgeInsets.all(50.0),
              child: Text("Loneliness (Video 1) or Angry (Video 1): It'll be alright, we've all had those days. "
                "If you keep your head up, watch some videos, and take some time to relax, you will "
                "start to feel better in no time."),
            ),
          ),
        ),
      ),
    );
  }
}


class OkayOverlayWindowState extends State<OkayOverlayWindow>
  with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> scaleAnimation;

  @override
  void initState() {
    super.initState();

    controller =
      AnimationController(vsync: this, duration: Duration(milliseconds: 450));
    scaleAnimation =
      CurvedAnimation(parent: controller, curve: Curves.elasticInOut);

    controller.addListener(() {
      setState(() {});
    });

    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        color: Colors.transparent,
        child: ScaleTransition(
          scale: scaleAnimation,
          child: Container(
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0))),
            child: Padding(
              padding: const EdgeInsets.all(50.0),
              child: Text("Overwhelmed (Video 3): Watch a video, it could really help you. "
                "Be proud of yourself and never have a day that makes you feel overwhelmed or just 'okay'."),
            ),
          ),
        ),
      ),
    );
  }
}


class GoodOverlayWindowState extends State<GoodOverlayWindow>
  with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> scaleAnimation;

  @override
  void initState() {
    super.initState();

    controller =
      AnimationController(vsync: this, duration: Duration(milliseconds: 450));
    scaleAnimation =
      CurvedAnimation(parent: controller, curve: Curves.elasticInOut);

    controller.addListener(() {
      setState(() {});
    });

    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        color: Colors.transparent,
        child: ScaleTransition(
          scale: scaleAnimation,
          child: Container(
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0))),
            child: Padding(
              padding: const EdgeInsets.all(50.0),
              child: Text("Laziness (Video 3): Lets turn that good into great! "
                "Keep up the motivation, and don't forget what's important in your daily priorities."),
            ),
          ),
        ),
      ),
    );
  }
}


class ProfilePage extends StatefulWidget {
  @override
  State createState() => new ProfilePageState();
}


class ProfilePageState extends State<ProfilePage> {

  List<String> _moods = ['Bad 😭', 'Okay 😐', 'Good 😊'];
  String _selectedMoods;

  @override
  Widget build(BuildContext context){
    return Scaffold(

      backgroundColor: Colors.orange[300],

      body: Center(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            Text(
              'Profile Page',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'BalooTammudu2',
                height: 1,
                fontSize: 35,
                fontWeight: FontWeight.bold),
            ),


            new Padding(
              padding: const EdgeInsets.only(top: 20.0),
            ),

          CircleAvatar(
            radius: 70,
            backgroundImage: NetworkImage('https://www.pngjoy.com/pngm/136/2750635_gray-circle-login-user-icon-png-transparent-png.png'),
          ),

            new Padding(
              padding: const EdgeInsets.only(top: 70.0),
            ),

            Text(
              'Personalized Choices',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'BalooTammudu2',
                height: 1,
                fontSize: 35,
                fontWeight: FontWeight.bold),
            ),

            Text(
              'Focus on what matters',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'BalooTammudu2',
                height: 1,
                fontSize: 20,
                fontWeight: FontWeight.bold),
            ),

            DropdownButton(
              hint: Text('Pick a mood'), // Not necessary for Option 1
              value: _selectedMoods,
              onChanged: (newValue) {
                setState(() {
                  _selectedMoods = newValue;
                });
              },
              items: _moods.map((mood) {
                return DropdownMenuItem(
                  child: new Text(mood),
                  value: mood,
                );
              }).toList(),
            ),


            new FlatButton.icon(
              icon: Icon(Icons.mood),
              label: Text('Generate!'),
              color: Colors.yellow[100],
              textColor: Colors.black,

              onPressed:(){
                if(_selectedMoods == 'Bad 😭'){
                  showDialog(
                    context: context,
                    builder: (_) => BadOverlayWindow(),

                  );
                }

                if(_selectedMoods == 'Okay 😐'){
                  showDialog(
                    context: context,
                    builder: (_) => OkayOverlayWindow(),

                  );
                }

                if(_selectedMoods == 'Good 😊'){
                  showDialog(
                    context: context,
                    builder: (_) => GoodOverlayWindow(),

                  );
                }

              }),


            new Padding(
              padding: const EdgeInsets.only(top: 100.0),
            ),



            new Padding(
              padding: const EdgeInsets.only(top: 0.0),
            ),

            MaterialButton(
              textColor: Colors.black87,
              color: Colors.redAccent,
              child: Text('Back to Mood Page'),
              onPressed: () {
                Navigator.pushNamed(context, '/MoodPage');
              },
            ),
        ]
      ),
      ),
    );
  }
}


class LonelyVideo1 extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.orange[300],

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

          Text('Loneliness (TED Talk)',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'BalooTammudu2',
              height: 1,
              fontSize: 35,
              fontWeight: FontWeight.bold),),

            Text('Explained by Dr. Olivia Remes',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'BalooTammudu2',
                height: 1,
                fontSize: 25,
                fontWeight: FontWeight.bold),),

            new Padding(
              padding: const EdgeInsets.only(top: 40.0),
            ),


          ChewieListItem(
            videoPlayerController: VideoPlayerController.asset(
              'assets/lonelyVideo1.mp4',
            ),
            looping: true,
          ),

            MaterialButton(
              textColor: Colors.black,
              color: Colors.yellow[100],
              child: Text('Video 2'),
              onPressed: () {
                Navigator.pushNamed(context, '/lonelyVideo2');
              }
            ),

            MaterialButton(
              textColor: Colors.black,
              color: Colors.yellow[100],
              child: Text('Video 3'),
              onPressed: () {
                Navigator.pushNamed(context, '/lonelyVideo3');
              }
            ),

            new Padding(
              padding: const EdgeInsets.only(top: 50.0),
            ),

            MaterialButton(
              textColor: Colors.black87,
              color: Colors.redAccent,
              child: Text('Back to Mood Page'),
              onPressed: () {
                Navigator.pushNamed(context, '/MoodPage');
              },
            ),
          ]
        )
      )
    );
  }
}

class LonelyVideo2 extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.orange[300],

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Dealing with Loneliness',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'BalooTammudu2',
                height: 1,
                fontSize: 35,
                fontWeight: FontWeight.bold),),

            Text('And what you can do',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'BalooTammudu2',
                height: 1,
                fontSize: 25,
                fontWeight: FontWeight.bold),),

            new Padding(
              padding: const EdgeInsets.only(top: 40.0),
            ),


            ChewieListItem(
              videoPlayerController: VideoPlayerController.asset(
                'assets/lonelyVideo2.mp4',
              ),
              looping: true,
            ),

            MaterialButton(
              textColor: Colors.black,
              color: Colors.yellow[100],
              child: Text('Video 1'),
              onPressed: () {
                Navigator.pushNamed(context, '/lonelyVideo1');
              }
            ),

            MaterialButton(
              textColor: Colors.black,
              color: Colors.yellow[100],
              child: Text('Video 3'),
              onPressed: () {
                Navigator.pushNamed(context, '/lonelyVideo3');
              }
            ),

            new Padding(
              padding: const EdgeInsets.only(top: 50.0),
            ),

            MaterialButton(
              textColor: Colors.black87,
              color: Colors.redAccent,
              child: Text('Back to Mood Page'),
              onPressed: () {
                Navigator.pushNamed(context, '/MoodPage');
              },
            ),
          ]
        )
      )
    );
  }
}

class LonelyVideo3 extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.orange[300],

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('3 Ways to Stop Feeling Lonely ',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'BalooTammudu2',
                height: 1,
                fontSize: 35,
                fontWeight: FontWeight.bold),),

            Text('So you can feel belonging',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'BalooTammudu2',
                height: 1,
                fontSize: 25,
                fontWeight: FontWeight.bold),),

            new Padding(
              padding: const EdgeInsets.only(top: 40.0),
            ),


            ChewieListItem(
              videoPlayerController: VideoPlayerController.asset(
                'assets/lonelyVideo3.mp4',
              ),
              looping: true,
            ),

            MaterialButton(
              textColor: Colors.black,
              color: Colors.yellow[100],
              child: Text('Video 1'),
              onPressed: () {
                Navigator.pushNamed(context, '/lonelyVideo1');
              }
            ),

            MaterialButton(
              textColor: Colors.black,
              color: Colors.yellow[100],
              child: Text('Video 2'),
              onPressed: () {
                Navigator.pushNamed(context, '/lonelyVideo2');
              }
            ),

            new Padding(
              padding: const EdgeInsets.only(top: 50.0),
            ),

            MaterialButton(
              textColor: Colors.black87,
              color: Colors.redAccent,
              child: Text('Back to Mood Page'),
              onPressed: () {
                Navigator.pushNamed(context, '/MoodPage');
              },
            ),
          ]
        )
      )
    );
  }
}



class LazyVideo1 extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.orange[300],

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Laziness: Avoid It ',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'BalooTammudu2',
                height: 1,
                fontSize: 35,
                fontWeight: FontWeight.bold),),

            Text('Use your day wisely',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'BalooTammudu2',
                height: 1,
                fontSize: 22,
                fontWeight: FontWeight.bold),),

            new Padding(
              padding: const EdgeInsets.only(top: 40.0),
            ),


            ChewieListItem(
              videoPlayerController: VideoPlayerController.asset(
                'assets/lazyVideo1.mp4',
              ),
              looping: true,
            ),

            MaterialButton(
              textColor: Colors.black,
              color: Colors.yellow[100],
              child: Text('Video 2'),
              onPressed: () {
                Navigator.pushNamed(context, '/lazyVideo2');
              }
            ),

            MaterialButton(
              textColor: Colors.black,
              color: Colors.yellow[100],
              child: Text('Video 3'),
              onPressed: () {
                Navigator.pushNamed(context, '/lazyVideo3');
              }
            ),

            new Padding(
              padding: const EdgeInsets.only(top: 50.0),
            ),

            MaterialButton(
              textColor: Colors.black87,
              color: Colors.redAccent,
              child: Text('Back to Mood Page'),
              onPressed: () {
                Navigator.pushNamed(context, '/MoodPage');
              },
            ),
          ]
        )
      )
    );
  }
}



class LazyVideo2 extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.orange[300],

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Watch When You Feel Lazy ',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'BalooTammudu2',
                height: 1,
                fontSize: 35,
                fontWeight: FontWeight.bold),),

            Text('The best workout motivation',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'BalooTammudu2',
                height: 1,
                fontSize: 25,
                fontWeight: FontWeight.bold),),

            new Padding(
              padding: const EdgeInsets.only(top: 40.0),
            ),


            ChewieListItem(
              videoPlayerController: VideoPlayerController.asset(
                'assets/lazyVideo2.mp4',
              ),
              looping: true,
            ),

            MaterialButton(
              textColor: Colors.black,
              color: Colors.yellow[100],
              child: Text('Video 1'),
              onPressed: () {
                Navigator.pushNamed(context, '/lazyVideo1');
              }
            ),

            MaterialButton(
              textColor: Colors.black,
              color: Colors.yellow[100],
              child: Text('Video 3'),
              onPressed: () {
                Navigator.pushNamed(context, '/lazyVideo3');
              }
            ),

            new Padding(
              padding: const EdgeInsets.only(top: 50.0),
            ),

            MaterialButton(
              textColor: Colors.black87,
              color: Colors.redAccent,
              child: Text('Back to Mood Page'),
              onPressed: () {
                Navigator.pushNamed(context, '/MoodPage');
              },
            ),
          ]
        )
      )
    );
  }
}



class LazyVideo3 extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.orange[300],

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('NO EXCUSES',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'BalooTammudu2',
                height: 1,
                fontSize: 35,
                fontWeight: FontWeight.bold),),

            Text('Watch before you say anything',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'BalooTammudu2',
                height: 1,
                fontSize: 25,
                fontWeight: FontWeight.bold),),

            new Padding(
              padding: const EdgeInsets.only(top: 40.0),
            ),


            ChewieListItem(
              videoPlayerController: VideoPlayerController.asset(
                'assets/lazyVideo3.mp4',
              ),
              looping: true,
            ),

            MaterialButton(
              textColor: Colors.black,
              color: Colors.yellow[100],
              child: Text('Video 1'),
              onPressed: () {
                Navigator.pushNamed(context, '/lazyVideo1');
              }
            ),

            MaterialButton(
              textColor: Colors.black,
              color: Colors.yellow[100],
              child: Text('Video 2'),
              onPressed: () {
                Navigator.pushNamed(context, '/lazyVideo2');
              }
            ),

            new Padding(
              padding: const EdgeInsets.only(top: 50.0),
            ),

            MaterialButton(
              textColor: Colors.black87,
              color: Colors.redAccent,
              child: Text('Back to Mood Page'),
              onPressed: () {
                Navigator.pushNamed(context, '/MoodPage');
              },
            ),
          ]
        )
      )
    );
  }
}



class AngryVideo1 extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.orange[300],

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Anger: How to Control It',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'BalooTammudu2',
                height: 1,
                fontSize: 35,
                fontWeight: FontWeight.bold),),

            Text('And why its important',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'BalooTammudu2',
                height: 1,
                fontSize: 25,
                fontWeight: FontWeight.bold),),

            new Padding(
              padding: const EdgeInsets.only(top: 40.0),
            ),


            ChewieListItem(
              videoPlayerController: VideoPlayerController.asset(
                'assets/angryVideo1.mp4',
              ),
              looping: true,
            ),

            MaterialButton(
              textColor: Colors.black,
              color: Colors.yellow[100],
              child: Text('Video 2'),
              onPressed: () {
                Navigator.pushNamed(context, '/angryVideo2');
              }
            ),

            MaterialButton(
              textColor: Colors.black,
              color: Colors.yellow[100],
              child: Text('Video 3'),
              onPressed: () {
                Navigator.pushNamed(context, '/angryVideo3');
              }
            ),

            new Padding(
              padding: const EdgeInsets.only(top: 50.0),
            ),

            MaterialButton(
              textColor: Colors.black87,
              color: Colors.redAccent,
              child: Text('Back to Mood Page'),
              onPressed: () {
                Navigator.pushNamed(context, '/MoodPage');
              },
            ),
          ]
        )
      )
    );
  }
}

class AngryVideo2 extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.orange[300],

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('The Magic Pause',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'BalooTammudu2',
                height: 1,
                fontSize: 35,
                fontWeight: FontWeight.bold),),

            Text('Take a step back and evaluate',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'BalooTammudu2',
                height: 1,
                fontSize: 25,
                fontWeight: FontWeight.bold),),

            new Padding(
              padding: const EdgeInsets.only(top: 40.0),
            ),


            ChewieListItem(
              videoPlayerController: VideoPlayerController.asset(
                'assets/angryVideo2.mp4',
              ),
              looping: true,
            ),

            MaterialButton(
              textColor: Colors.black,
              color: Colors.yellow[100],
              child: Text('Video 1'),
              onPressed: () {
                Navigator.pushNamed(context, '/angryVideo1');
              }
            ),

            MaterialButton(
              textColor: Colors.black,
              color: Colors.yellow[100],
              child: Text('Video 3'),
              onPressed: () {
                Navigator.pushNamed(context, '/angryVideo3');
              }
            ),

            new Padding(
              padding: const EdgeInsets.only(top: 50.0),
            ),

            MaterialButton(
              textColor: Colors.black87,
              color: Colors.redAccent,
              child: Text('Back to Mood Page'),
              onPressed: () {
                Navigator.pushNamed(context, '/MoodPage');
              },
            ),
          ]
        )
      )
    );
  }
}


class AngryVideo3 extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.orange[300],

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Experiencing Anger',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'BalooTammudu2',
                height: 1,
                fontSize: 35,
                fontWeight: FontWeight.bold),),

            Text('Causes and effects',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'BalooTammudu2',
                height: 1,
                fontSize: 25,
                fontWeight: FontWeight.bold),),

            new Padding(
              padding: const EdgeInsets.only(top: 40.0),
            ),


            ChewieListItem(
              videoPlayerController: VideoPlayerController.asset(
                'assets/angryVideo3.mp4',
              ),
              looping: true,
            ),

            MaterialButton(
              textColor: Colors.black,
              color: Colors.yellow[100],
              child: Text('Video 2'),
              onPressed: () {
                Navigator.pushNamed(context, '/angryVideo2');
              }
            ),

            MaterialButton(
              textColor: Colors.black,
              color: Colors.yellow[100],
              child: Text('Video 3'),
              onPressed: () {
                Navigator.pushNamed(context, '/angryVideo3');
              }
            ),

            new Padding(
              padding: const EdgeInsets.only(top: 50.0),
            ),

            MaterialButton(
              textColor: Colors.black87,
              color: Colors.redAccent,
              child: Text('Back to Mood Page'),
              onPressed: () {
                Navigator.pushNamed(context, '/MoodPage');
              },
            ),
          ]
        )
      )
    );
  }
}

class OverwhelmedVideo1 extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.orange[300],

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Mel Robbins: Overwhelmed',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'BalooTammudu2',
                height: 1,
                fontSize: 35,
                fontWeight: FontWeight.bold),),

            Text('How to avoid it',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'BalooTammudu2',
                height: 1,
                fontSize: 25,
                fontWeight: FontWeight.bold),),

            new Padding(
              padding: const EdgeInsets.only(top: 40.0),
            ),


            ChewieListItem(
              videoPlayerController: VideoPlayerController.asset(
                'assets/overwhelmedVideo1.mp4',
              ),
              looping: true,
            ),

            MaterialButton(
              textColor: Colors.black,
              color: Colors.yellow[100],
              child: Text('Video 2'),
              onPressed: () {
                Navigator.pushNamed(context, '/overwhelmedVideo2');
              }
            ),

            MaterialButton(
              textColor: Colors.black,
              color: Colors.yellow[100],
              child: Text('Video 3'),
              onPressed: () {
                Navigator.pushNamed(context, '/overwhelmedVideo3');
              }
            ),

            new Padding(
              padding: const EdgeInsets.only(top: 50.0),
            ),

            MaterialButton(
              textColor: Colors.black87,
              color: Colors.redAccent,
              child: Text('Back to Mood Page'),
              onPressed: () {
                Navigator.pushNamed(context, '/MoodPage');
              },
            ),
          ]
        )
      )
    );
  }
}


class OverwhelmedVideo2 extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.orange[300],

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('You Have Control Over It',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'BalooTammudu2',
                height: 1,
                fontSize: 35,
                fontWeight: FontWeight.bold),),

            Text('Described by Rachel Hollis and Lewis Howes',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'BalooTammudu2',
                height: 1,
                fontSize: 25,
                fontWeight: FontWeight.bold),),

            new Padding(
              padding: const EdgeInsets.only(top: 40.0),
            ),


            ChewieListItem(
              videoPlayerController: VideoPlayerController.asset(
                'assets/overwhelmedVideo2.mp4',
              ),
              looping: true,
            ),

            MaterialButton(
              textColor: Colors.black,
              color: Colors.yellow[100],
              child: Text('Video 1'),
              onPressed: () {
                Navigator.pushNamed(context, '/overwhelmedVideo1');
              }
            ),

            MaterialButton(
              textColor: Colors.black,
              color: Colors.yellow[100],
              child: Text('Video 3'),
              onPressed: () {
                Navigator.pushNamed(context, '/overwhelmedVideo3');
              }
            ),

            new Padding(
              padding: const EdgeInsets.only(top: 50.0),
            ),

            MaterialButton(
              textColor: Colors.black87,
              color: Colors.redAccent,
              child: Text('Back to Mood Page'),
              onPressed: () {
                Navigator.pushNamed(context, '/MoodPage');
              },
            ),
          ]
        )
      )
    );
  }
}


class OverwhelmedVideo3 extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.orange[300],

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Own it. Vent it. Do it.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'BalooTammudu2',
                height: 1,
                fontSize: 35,
                fontWeight: FontWeight.bold),),

            Text('Understand your frustration',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'BalooTammudu2',
                height: 1,
                fontSize: 25,
                fontWeight: FontWeight.bold),),

            new Padding(
              padding: const EdgeInsets.only(top: 40.0),
            ),


            ChewieListItem(
              videoPlayerController: VideoPlayerController.asset(
                'assets/overwhelmedVideo3.mp4',
              ),
              looping: true,
            ),

            MaterialButton(
              textColor: Colors.black,
              color: Colors.yellow[100],
              child: Text('Video 1'),
              onPressed: () {
                Navigator.pushNamed(context, '/overwhelmedVideo1');
              }
            ),

            MaterialButton(
              textColor: Colors.black,
              color: Colors.yellow[100],
              child: Text('Video 2'),
              onPressed: () {
                Navigator.pushNamed(context, '/overwhelmedVideo2');
              }
            ),

            new Padding(
              padding: const EdgeInsets.only(top: 50.0),
            ),

            MaterialButton(
              textColor: Colors.black87,
              color: Colors.redAccent,
              child: Text('Back to Mood Page'),
              onPressed: () {
                Navigator.pushNamed(context, '/MoodPage');
              },
            ),
          ]
        )
      )
    );
  }
}