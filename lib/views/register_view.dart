import 'package:flutter/material.dart';
import '../controllers/auth_controller.dart';
import 'login_view.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmController = TextEditingController();
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
              const SizedBox(height: 12),
              input(
                "Xác nhận mật khẩu",
                confirmController,
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
                    bool success = controller.register(
                      emailController.text,
                      passwordController.text,
                      confirmController.text,
                    );

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          success
                              ? "Đăng ký thành công"
                              : "Đăng ký thất bại",
                        ),
                      ),
                    );

                    if (success) {
                      Future.delayed(
                        const Duration(milliseconds: 600),
                        () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const LoginView(),
                            ),
                          );
                        },
                      );
                    }
                  },
                  child: const Text("Đăng ký"),
                ),
              ),
              const SizedBox(height: 12),
              const Text("Quên mật khẩu?"),
              const SizedBox(height: 10),
              Navigator(
                onGenerateRoute: (_) => MaterialPageRoute(
                  builder: (_) => GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Text(
                      "Đã có tài khoản? Đăng nhập",
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
