import 'package:flutter/material.dart';
import '../controllers/auth_controller.dart';
import 'register_view.dart';
import 'main_view.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final controller = AuthController();

  Widget input(
    String hint,
    TextEditingController c, {
    bool obscure = false,
  }) {
    return TextField(
      controller: c,
      obscureText: obscure,
      decoration: InputDecoration(
        hintText: hint,
        filled: true,
        fillColor: Colors.grey.shade200,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(24),
          width: 350,
          decoration: BoxDecoration(
            color: Colors.grey.shade100,
            borderRadius: BorderRadius.circular(24),
            boxShadow: const [
              BoxShadow(blurRadius: 10, color: Colors.black12),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "Quizzi",
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
              const SizedBox(height: 30),
              input("Email", emailController),
              const SizedBox(height: 12),
              input(
                "Mật khẩu",
                passwordController,
                obscure: true,
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(14),
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {
                    bool success = controller.login(
                      emailController.text,
                      passwordController.text,
                    );
                    if (success) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Đăng nhập thành công"),
                        ),
                      );
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const MainView(),
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                            "Sai tài khoản hoặc mật khẩu",
                          ),
                        ),
                      );
                    }
                  },
                  child: const Text("Đăng nhập"),
                ),
              ),
              const SizedBox(height: 12),
              const Text("Quên mật khẩu?"),
              const SizedBox(height: 10),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const RegisterView(),
                    ),
                  );
                },
                child: const Text(
                  "Chưa có tài khoản? Đăng ký",
                  style: TextStyle(color: Colors.blue),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
