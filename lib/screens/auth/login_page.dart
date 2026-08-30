import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:pooja_pundit/core/di/providers.dart' as di;
import 'package:pooja_pundit/core/router/app_router.dart';

class PhoneLoginPage extends ConsumerStatefulWidget {
  const PhoneLoginPage({super.key});

  @override
  ConsumerState<PhoneLoginPage> createState() => _PhoneLoginPageState();
}

class _PhoneLoginPageState extends ConsumerState<PhoneLoginPage> {
  final _countryCodeController = TextEditingController(text: '+91');
  final _phoneController = TextEditingController();
  final _otpController = TextEditingController();
  final _auth = FirebaseAuth.instance;

  String? _verificationId;
  bool _isCodeSent = false;
  bool _isLoading = false;

  @override
  void dispose() {
    _countryCodeController.dispose();
    _phoneController.dispose();
    _otpController.dispose();
    super.dispose();
  }

  Future<void> _sendOtp() async {
    final countryCode = _countryCodeController.text.trim();
    final phone = _phoneController.text.trim();
    if (countryCode.isEmpty || phone.isEmpty) {
      _showSnack('Please enter a valid phone number.');
      return;
    }

    final fullPhone = '$countryCode$phone';
    _verificationId = null;
    _isCodeSent = false;
    setState(() => _isLoading = true);

    try {
      await _auth.verifyPhoneNumber(
        phoneNumber: fullPhone,
        verificationCompleted: (PhoneAuthCredential credential) async {
          try {
            await _auth.signInWithCredential(credential);
            if (mounted) {
              await _completeLogin();
            }
          } catch (error) {
            if (mounted) {
              _showSnack('Auto-verification failed: $error');
            }
          }
        },
        verificationFailed: (FirebaseAuthException error) {
          _verificationId = null;
          _showSnack(error.message ?? 'Verification failed.');
          setState(() => _isLoading = false);
        },
        codeSent: (String verificationId, int? resendToken) {
          _verificationId = verificationId;
          setState(() {
            _isCodeSent = true;
            _isLoading = false;
          });
          _showSnack('OTP sent successfully.');
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          _verificationId = verificationId;
        },
      );
    } catch (error) {
      _verificationId = null;
      _showSnack('Unable to send OTP: $error');
      setState(() => _isLoading = false);
    }
  }

