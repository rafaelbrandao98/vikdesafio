import 'package:desafiovik/app/core/modules/root/root_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../core/shared/constants.dart';
import 'login_store.dart';

class LoginPage extends StatefulWidget {
  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  final LoginStore authStore = Modular.get();
  final RootStore rootStore = Modular.get();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: appColorDeafut,
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.1),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: screenHeight * 0.1,
                  backgroundColor: Colors.white,
                  child: Image.asset(
                    'assets/img/vikLogo.png',
                    width: screenWidth * 0.3,
                  ),
                ),
                SizedBox(height: screenHeight * 0.05),
                TextField(
                  controller: emailController,
                  onChanged: (value) => rootStore.email = value,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    labelText: "E-mail",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.03),
                TextField(
                  controller: passwordController,
                  onChanged: (value) => rootStore.password = value,
                  obscureText: true,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    labelText: "Senha",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.03),
                ElevatedButton(
                  onPressed: () {
                    if (rootStore.password.isNotEmpty &&
                        rootStore.email.isNotEmpty) {
                      rootStore.login(context);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Preencha os campos')),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(
                      vertical: screenHeight * 0.015,
                      horizontal: screenWidth * 0.2,
                    ),
                  ),
                  child: const Text(
                    "Entrar",
                    style: TextStyle(
                        color: appColorDeafut,
                        fontWeight: FontWeight.w600,
                        fontSize: 18),
                  ),
                ),
                SizedBox(height: screenHeight * 0.02),
                TextButton(
                  onPressed: () {
                    Modular.to.pushNamed('/register');
                  },
                  child: const Text(
                    'Criar uma conta',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
