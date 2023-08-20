// ignore_for_file: use_build_context_synchronously

import "package:flutter/material.dart";
import "package:flutter_catalog/utils/routes.dart";

// stateless widget are those widgets who are not not causing changes in the current screen of the application, and where as if want any change in screen through user input then we can use the stateful widgets

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = " ";
  bool changebutton = false;

  final _formKey = GlobalKey<FormState>(); //its type wil be form state

  moveToHome(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        changebutton = true;
      });

      await Future.delayed(const Duration(seconds: 1));

      await Navigator.pushNamed(context, MyRoutes.homeRoutes);

      setState(() {
        changebutton = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            Image.asset(
              "assets/images/login_image.png",
              fit: BoxFit.cover,
              // width:
              //     1000.0, // all these values are in pixels and should be in double
            ),
            const SizedBox(
              // it creates blank box of size 20 pixel in height
              height: 20.0,
            ),
            Text("Welcome $name",
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
              child: SingleChildScrollView(
                // if anyhow the size of the screen decreases then we can say the button overfow will happen and thus we will use this widget which will give a scrolling option to the small screens
                child: Column(
                  children: [
                    TextFormField(
                        decoration: const InputDecoration(
                          hintText: "Enter Username",
                          labelText: "Username",
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Username cannot be empty!!";
                          }
                          return null;
                        },
                        onChanged: (value) {
                          name = value;
                          setState(
                              () {}); //Notify the framework that the internal state of this object has changed
                        }),

                    TextFormField(
                      obscureText: true,
                      decoration: const InputDecoration(
                        hintText: "Enter Password",
                        labelText: "Password",
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Password cannot be empty!!";
                        } else if (value.length < 6) {
                          return "Password cannot be smaller than 6 characters";
                        }
                        return null;
                      },
                    ),

                    const SizedBox(
                      height: 40.0,
                    ),
                    // now to make the container clickable we will wrap it with Inkwell widget.

                    Material(
                      // since we have already given the decoration to the material so we don't need to do it in the container, otherwise the splash colour won't be visible
                      color: Colors.deepPurple,
                      borderRadius:
                          BorderRadius.circular(changebutton ? 50 : 15),
                      child: InkWell(
                        splashColor: Colors.white,
                        onTap: () => moveToHome(context), //similar to on click

                        child: AnimatedContainer(
                          duration: Duration(seconds: 1),
                          width: changebutton ? 50 : 150,
                          height: changebutton ? 50 : 60,
                          // color: Colors.deepPurple,
                          alignment: Alignment.center,
                          // decoration: BoxDecoration(
                          // color: Colors.deepPurple,
                          // borderRadius:
                          // BorderRadius.circular(changebutton ? 50 : 15),
                          // shape:
                          // changebutton ? BoxShape.circle : BoxShape.rectangle,
                          // ),
                          child: changebutton
                              ? const Icon(
                                  Icons.done,
                                  color: Colors.white,
                                )
                              : const Text(
                                  "LOGIN",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 8,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                        ),
                      ),
                    )
                    // ElevatedButton(
                    //   style: TextButton.styleFrom(
                    //       minimumSize: const Size(50.0, 50.0)),
                    //   onPressed: () {
                    //     // this navigator property will help to goo through the sepcified route and we can go to oher page as well.
                    //     Navigator.pushNamed(context, MyRoutes.homeRoutes);
                    //   },
                    //   child: const Text("Login"),
                    // ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      // child: Center(
      //   child: Text(
      //     "Login page",
      //     style: TextStyle(
      //       color: Colors.blue,
      //       fontWeight: FontWeight.bold,
      //       fontSize: 20, // we are specifying it explicitly.
      //     ),
      //     // textScaleFactor: 2.0, // increase the size of the text by times.
      //   ),
      // ),
    );
  }
}
