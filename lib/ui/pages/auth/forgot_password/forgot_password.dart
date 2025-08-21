// import 'dart:ui';
//
// import 'package:flutter/material.dart';
//
// import '../../../../widgets/others/snack_bar.dart';
//
// class ForgotPasswordScreen extends StatefulWidget {
//   const ForgotPasswordScreen({Key? key}) : super(key: key);
//
//   @override
//   State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
// }
//
// class _ForgotPasswordScreenState extends State<ForgotPasswordScreen>
//     with TickerProviderStateMixin {
//
//   late AnimationController _slideController;
//   late AnimationController _pulseController;
//   late AnimationController _glowController;
//   late AnimationController _floatController;
//   late AnimationController _rotateController;
//
//   late Animation<double> _slideAnimation;
//   late Animation<double> _pulseAnimation;
//   late Animation<double> _glowAnimation;
//   late Animation<double> _floatAnimation;
//   late Animation<double> _rotateAnimation;
//
//   final TextEditingController _emailController = TextEditingController();
//   final FocusNode _emailFocusNode = FocusNode();
//   bool _isLoading = false;
//   bool _emailSent = false;
//
//   @override
//   void initState() {
//     super.initState();
//     _initializeAnimations();
//     _startAnimations();
//   }
//
//   void _initializeAnimations() {
//     _slideController = AnimationController(
//       duration: const Duration(milliseconds: 1200),
//       vsync: this,
//     );
//
//     _pulseController = AnimationController(
//       duration: const Duration(seconds: 3),
//       vsync: this,
//     );
//
//     _glowController = AnimationController(
//       duration: const Duration(seconds: 2),
//       vsync: this,
//     );
//
//     _floatController = AnimationController(
//       duration: const Duration(seconds: 4),
//       vsync: this,
//     );
//
//     _rotateController = AnimationController(
//       duration: const Duration(seconds: 8),
//       vsync: this,
//     );
//
//     _slideAnimation = Tween<double>(
//       begin: 100.0,
//       end: 0.0,
//     ).animate(CurvedAnimation(
//       parent: _slideController,
//       curve: Curves.easeOutCubic,
//     ));
//
//     _pulseAnimation = Tween<double>(
//       begin: 1.0,
//       end: 1.2,
//     ).animate(CurvedAnimation(
//       parent: _pulseController,
//       curve: Curves.easeInOut,
//     ));
//
//     _glowAnimation = Tween<double>(
//       begin: 0.3,
//       end: 1.0,
//     ).animate(CurvedAnimation(
//       parent: _glowController,
//       curve: Curves.easeInOut,
//     ));
//
//     _floatAnimation = Tween<double>(
//       begin: -10.0,
//       end: 10.0,
//     ).animate(CurvedAnimation(
//       parent: _floatController,
//       curve: Curves.easeInOut,
//     ));
//
//     _rotateAnimation = Tween<double>(
//       begin: 0.0,
//       end: 2 * 3.14159,
//     ).animate(CurvedAnimation(
//       parent: _rotateController,
//       curve: Curves.linear,
//     ));
//   }
//
//   void _startAnimations() {
//     _slideController.forward();
//     _pulseController.repeat(reverse: true);
//     _glowController.repeat(reverse: true);
//     _floatController.repeat(reverse: true);
//     _rotateController.repeat();
//   }
//
//   @override
//   void dispose() {
//     _slideController.dispose();
//     _pulseController.dispose();
//     _glowController.dispose();
//     _floatController.dispose();
//     _rotateController.dispose();
//     _emailController.dispose();
//     _emailFocusNode.dispose();
//     super.dispose();
//   }
//
//   void _sendResetEmail() async {
//     if (_emailController.text.isEmpty) {
//       showSnackBar('Please enter your email address');
//       return;
//     }
//
//     if (!_isValidEmail(_emailController.text)) {
//       showSnackBar('Please enter a valid email address');
//       return;
//     }
//
//     setState(() {
//       _isLoading = true;
//     });
//
//     // Simulate API call
//     await Future.delayed(const Duration(seconds: 2));
//
//     setState(() {
//       _isLoading = false;
//       _emailSent = true;
//     });
//
//     _showSnackBar('Reset link sent to your email!', isError: false);
//   }
//
//   bool _isValidEmail(String email) {
//     return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email);
//   }
//
//   void _showSnackBar(String message, {required bool isError}) {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         content: Text(message),
//         backgroundColor: isError ? Colors.red : Colors.green,
//         behavior: SnackBarBehavior.floating,
//         margin: const EdgeInsets.all(16),
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//       ),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         decoration: const BoxDecoration(
//           gradient: LinearGradient(
//             begin: Alignment.topLeft,
//             end: Alignment.bottomRight,
//             colors: [
//               Color(0xFF1A1A2E),
//               Color(0xFF16213E),
//               Color(0xFF0F3460),
//             ],
//           ),
//         ),
//         child: Stack(
//           children: [
//             _buildAnimatedBackground(),
//             _buildMainContent(),
//             _buildBackButton(),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _buildAnimatedBackground() {
//     return Stack(
//       children: [
//         // Floating orbs
//         AnimatedBuilder(
//           animation: _floatAnimation,
//           builder: (context, child) {
//             return Stack(
//               children: [
//                 Positioned(
//                   top: 120 + _floatAnimation.value,
//                   left: 50,
//                   child: _buildGlowingOrb(80, const Color(0xFF667eea), 0.3),
//                 ),
//                 Positioned(
//                   top: 300 - _floatAnimation.value * 0.5,
//                   right: 40,
//                   child: _buildGlowingOrb(120, const Color(0xFF764ba2), 0.2),
//                 ),
//                 Positioned(
//                   bottom: 200 + _floatAnimation.value * 0.8,
//                   left: 30,
//                   child: _buildGlowingOrb(60, const Color(0xFF4facfe), 0.25),
//                 ),
//                 Positioned(
//                   bottom: 100 - _floatAnimation.value,
//                   right: 80,
//                   child: _buildGlowingOrb(100, const Color(0xFF00f2fe), 0.15),
//                 ),
//               ],
//             );
//           },
//         ),
//         // Rotating geometric shapes
//         AnimatedBuilder(
//           animation: _rotateAnimation,
//           builder: (context, child) {
//             return Stack(
//               children: [
//                 Positioned(
//                   top: 200,
//                   right: 100,
//                   child: Transform.rotate(
//                     angle: _rotateAnimation.value,
//                     child: Container(
//                       width: 40,
//                       height: 40,
//                       decoration: BoxDecoration(
//                         border: Border.all(color: Colors.white.withOpacity(0.1), width: 2),
//                         borderRadius: BorderRadius.circular(8),
//                       ),
//                     ),
//                   ),
//                 ),
//                 Positioned(
//                   bottom: 250,
//                   left: 100,
//                   child: Transform.rotate(
//                     angle: -_rotateAnimation.value,
//                     child: Container(
//                       width: 30,
//                       height: 30,
//                       decoration: BoxDecoration(
//                         shape: BoxShape.circle,
//                         border: Border.all(color: Colors.white.withOpacity(0.15), width: 2),
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             );
//           },
//         ),
//       ],
//     );
//   }
//
//   Widget _buildGlowingOrb(double size, Color color, double opacity) {
//     return AnimatedBuilder(
//       animation: _glowAnimation,
//       builder: (context, child) {
//         return Container(
//           width: size,
//           height: size,
//           decoration: BoxDecoration(
//             shape: BoxShape.circle,
//             gradient: RadialGradient(
//               colors: [
//                 color.withOpacity(opacity * _glowAnimation.value),
//                 color.withOpacity(0.1 * _glowAnimation.value),
//                 Colors.transparent,
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }
//
//   Widget _buildMainContent() {
//     return SafeArea(
//       child: AnimatedBuilder(
//         animation: _slideAnimation,
//         builder: (context, child) {
//           return Transform.translate(
//             offset: Offset(0, _slideAnimation.value),
//             child: Opacity(
//               opacity: (1 - (_slideAnimation.value / 100)).clamp(0.0, 1.0),
//               child: Center(
//                 child: SingleChildScrollView(
//                   padding: const EdgeInsets.all(24),
//                   child: _emailSent ? _buildSuccessCard() : _buildForgotPasswordCard(),
//                 ),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
//
//
//   Widget _buildBackButton() {
//     return SafeArea(
//       child: Padding(
//         padding: const EdgeInsets.all(16),
//         child: IconButton(
//           onPressed: () => Navigator.of(context).pop(),
//           icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
//         ),
//       ),
//     );
//   }
//
//
//   Widget _buildForgotPasswordCard() {
//     return Container(
//       padding: const EdgeInsets.all(32),
//       decoration: BoxDecoration(
//         color: Colors.white.withOpacity(0.95),
//         borderRadius: BorderRadius.circular(28),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.2),
//             blurRadius: 30,
//             offset: const Offset(0, 15),
//           ),
//         ],
//       ),
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           _buildHeader(),
//           const SizedBox(height: 40),
//           _buildEmailInput(),
//           const SizedBox(height: 32),
//           _buildSendButton(),
//           const SizedBox(height: 24),
//           _buildBackToLoginButton(),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildSuccessCard() {
//     return Container(
//       padding: const EdgeInsets.all(32),
//       decoration: BoxDecoration(
//         color: Colors.white.withOpacity(0.95),
//         borderRadius: BorderRadius.circular(28),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.2),
//             blurRadius: 30,
//             offset: const Offset(0, 15),
//           ),
//         ],
//       ),
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           AnimatedBuilder(
//             animation: _pulseAnimation,
//             builder: (context, child) {
//               return Transform.scale(
//                 scale: _pulseAnimation.value,
//                 child: Container(
//                   width: 100,
//                   height: 100,
//                   decoration: const BoxDecoration(
//                     shape: BoxShape.circle,
//                     gradient: LinearGradient(
//                       colors: [Color(0xFF4CAF50), Color(0xFF45a049)],
//                     ),
//                   ),
//                   child: const Icon(
//                     Icons.check,
//                     color: Colors.white,
//                     size: 50,
//                   ),
//                 ),
//               );
//             },
//           ),
//           const SizedBox(height: 32),
//           const Text(
//             'Check Your Email',
//             style: TextStyle(
//               fontSize: 28,
//               fontWeight: FontWeight.bold,
//               color: Color(0xFF2D3748),
//             ),
//           ),
//           const SizedBox(height: 16),
//           Text(
//             'We\'ve sent a password reset link to',
//             style: TextStyle(
//               fontSize: 16,
//               color: Colors.grey[600],
//             ),
//           ),
//           const SizedBox(height: 8),
//           Container(
//             padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//             decoration: BoxDecoration(
//               color: const Color(0xFF4CAF50).withOpacity(0.1),
//               borderRadius: BorderRadius.circular(12),
//             ),
//             child: Text(
//               _emailController.text,
//               style: const TextStyle(
//                 fontSize: 16,
//                 fontWeight: FontWeight.w600,
//                 color: Color(0xFF4CAF50),
//               ),
//             ),
//           ),
//           const SizedBox(height: 32),
//           _buildBackToLoginButton(),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildHeader() {
//     return Column(
//       children: [
//         AnimatedBuilder(
//           animation: _pulseAnimation,
//           builder: (context, child) {
//             return Transform.scale(
//               scale: _pulseAnimation.value,
//               child: Container(
//                 width: 100,
//                 height: 100,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(24),
//                   gradient: const LinearGradient(
//                     begin: Alignment.topLeft,
//                     end: Alignment.bottomRight,
//                     colors: [
//                       Color(0xFF667eea),
//                       Color(0xFF764ba2),
//                       Color(0xFF4facfe),
//                     ],
//                   ),
//                 ),
//                 child: const Icon(
//                   Icons.lock_reset,
//                   color: Colors.white,
//                   size: 50,
//                 ),
//               ),
//             );
//           },
//         ),
//         const SizedBox(height: 24),
//         const Text(
//           'Forgot Password?',
//           style: TextStyle(
//             fontSize: 28,
//             fontWeight: FontWeight.bold,
//             color: Color(0xFF2D3748),
//           ),
//         ),
//         const SizedBox(height: 12),
//         Text(
//           'Don\'t worry! It happens. Please enter the email address associated with your account.',
//           textAlign: TextAlign.center,
//           style: TextStyle(
//             fontSize: 16,
//             color: Colors.grey[600],
//             height: 1.5,
//           ),
//         ),
//       ],
//     );
//   }
//
//   Widget _buildEmailInput() {
//     return Container(
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(16),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.grey.withOpacity(0.1),
//             blurRadius: 10,
//             offset: const Offset(0, 5),
//           ),
//         ],
//       ),
//       child: TextField(
//         controller: _emailController,
//         focusNode: _emailFocusNode,
//         keyboardType: TextInputType.emailAddress,
//         style: const TextStyle(
//           fontSize: 16,
//           color: Color(0xFF2D3748),
//         ),
//         decoration: InputDecoration(
//           labelText: 'Email Address',
//           hintText: 'Enter your email',
//           prefixIcon: Container(
//             margin: const EdgeInsets.all(12),
//             padding: const EdgeInsets.all(8),
//             decoration: BoxDecoration(
//               gradient: const LinearGradient(
//                 colors: [Color(0xFF667eea), Color(0xFF764ba2)],
//               ),
//               borderRadius: BorderRadius.circular(8),
//             ),
//             child: const Icon(Icons.email, color: Colors.white, size: 20),
//           ),
//           filled: true,
//           fillColor: Colors.grey[50],
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(16),
//             borderSide: BorderSide.none,
//           ),
//           focusedBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(16),
//             borderSide: const BorderSide(color: Color(0xFF667eea), width: 2),
//           ),
//           contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildSendButton() {
//     return Container(
//       width: double.infinity,
//       height: 56,
//       decoration: BoxDecoration(
//         gradient: const LinearGradient(
//           colors: [Color(0xFF667eea), Color(0xFF764ba2)],
//         ),
//         borderRadius: BorderRadius.circular(16),
//         boxShadow: [
//           BoxShadow(
//             color: const Color(0xFF667eea).withOpacity(0.4),
//             blurRadius: 15,
//             offset: const Offset(0, 8),
//           ),
//         ],
//       ),
//       child: Material(
//         color: Colors.transparent,
//         child: InkWell(
//           borderRadius: BorderRadius.circular(16),
//           onTap: _isLoading ? null : _sendResetEmail,
//           child: Center(
//             child: _isLoading
//                 ? const SizedBox(
//               width: 24,
//               height: 24,
//               child: CircularProgressIndicator(
//                 valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
//                 strokeWidth: 2,
//               ),
//             )
//                 : const Text(
//               'Send Reset Link',
//               style: TextStyle(
//                 color: Colors.white,
//                 fontSize: 18,
//                 fontWeight: FontWeight.w600,
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildBackToLoginButton() {
//     return TextButton(
//       onPressed: () => Navigator.of(context).pop(),
//       style: TextButton.styleFrom(
//         padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
//       ),
//       child: Row(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           const Icon(
//             Icons.arrow_back,
//             color: Color(0xFF667eea),
//             size: 18,
//           ),
//           const SizedBox(width: 8),
//           const Text(
//             'Back to Login',
//             style: TextStyle(
//               color: Color(0xFF667eea),
//               fontSize: 16,
//               fontWeight: FontWeight.w600,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }