import 'package:actividad_1/controller/auth_controller.dart';
import 'package:actividad_1/view/home_menu_view.dart';
import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> with TickerProviderStateMixin {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FocusNode _usernameFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();

  bool _isLoading = false;
  String? _errorMessage;
  bool _passwordVisible = false;

  late AnimationController _containerAnimationController;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    _usernameController.text = '';
    _passwordController.text = '';

    _containerAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.5),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _containerAnimationController,
      curve: Curves.easeOutQuart,
    ));

    _fadeAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(
      parent: _containerAnimationController,
      curve: Curves.easeInOut,
    ));

    Future.delayed(const Duration(milliseconds: 300), () {
      _containerAnimationController.forward();
      _usernameFocusNode.requestFocus();
    });
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    _usernameFocusNode.dispose();
    _passwordFocusNode.dispose();
    _containerAnimationController.dispose();
    super.dispose();
  }

  void _login() async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    final success = await AuthController.login(
      _usernameController.text,
      _passwordController.text,
    );

    setState(() {
      _isLoading = false;
    });

    if (success) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const HomeMenuView()),
      );
    } else {
      setState(() {
        _errorMessage = 'Usuario o contraseña incorrectos';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Stack(
          children: [
            Positioned(
              bottom: -screenHeight * 0.2,
              left: -screenHeight * 0.2,
              child: Container(
                width: screenHeight * 0.6,
                height: screenHeight * 0.6,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey[300],
                ),
              ),
            ),
            Positioned(
              top: -screenHeight * 0.1,
              right: -screenHeight * 0.1,
              child: Container(
                width: screenHeight * 0.4,
                height: screenHeight * 0.4,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey[400],
                ),
              ),
            ),
            SingleChildScrollView(
              child: SizedBox(
                height: screenHeight,
                child: Column(
                  children: [
                    SizedBox(height: screenHeight * 0.2),
                    SlideTransition(
                      position: _slideAnimation,
                      child: FadeTransition(
                        opacity: _fadeAnimation,
                        child: Text(
                          'Bienvenido',
                          style: theme.textTheme.headlineSmall?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[800],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    SlideTransition(
                      position: _slideAnimation,
                      child: FadeTransition(
                        opacity: _fadeAnimation,
                        child: Text(
                          'Ingrese sus credenciales para continuar',
                          style: theme.textTheme.bodyMedium?.copyWith(
                            color: Colors.grey[700],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 40),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: SlideTransition(
                        position: _slideAnimation,
                        child: FadeTransition(
                          opacity: _fadeAnimation,
                          child: Column(
                            children: [
                              TextField(
                                controller: _usernameController,
                                focusNode: _usernameFocusNode,
                                decoration: InputDecoration(
                                  labelText: 'Usuario',
                                  hintText: 'Ingrese su usuario',
                                  prefixIcon: const Icon(Icons.person),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: BorderSide(
                                      color: Colors.grey[800]!,
                                      width: 2,
                                    ),
                                  ),
                                ),
                                onSubmitted: (_) =>
                                    _passwordFocusNode.requestFocus(),
                              ),
                              const SizedBox(height: 20),
                              TextField(
                                controller: _passwordController,
                                focusNode: _passwordFocusNode,
                                obscureText: !_passwordVisible,
                                decoration: InputDecoration(
                                  labelText: 'Contraseña',
                                  hintText: 'Ingrese su contraseña',
                                  prefixIcon: const Icon(Icons.lock),
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                      _passwordVisible
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                      color: Colors.grey,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        _passwordVisible = !_passwordVisible;
                                      });
                                    },
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: BorderSide(
                                      color: Colors.grey[800]!,
                                      width: 2,
                                    ),
                                  ),
                                ),
                                onSubmitted: (_) => _login(),
                              ),
                              const SizedBox(height: 20),
                              if (_errorMessage != null)
                                Text(
                                  _errorMessage!,
                                  style: const TextStyle(
                                    color: Colors.grey,
                                  ),
                                ),
                              const SizedBox(height: 20),
                              SizedBox(
                                width: double.infinity,
                                child: ElevatedButton(
                                  onPressed: _isLoading ? null : _login,
                                  style: ElevatedButton.styleFrom(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 16),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    backgroundColor: Colors.grey[800],
                                    foregroundColor: Colors.white,
                                  ),
                                  child: _isLoading
                                      ? const SizedBox(
                                          width: 20,
                                          height: 20,
                                          child: CircularProgressIndicator(
                                            strokeWidth: 2,
                                            color: Colors.white,
                                          ),
                                        )
                                      : const Text('Ingresar'),
                                ),
                              ),
                              const SizedBox(height: 20),
                              Text(
                                'Carros Electricos.co',
                                style: TextStyle(
                                  color: Colors.grey[600],
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