  Future<void> _verifyOtp() async {
    final code = _otpController.text.trim();
    final verificationId = _verificationId;
    if (verificationId == null || verificationId.isEmpty || code.isEmpty) {
      _showSnack('Please enter a valid OTP or request a new one.');
      return;
    }

    setState(() => _isLoading = true);

    try {
      final credential = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: code,
      );
      await _auth.signInWithCredential(credential);
      await _completeLogin();
    } on FirebaseAuthException catch (error) {
      _verificationId = null;
      _showSnack(error.message ?? 'Invalid OTP.');
      setState(() => _isLoading = false);
    } catch (error) {
      _verificationId = null;
      _showSnack('OTP verification failed: $error');
      setState(() => _isLoading = false);
    }
  }

  Future<void> _completeLogin() async {
    if (!mounted) return;

    try {
      final user = _auth.currentUser;
      if (user == null) {
        throw StateError('No authenticated user found.');
      }

      final idToken = await user.getIdToken();
      if (idToken == null || idToken.isEmpty) {
        throw StateError('Firebase user token is empty.');
      }

      final backendApiService = ref.read(di.backendApiServiceProvider);
      final result = await backendApiService.panditSignIn(idToken: idToken);

      if (mounted) {
        if (result.requiresProfileCompletion) {
          pendingRegistrationProfile = result;
          context.go('/register', extra: result);
          return;
        } else if (result.accessToken.isEmpty || result.refreshToken.isEmpty) {
          throw StateError('Backend API did not return valid tokens.');
        } else {
          context.go('/');
        }
      }
    } catch (error) {
      if (mounted) {
        _showSnack('Login failed: $error');
      }
      setState(() => _isLoading = false);
    }
  }

  void _showSnack(String message) {
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        backgroundColor: const Color(0xFF2E2926),
        content: Text(message),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isOtpStep = _isCodeSent;

    return Scaffold(
      backgroundColor: const Color(0xFFF8F4EE),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 28),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 420),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 104,
                    height: 104,
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFF0E3),
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: const Color(
                            0xFFFF6900,
                          ).withValues(alpha: 0.18),
                          blurRadius: 18,
                          offset: const Offset(0, 10),
                        ),
                      ],
                    ),
                    child: const Icon(
                      Icons.phone_iphone_rounded,
                      size: 52,
                      color: Color(0xFFFF6900),
                    ),
                  ),
                  const SizedBox(height: 18),
                  const Text(
                    'Pooja Pundit',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w800,
                      letterSpacing: -0.5,
                      color: Color(0xFF2E2926),
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Welcome back! Sign in with your mobile number',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF5F534D),
                    ),
                  ),
                  const SizedBox(height: 28),
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(24),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.04),
                          blurRadius: 18,
                          offset: const Offset(0, 8),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          isOtpStep ? 'Verify OTP' : 'Mobile number',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF2E2926),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          isOtpStep
                              ? 'Enter the 6-digit OTP sent to your mobile.'
                              : 'We will send a one-time password to your number.',
                          style: const TextStyle(
                            fontSize: 13,
                            color: Color(0xFF766B66),
                          ),
                        ),
                        const SizedBox(height: 20),
                        if (!isOtpStep)
                          Row(
                            children: [
                              SizedBox(
                                width: 92,
                                child: TextField(
                                  controller: _countryCodeController,
                                  enabled: !_isLoading,
                                  keyboardType: TextInputType.phone,
                                  textAlign: TextAlign.center,
                                  inputFormatters: [
                                    LengthLimitingTextInputFormatter(4),
                                    FilteringTextInputFormatter.allow(
                                      RegExp(r'[+0-9]'),
                                    ),
                                  ],
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: const Color(0xFFF9F7F5),
                                    labelText: 'Code',
                                    labelStyle: const TextStyle(
                                      color: Color(0xFF7A6F6A),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(14),
                                      borderSide: const BorderSide(
                                        color: Color(0xFFEDE7E1),
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(14),
                                      borderSide: const BorderSide(
                                        color: Color(0xFFFF6900),
                                        width: 1.5,
                                      ),
                                    ),
                                    contentPadding: const EdgeInsets.symmetric(
                                      vertical: 16,
                                      horizontal: 10,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: TextField(
                                  controller: _phoneController,
                                  enabled: !_isLoading,
                                  keyboardType: TextInputType.phone,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.digitsOnly,
                                  ],
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: const Color(0xFFF9F7F5),
                                    labelText: 'Phone number',
                                    labelStyle: const TextStyle(
                                      color: Color(0xFF7A6F6A),
                                    ),
                                    prefixIcon: const Icon(
                                      Icons.phone_android_outlined,
                                      color: Color(0xFFFF6900),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(14),
                                      borderSide: const BorderSide(
                                        color: Color(0xFFEDE7E1),
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(14),
                                      borderSide: const BorderSide(
                                        color: Color(0xFFFF6900),
                                        width: 1.5,
                                      ),
                                    ),
                                    contentPadding: const EdgeInsets.symmetric(
                                      vertical: 16,
                                      horizontal: 14,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        else
                          TextField(
                            controller: _otpController,
                            enabled: !_isLoading,
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                              LengthLimitingTextInputFormatter(6),
                            ],
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 24,
                              letterSpacing: 18,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFF2E2926),
                            ),
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: const Color(0xFFF9F7F5),
                              hintText: '123456',
                              hintStyle: const TextStyle(
                                letterSpacing: 2,
                                color: Color(0xFFB1A8A4),
                              ),
                              prefixIcon: const Icon(
                                Icons.lock_outline_rounded,
                                color: Color(0xFFFF6900),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(14),
                                borderSide: const BorderSide(
                                  color: Color(0xFFEDE7E1),
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(14),
                                borderSide: const BorderSide(
                                  color: Color(0xFFFF6900),
                                  width: 1.5,
                                ),
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                vertical: 16,
                                horizontal: 14,
                              ),
                            ),
                          ),
                        const SizedBox(height: 18),
                        if (isOtpStep)
                          Align(
                            alignment: Alignment.centerRight,
                            child: TextButton(
                              onPressed: () {
                                _verificationId = null;
                                setState(() {
                                  _isCodeSent = false;
                                  _otpController.clear();
                                });
                              },
                              style: TextButton.styleFrom(
                                foregroundColor: const Color(0xFFFF6900),
                              ),
                              child: const Text('Change number'),
                            ),
                          ),
                        const SizedBox(height: 6),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: _isLoading
                                ? null
                                : (isOtpStep ? _verifyOtp : _sendOtp),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFFFF6900),
                              foregroundColor: Colors.white,
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(14),
                              ),
                              elevation: 0,
                              shadowColor: Colors.transparent,
                            ),
                            child: _isLoading
                                ? const SizedBox(
                                    height: 22,
                                    width: 22,
                                    child: CircularProgressIndicator(
                                      strokeWidth: 2.5,
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                        Colors.white,
                                      ),
                                    ),
                                  )
                                : Text(
                                    isOtpStep ? 'Verify OTP' : 'Send OTP',
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
