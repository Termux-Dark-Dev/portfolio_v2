import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfoliov2/utils/fonts.dart';
import 'package:portfoliov2/widgets/appbar.dart';
import 'package:portfoliov2/widgets/drawer.dart';
import 'package:portfoliov2/widgets/show_animated_text.dart';
import 'dart:math' as math;

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      endDrawer: size.width < 700
          ? const CustomDrawer(
              index: 4,
            )
          : null,
      appBar: TAppBar(
        preferredSize: Size(size.width, 100),
        screenName: "Contact",
        child: const SizedBox(),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Transform.rotate(
              angle: -(math.pi / 2),
              child: ShowAnimatedText(
                underline: false,
                child: Text(
                  "contact",
                  style: GoogleFonts.getFont(FontNames.primaryFont,
                      textStyle: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: size.width * 0.02)),
                ),
              )),
          Expanded(
            child: ListView(
              physics: const BouncingScrollPhysics(),
              children: [ContactScreen()],
            ),
          )
        ],
      ),
    );
  }
}

class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key});

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.only(left: size.width * 0.05),
      constraints: BoxConstraints(minHeight: size.height - 100),
      // color: Colors.amber,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ShowAnimatedText(
            underline: false,
            child: Text(
              "Get in touch.",
              style: GoogleFonts.getFont(FontNames.primaryFont,
                  textStyle: TextStyle(
                      fontSize: size.width > 700
                          ? size.width * 0.04
                          : size.width * 0.06,
                      color: Colors.black,
                      fontWeight: FontWeight.w600)),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          FadeInUp(
            duration: const Duration(milliseconds: 900),
            child: Text(
              "Hey there, Got a project,job offer ? Feel free to contact me ASAP.",
              style: GoogleFonts.getFont(FontNames.primaryFont,
                  textStyle: TextStyle(
                      fontSize: size.width > 700
                          ? size.width * 0.015
                          : size.width * 0.04,
                      color: Colors.grey.shade500)),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Form(
            key: formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: size.width * 0.6,
                  child: TextFormField(
                    decoration: InputDecoration(
                        errorStyle: GoogleFonts.getFont(FontNames.primaryFont,
                            textStyle: const TextStyle(color: Colors.red)),
                        hintText: "Your Name",
                        hintStyle: GoogleFonts.getFont(FontNames.primaryFont,
                            textStyle: TextStyle(color: Colors.grey.shade400))),
                    validator: (value) {
                      if (value!.trim().isEmpty) {
                        return "Please enter your name.";
                      }
                      return null;
                    },
                    keyboardType: TextInputType.name,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: size.width * 0.6,
                  child: TextFormField(
                    decoration: InputDecoration(
                        errorStyle: GoogleFonts.getFont(FontNames.primaryFont,
                            textStyle: const TextStyle(color: Colors.red)),
                        hintText: "Email",
                        hintStyle: GoogleFonts.getFont(FontNames.primaryFont,
                            textStyle: TextStyle(color: Colors.grey.shade400))),
                    validator: (value) {
                      if (value!.trim().isEmpty) {
                        return "Please enter a mail.";
                      }
                      String pattern =
                          r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$';
                      RegExp regex = RegExp(pattern);
                      bool isEmail = regex.hasMatch(value.trim());
                      if (isEmail) {
                        return null;
                      }
                      return "Please enter correct email.";
                    },
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: size.width * 0.6,
                  child: TextFormField(
                    decoration: InputDecoration(
                        errorStyle: GoogleFonts.getFont(FontNames.primaryFont,
                            textStyle: const TextStyle(color: Colors.red)),
                        hintText: "Subject",
                        hintStyle: GoogleFonts.getFont(FontNames.primaryFont,
                            textStyle: TextStyle(color: Colors.grey.shade400))),
                    validator: (value) {
                      if (value!.trim().isEmpty) {
                        return "Please enter the subject.";
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: size.width * 0.6,
                  child: TextFormField(
                    decoration: InputDecoration(
                        errorStyle: GoogleFonts.getFont(FontNames.primaryFont,
                            textStyle: const TextStyle(color: Colors.red)),
                        hintText: "Message",
                        hintStyle: GoogleFonts.getFont(FontNames.primaryFont,
                            textStyle: TextStyle(color: Colors.grey.shade400))),
                    validator: (value) {
                      if (value!.trim().isEmpty) {
                        return "Please leave your message.";
                      }
                      return null;
                    },
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),

          // Form Submit Btn
          Container(
            margin: EdgeInsets.only(right: (size.width) - (size.width * 0.72)),
            // color: Colors.amber,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [SubmitBtn(formkey: formkey)],
            ),
          )
        ],
      ),
    );
  }
}

class SubmitBtn extends StatefulWidget {
  final GlobalKey<FormState> formkey;
  const SubmitBtn({super.key, required this.formkey});

  @override
  State<SubmitBtn> createState() => _SubmitBtnState();
}

class _SubmitBtnState extends State<SubmitBtn> {
  var snackBar = const SnackBar(
    backgroundColor: Colors.red,
    content: Text(
      'Something went wrong. Please contact me manually at vishalmspandey@gmail.com',
      style: TextStyle(color: Colors.white),
    ),
  );
  bool _isError = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        if (widget.formkey.currentState!.validate()) {
          if (size.width > 700) {
            setState(() {
              _isError = !_isError;
            });
            return;
          }

          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      },
      child: AnimatedContainer(
        padding: const EdgeInsets.all(10),
        constraints:
            BoxConstraints(minWidth: _isError ? size.width * 0.4 : 100),
        duration: const Duration(milliseconds: 1200),
        decoration: BoxDecoration(
            border: Border.all(color: _isError ? Colors.white : Colors.black),
            borderRadius: BorderRadius.circular(2),
            color: _isError ? Colors.red : Colors.white),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              _isError
                  ? "Something went wrong. Please contact me manually at vishalmspandey@gmail.com"
                  : "Send Message",
              style: TextStyle(
                fontSize:
                    size.width > 700 ? size.width * 0.01 : size.width * 0.02,
                color: _isError ? Colors.white : Colors.black,
              ),
              maxLines: 2,
            ),
            const SizedBox(
              width: 5,
            ),
            Icon(
              _isError ? Icons.delete : Icons.send_rounded,
              color: _isError ? Colors.white : Colors.black,
            )
          ],
        ),
      ),
    );
  }
}
