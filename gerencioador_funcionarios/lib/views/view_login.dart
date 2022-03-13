import 'package:flutter/material.dart';

class ViewLogin extends StatefulWidget {
  const ViewLogin({Key? key}) : super(key: key);

  @override
  State<ViewLogin> createState() => _ViewLoginState();
}

class _ViewLoginState extends State<ViewLogin> {
   TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerSenha = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            TextField(
              keyboardType: TextInputType.emailAddress,
              controller: controllerEmail,
              decoration: const InputDecoration(
                  hintText: 'Email',
                  labelText: 'Email',
                  suffixIcon: Icon(Icons.mail_outline)),
            ),
            TextField(
              keyboardType: TextInputType.text,
              controller: controllerEmail,
              obscureText: true,
              decoration: const InputDecoration(
                  hintText: 'Senha',
                  labelText: 'Senha',
                  suffixIcon: Icon(Icons.lock_outline)),
            ),
           SizedBox(
             width: double.infinity,
             child:  ElevatedButton(
               
               onPressed: (){}, 
               child: 
            const Padding(
              padding:  EdgeInsets.all(20),
              child: Text('Login'),
            )
            ),
           )
          ],
        ),
      ),
    );
  }
}
