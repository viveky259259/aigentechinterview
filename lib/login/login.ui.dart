import 'package:aigen_tech_test/dashboard/dashboard.ui.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class LoginUI extends StatefulWidget {
  @override
  _LoginUIState createState() => _LoginUIState();
}

class _LoginUIState extends State<LoginUI> {
  TextEditingController _emailController;
  TextEditingController _passwordController;
String _testEmail="test@aigen.tech";
String testPassword="AigenTech";
  @override
  void initState() {
    super.initState();
    _emailController=TextEditingController()..text=_testEmail;
    _passwordController=TextEditingController()..text=testPassword;
  }

  void gotoDashboard() {
    if(_emailController.text.compareTo(_testEmail) != 0 && _passwordController.text.compareTo(testPassword)!=0){
        showError();
        return;
    }

    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => DashBoardUi()));
  }

void showError(){
print("err");
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
      
         
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Icon(
                        Icons.mail_outline,
                        size: 32,
                        color: Colors.grey,
                      ),
                      SizedBox(width: 16),
                      Expanded(
                        child: TextField(
                          controller: _emailController,
                            decoration: InputDecoration(hintText: "Email")),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Icon(
                        Icons.lock_outline,
                        size: 32,
                        color: Colors.grey,
                      ),
                      SizedBox(width: 16),
                      Expanded(
                        child: TextField(
                                  controller: _passwordController,
                                  obscureText: true,
                            decoration: InputDecoration(hintText: "Password")),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 32),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8))),
                    padding: EdgeInsets.all(16),
                    child: Text(
                      "Sign In",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    onPressed: () {
                      gotoDashboard();
                    },
                    color: Colors.blue,
                  ),
                ),
                SizedBox(height: 16),
          
          
              ],
            ),
          )
        ],
      ),
    );
  }
}