import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _nameCtrl = new TextEditingController();
  TextEditingController _emailCtrl = new TextEditingController();
  TextEditingController _passwordCtrl = new TextEditingController();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  _validateFields() {
    final valideSnackBar = SnackBar(
      content: Text(
        "Correcte",
        style: TextStyle(fontSize: 15.0),
      ),
      action: SnackBarAction(
        label: "OK ",
        onPressed: () {},
      ),
      backgroundColor: Colors.green,
    );
    if (_formKey.currentState!.validate()) {
      scaffoldKey.currentState!.showSnackBar(valideSnackBar);
    } else {
      scaffoldKey.currentState!.showSnackBar(
        const SnackBar(content: Text('Error')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: Text("Forms"),
          //centerTitle: true,
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Card(
                elevation: 8.0,
                child: Container(
                    width: 300.0,
                    height: 350,
                    child: Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextFormField(
                                controller: _nameCtrl,
                                validator: (String? value) {
                                  if (value!.isEmpty) {
                                    return "Please enter your name...";
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  hintText: "Name",
                                  border: OutlineInputBorder(),
                                ),
                              ),
                              SizedBox(
                                height: 12,
                              ),
                              TextFormField(
                                controller: _emailCtrl,
                                validator: (String? value) {
                                  if (value!.isEmpty || !value!.contains(".")) {
                                    return "Please enter valid email address!";
                                  }
                                  return null;
                                },
                                keyboardType: TextInputType.emailAddress,
                                decoration: InputDecoration(
                                  hintText: "Email",
                                  border: OutlineInputBorder(),
                                ),
                              ),
                              SizedBox(
                                height: 12,
                              ),
                              TextFormField(
                                controller: _passwordCtrl,
                                validator: (String? value) {
                                  if (value!.isEmpty || value!.length < 6) {
                                    return "Please enter strong password:(";
                                  }
                                  return null;
                                },
                                //keyboardType:TextInputType.visiblePassword ,
                                obscureText: true,

                                decoration: InputDecoration(
                                  hintText: "Password",
                                  border: OutlineInputBorder(),
                                ),
                              ),
                              SizedBox(
                                height: 12,
                              ),
                              InkWell(
                                onTap: _validateFields,
                                child: Container(
                                  height: 50.0,
                                  decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(12.0)),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "Validate",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        )))),
          ),
        ),
      ),
    );
  }
}
