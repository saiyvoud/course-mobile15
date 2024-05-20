import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopgood/provider/auth_provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<AuthProvider>(builder: (context, auth, child) {
        // if(auth.loading == true){

        // }
        return Stack(
          children: [
            Image.asset(
              "assets/images/image-asset.jpeg",
              fit: BoxFit.cover,
              height: 1000,
            ),
            Container(
              height: 900,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      "Login Page",
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Text(
                      "ເບີໂທລະສັບ",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        controller: phoneNumber,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(10),
                          hintText: "209xxxxx",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Text(
                      "ລະຫັດຜ່ານ",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: TextFormField(
                        controller: password,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(10),
                          hintText: "*****",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Row(
                      children: [
                        Checkbox(value: false, onChanged: (e) {}),
                        Text(
                          "ຈຳລະຫັດຜ່ານ",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 10),
                    child: GestureDetector(
                      onTap: () {
                        print("ok");
                        auth.Login(
                            phoneNumber: phoneNumber.text,
                            password: password.text);
                      },
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                            color: Colors.blue.shade200,
                            borderRadius: BorderRadius.circular(10)),
                        child: Center(
                          child: Text(
                            "ເຂົ້າສູ່ລະບົບ",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Divider(
                    endIndent: 80,
                    indent: 80,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 10),
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                          color: Colors.red.shade200,
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                        child: Text(
                          "ລົງທະບຽນ",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      }),
    );
  }
}
