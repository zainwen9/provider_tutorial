import 'package:flutter/material.dart';
import 'package:provider_app/provider/authProvider.dart';
import 'package:provider/provider.dart';


class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController emailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final authProvider=Provider.of<AuthProvider>(context);
    return Scaffold(
      appBar: AppBar(title: Text('Login'),centerTitle: true,),
      body: Padding(
        padding:  EdgeInsets.all(20),
        child:  Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              controller: emailController,
              decoration:const InputDecoration(
                hintText: 'email'
              ),
            ),

            TextField(
              controller: passwordController,
              decoration:const InputDecoration(
                  hintText: 'password'
              ),
            ),

            const SizedBox(height: 20,),

            InkWell(
              onTap: (){
                authProvider.login(emailController.text.toString(), passwordController.text.toString(),);
              },
              child: Container(
                height: 50,
                width: 150,
                decoration: BoxDecoration(color: Colors.teal,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child:authProvider.loading?CircularProgressIndicator(color: Colors.white,): Text('Login'),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
