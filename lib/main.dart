import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  String username;
  String passoword;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void showSnackbar(String msg, bool flag) {
    _scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text(msg),
      backgroundColor: (flag) ? Colors.green : Colors.red,
      action: SnackBarAction(
        label: "you",
        textColor: Colors.white,
        onPressed: () {},
      ),
      duration: Duration(seconds: 10),
    ));
  }

  void validate() {
    print("Details");
    username = emailController.text;
    passoword = passwordController.text;
    if (username.isEmpty && passoword.isEmpty) {
      showSnackbar("Fields cannot be empty", false);
    } else {
      showSnackbar(
          " Login details: email: $username password: $passoword", true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.grey.shade900,
      body: Center(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                    child: Image(
                      image: AssetImage('images/rocket.PNG'),
                      height: 200.0,
                      width: 200.0,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 40.0,),
              ListTile(
                title: TextField(
                  textInputAction: TextInputAction.search,
                  keyboardType: TextInputType.emailAddress,
                  controller: emailController,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  decoration: InputDecoration(
                      hintText: "Email",
                      hintStyle: TextStyle(
                        color: Colors.white,
                      ),
                      border: InputBorder.none,
                      icon: Icon(
                        Icons.mail,
                        color: Colors.white,
                      )),
                ),
              ),
              Divider(
                color: Colors.grey.shade300,
              ),
              ListTile(
                title: TextField(
                  obscureText: true,
                  controller: passwordController,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: "Password",
                    hintStyle: TextStyle(
                      color: Colors.white,
                    ),
                    border: InputBorder.none,
                    icon: Icon(
                      Icons.lock,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Divider(
                color: Colors.grey.shade300,
              ),
              SizedBox(
                height: 40.0,
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: RaisedButton(
                      onPressed: validate,
                      color: Colors.cyan,
                      child: Text(
                        "Login",
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 16.0,
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
