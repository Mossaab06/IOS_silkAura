import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/views/Screens/page_switcher.dart';
import 'package:e_commerce/views/Screens/verify_email.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../Utils/app_color.dart';
import '../../core/services/authentication.dart';
import 'login_page.dart';
import 'otp_verification_page.dart';

class RegisterPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<RegisterPage> {
  String? errorMessage ='';
  bool isLogin = true;

  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();
    final TextEditingController _controllerFullName= TextEditingController();
  final TextEditingController _controllerUserName = TextEditingController();

  // Future<void> creatUserWithEmailAndPassword() async {
  //   try{
  //     await Auth().creatUserWithEmailAndPassword(email: _controllerEmail.text, password: _controllerPassword.text);
  //
  //   } on FirebaseAuthException catch (e){
  //     setState(() {
  //       errorMessage = e.message;
  //     });
  //   }
  // }
  //  storeUserData()async {
  //    if (Auth().currentUser != null) {
  //     await FirebaseFirestore.instance.collection('Users').doc(Auth().currentUser?.uid).set({
  //       'FullName': _controllerFullName.text,
  //       'UserName': _controllerUserName.text,
  //       'Password': _controllerPassword.text,
  //       'Email': _controllerEmail.text,
  //       // Other user-specific fields can be added here
  //     });
  //    }
  // }
  Future <void> verifyEmail()async {
    bool? emailVerified = await Auth().currentUser?.emailVerified;
    if  (emailVerified==false && Auth().currentUser != null) {
      // Send verification email
      Auth().currentUser?.sendEmailVerification();
      // Navigate to email verification page or show a message
       Navigator.of(context).push(MaterialPageRoute(builder: (context) => EmailVerificationPage()));

    }
  }
  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<Auth>(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text('Sign up', style: TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.w600)),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoginPage()));
          },
          icon: SvgPicture.asset('assets/icons/Arrow-left.svg'),
        ), systemOverlayStyle: SystemUiOverlayStyle.light,
      ),
      bottomNavigationBar: Container(
        width: MediaQuery.of(context).size.width,
        height: 48,
        alignment: Alignment.center,
        child: TextButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoginPage()));
          },
          style: TextButton.styleFrom(
            foregroundColor: AppColor.secondary.withOpacity(0.1),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Already have an account?',
                style: TextStyle(
                  color: AppColor.secondary.withOpacity(0.7),
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                ' Sign in',
                style: TextStyle(
                  color: AppColor.primary,
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
      ),
      body: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.symmetric(horizontal: 24),
        physics: BouncingScrollPhysics(),
        children: [
          // Section 1 - Header
          Container(
            margin: EdgeInsets.only(top: 20, bottom: 12),
            child: Text(
              'Welcome to SilkAura  👋',
              style: TextStyle(
                color: AppColor.secondary,
                fontWeight: FontWeight.w700,
                fontFamily: 'poppins',
                fontSize: 20,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 32),
            child: Text(
              'Register now and let the journey begin!" ',
              style: TextStyle(color: AppColor.secondary.withOpacity(0.7), fontSize: 12, height: 150 / 100),
            ),
          ),
          // Section 2  - Form
          // Full Name
          TextField(
            controller: _controllerFullName,
            autofocus: false,
            decoration: InputDecoration(
              hintText: 'Full Name',
              prefixIcon: Container(
                padding: EdgeInsets.all(12),
                child: SvgPicture.asset('assets/icons/Profile.svg', color: AppColor.primary),
              ),
              contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 14),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColor.border, width: 1),
                borderRadius: BorderRadius.circular(8),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColor.primary, width: 1),
                borderRadius: BorderRadius.circular(8),
              ),
              fillColor: AppColor.primarySoft,
              filled: true,
            ),
          ),
          SizedBox(height: 16),
          // Username
          TextField(
            controller: _controllerUserName,
            autofocus: false,
            decoration: InputDecoration(
              hintText: 'Username',
              prefixIcon: Container(
                padding: EdgeInsets.all(12),
                child: Text('@', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600, color: AppColor.primary)),
              ),
              contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 14),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColor.border, width: 1),
                borderRadius: BorderRadius.circular(8),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColor.primary, width: 1),
                borderRadius: BorderRadius.circular(8),
              ),
              fillColor: AppColor.primarySoft,
              filled: true,
            ),
          ),
          SizedBox(height: 16),
          // Email
          TextField(
            controller: _controllerEmail,
            autofocus: false,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              hintText: 'youremail@email.com',
              prefixIcon: Container(
                padding: EdgeInsets.all(12),
                child: SvgPicture.asset('assets/icons/Message.svg', color: AppColor.primary),
              ),
              contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 14),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColor.border, width: 1),
                borderRadius: BorderRadius.circular(8),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColor.primary, width: 1),
                borderRadius: BorderRadius.circular(8),
              ),
              fillColor: AppColor.primarySoft,
              filled: true,
            ),
          ),
          SizedBox(height: 16),
          // Password
          TextField(
            controller: _controllerPassword,
            autofocus: false,
            obscureText: true,
            decoration: InputDecoration(
              hintText: 'Password',
              prefixIcon: Container(
                padding: EdgeInsets.all(12),
                child: SvgPicture.asset('assets/icons/Lock.svg', color: AppColor.primary),
              ),
              contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 14),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColor.border, width: 1),
                borderRadius: BorderRadius.circular(8),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColor.primary, width: 1),
                borderRadius: BorderRadius.circular(8),
              ),
              fillColor: AppColor.primarySoft,
              filled: true,
              //
              suffixIcon: IconButton(
                onPressed: () {},
                icon: SvgPicture.asset('assets/icons/Hide.svg', color: AppColor.primary),
              ),
            ),
          ),
          SizedBox(height: 16),
          // Repeat Password
          TextField(
            autofocus: false,
            obscureText: true,
            decoration: InputDecoration(
              hintText: 'Repeat Password',
              prefixIcon: Container(
                padding: EdgeInsets.all(12),
                child: SvgPicture.asset('assets/icons/Lock.svg', color: AppColor.primary),
              ),
              contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 14),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColor.border, width: 1),
                borderRadius: BorderRadius.circular(8),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColor.primary, width: 1),
                borderRadius: BorderRadius.circular(8),
              ),
              fillColor: AppColor.primarySoft,
              filled: true,
              //
              suffixIcon: IconButton(
                onPressed: () {},
                icon: SvgPicture.asset('assets/icons/Hide.svg', color: AppColor.primary),
              ),
            ),
          ),
          SizedBox(height: 10),
          Text(errorMessage == ''? '' : 'humm ? $errorMessage'),
          SizedBox(height: 24),

          // Sign Up Button
          ElevatedButton(
            onPressed: () async {
              final error = await auth.createUserWithEmailAndPassword(
                email: _controllerEmail.text,
                password: _controllerPassword.text,
                fullName: _controllerFullName.text,
                userName:_controllerUserName.text,
              );
              if (error != null) {
                setState(() {
                  errorMessage=error;
                });
              } else {
                // Sign up was successful, navigate to the next screen
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => PageSwitcher()),
                );
              }





            },
            child: Text(
              'Sign up',
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 18, fontFamily: 'poppins'),
            ),
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(horizontal: 36, vertical: 18), backgroundColor: AppColor.primary,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              elevation: 0,
              shadowColor: Colors.transparent,
            ),
          ),
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.symmetric(vertical: 16),
            child: Text(
              'or continue with',
              style: TextStyle(fontSize: 12, color: Colors.grey[600]),
            ),
          ),
          // SIgn in With Google
          ElevatedButton(
            onPressed: () {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  'assets/icons/Google.svg',
                ),
                Container(
                  margin: EdgeInsets.only(left: 16),
                  child: Text(
                    'Continue with Google',
                    style: TextStyle(
                      color: AppColor.secondary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                )
              ],
            ),
            style: ElevatedButton.styleFrom(
              foregroundColor: AppColor.primary, padding: EdgeInsets.symmetric(horizontal: 36, vertical: 12), backgroundColor: AppColor.primarySoft,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              elevation: 0,
              shadowColor: Colors.transparent,
            ),
          ),
        ],
      ),
    );
  }
}


