import 'package:flutter/material.dart';
import 'package:latihan_kuis_a/screen/moviel_list_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}


class _LoginPageState extends State<LoginPage> {
  final TextEditingController userC = TextEditingController();
  final TextEditingController passC = TextEditingController();
  bool isLoggedIn = false;

  void _login(){
    if (userC.text == 'Dira' && passC.text == '052') {
      setState(() {
        isLoggedIn = true;
      });
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => MovieListPage(username: userC.text,)));
    } else {
      setState(() {
        isLoggedIn = false;
      });
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(isLoggedIn ? 'Login Berhasil' : 'Gagal'), 
      backgroundColor: isLoggedIn ? Colors.green : Colors.red,
      ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Login', 
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold
              ),
            ),
            Text("Welcome back to MiniLons!",
            style: TextStyle(
              fontSize: 15
            ),
            ),
            SizedBox(height: 20),
            _usernameField(),
            SizedBox(height: 20),
            _passwordField(),
            SizedBox(height: 20),
            //button buat login
            ElevatedButton(
              //fungsinya ini boss
              onPressed: _login, 
              //styling button kayak gini gaess
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey,
                foregroundColor: Colors.white,
                minimumSize: Size(double.infinity, 45)
              ),
              child: Text('Login')
              ),
          ],
        ),
      ),
    );
  }

  //custom widget buat user field
  Widget _usernameField() {
    return TextField(
            //nambahin controller
            controller: userC,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'username.....',
            ),
    );
  }

  //custom widget buat pass field
  Widget _passwordField() {
    return TextField(
            //nambahin controler
            controller: passC,
            //ini buat nge hide karakter kayak password
            obscureText: true,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'password.....',
            ),
    );
  }
}