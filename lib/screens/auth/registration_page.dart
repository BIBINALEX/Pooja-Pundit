import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:pooja_pundit/core/di/providers.dart' as di;
import 'package:pooja_pundit/core/router/app_router.dart';
import 'package:pooja_pundit/services/api/backend_models.dart';

class RegistrationPage extends ConsumerStatefulWidget {
  const RegistrationPage({super.key, this.initialProfile});

  final PanditSignInResult? initialProfile;

  @override
  ConsumerState<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends ConsumerState<RegistrationPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _dobController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _genderController = TextEditingController();
  final _specializationController = TextEditingController();
  final _languageController = TextEditingController();
  final _bioController = TextEditingController();
  bool _isLoading = false;

  late final bool _nameWasPrefilled;
  late final bool _dobWasPrefilled;
  late final bool _emailWasPrefilled;
  late final bool _phoneWasPrefilled;
  late final bool _genderWasPrefilled;
  late final bool _specializationWasPrefilled;
  late final bool _languageWasPrefilled;
  late final bool _bioWasPrefilled;

  static bool _hasValue(String value) {
    final normalized = value.trim().toLowerCase();
    return normalized.isNotEmpty &&
        normalized != 'unspecified' &&
        normalized != '1900-01-01';
  }

  @override
  void initState() {
    super.initState();
    final profile = widget.initialProfile;
    final user = profile?.user;
    final pandit = profile?.pandit;
    final name = _firstValue(
      pandit?.name,
      user?.displayName ?? FirebaseAuth.instance.currentUser?.displayName,
    );
    final dob = _firstValue(pandit?.dob, user?.dob);
    final email = _firstValue(
      pandit?.email,
      user?.email ?? FirebaseAuth.instance.currentUser?.email,
    );
    final phone = _firstValue(
      pandit?.phone,
      user?.phone ?? FirebaseAuth.instance.currentUser?.phoneNumber,
    );
    final gender = _firstValue(pandit?.gender, user?.gender);
    final specialization = _firstValue(pandit?.specialization);
    final language = _firstValue(pandit?.language, user?.language);
    final bio = _firstValue(pandit?.bio, user?.bio);

    _nameController.text = name;
    _dobController.text = dob;
    _emailController.text = email;
    _phoneController.text = phone;
    _genderController.text = gender;
    _specializationController.text = specialization;
    _languageController.text = language;
    _bioController.text = bio;

    _nameWasPrefilled = _hasValue(name);
    _dobWasPrefilled = _hasValue(dob);
    _emailWasPrefilled = _hasValue(email);
    _phoneWasPrefilled = _hasValue(phone);
    _genderWasPrefilled = _hasValue(gender);
    _specializationWasPrefilled = _hasValue(specialization);
    _languageWasPrefilled = _hasValue(language);
    _bioWasPrefilled = _hasValue(bio);
  }

  static String _firstValue(String? primary, [String? fallback]) {
    if (_hasValue(primary ?? '')) return primary!.trim();
    if (_hasValue(fallback ?? '')) return fallback!.trim();
    return '';
  }

  @override
  void dispose() {
    _nameController.dispose();
    _dobController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _genderController.dispose();
    _specializationController.dispose();
    _languageController.dispose();
    _bioController.dispose();
    super.dispose();
  }

  Future<void> _pickDate() async {
    final now = DateTime.now();
    final picked = await showDatePicker(
      context: context,
      initialDate: now.subtract(const Duration(days: 365 * 25)),
      firstDate: DateTime(1900),
      lastDate: now,
    );

    if (picked == null) return;

    setState(() {
      _dobController.text = picked.toIso8601String().split('T').first;
    });
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);

    try {
      final api = ref.read(di.backendApiServiceProvider);
      await api.registerPandit(
        name: _nameController.text.trim(),
        dob: _dobController.text.trim(),
        email: _emailController.text.trim(),
        phone: _phoneController.text.trim(),
        gender: _genderController.text.trim(),
        bio: _bioController.text.trim(),
        specialization: _specializationController.text.trim(),
        language: _languageController.text.trim(),
      );

      if (!mounted) return;
      pendingRegistrationProfile = null;
      context.go('/');
    } catch (error) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            behavior: SnackBarBehavior.floating,
            backgroundColor: const Color(0xFF2E2926),
            content: Text('Registration failed: $error'),
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final fields = [
      _buildTextField(
        controller: _nameController,
        enabled: !_nameWasPrefilled,
        label: 'Full name',
        icon: Icons.person_outline_rounded,
        validator: (value) =>
            (value == null || value.trim().isEmpty) ? 'Name is required' : null,
      ),
      _buildTextField(
        controller: _emailController,
        enabled: !_emailWasPrefilled,
        label: 'Email',
        icon: Icons.email_outlined,
        keyboardType: TextInputType.emailAddress,
        validator: (value) => (value == null || value.trim().isEmpty)
            ? 'Email is required'
            : null,
      ),
      _buildTextField(
        controller: _phoneController,
        enabled: !_phoneWasPrefilled,
        label: 'Phone Number',
        icon: Icons.phone_android_outlined,
        keyboardType: TextInputType.phone,
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        validator: (value) => (value == null || value.trim().isEmpty)
            ? 'Phone Number is required'
            : null,
      ),
      Row(
        children: [
          Expanded(
            flex: 5,
            child: InkWell(
              onTap: _dobWasPrefilled ? null : _pickDate,
              child: IgnorePointer(
                child: _buildTextField(
                  controller: _dobController,
                  enabled: !_dobWasPrefilled,
                  label: 'Date of birth',
                  icon: Icons.calendar_today_outlined,
                  validator: (value) => (value == null || value.trim().isEmpty)
                      ? 'DOB is required'
                      : null,
                ),
              ),
            ),
          ),
          SizedBox(width: 8.w),
          Expanded(
            flex: 4,
            child: _buildDropdownField(
              controller: _genderController,
              enabled: !_genderWasPrefilled,
              label: 'Gender',
              icon: Icons.male_outlined,
              items: const ['Male', 'Female'],
              validator: (value) => (value == null || value.trim().isEmpty)
                  ? 'Gender is required'
                  : null,
            ),
          ),
        ],
      ),
      _buildTextField(
        controller: _specializationController,
        enabled: !_specializationWasPrefilled,
        label: 'Specialization',
        icon: Icons.work_outline_rounded,
        validator: (value) => (value == null || value.trim().isEmpty)
            ? 'Specialization is required'
            : null,
      ),
      _buildDropdownField(
        controller: _languageController,
        enabled: !_languageWasPrefilled,
        label: 'Language',
        icon: Icons.language_outlined,
        items: const ['English', 'Malayalam', 'Tamil', 'Hindi'],
        validator: (value) => (value == null || value.trim().isEmpty)
            ? 'Language is required'
            : null,
      ),
      _buildTextField(
        controller: _bioController,
        enabled: !_bioWasPrefilled,
        label: 'Bio',
        icon: Icons.info_outline_rounded,
        maxLines: 4,
        validator: (value) =>
            (value == null || value.trim().isEmpty) ? 'Bio is required' : null,
      ),
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFF8F4EE),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 28),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 430),
              child: Column(
                children: [
                  Container(
                    width: 96,
                    height: 96,
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFF0E3),
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: const Color(
                            0xFFFF6900,
                          ).withValues(alpha: 0.18),
                          blurRadius: 16,
                          offset: const Offset(0, 9),
                        ),
                      ],
                    ),
                    child: const Icon(
                      Icons.person_add_alt_1_rounded,
                      size: 48,
                      color: Color(0xFFFF6900),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Complete your profile',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w800,
                      color: Color(0xFF2E2926),
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Add the remaining details so you can start using the app.',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 15, color: Color(0xFF5F534D)),
                  ),
                  const SizedBox(height: 24),
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
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          for (
                            var index = 0;
                            index < fields.length;
                            index++
                          ) ...[
                            if (index > 0) const SizedBox(height: 16),
                            fields[index],
                          ],
                          const SizedBox(height: 20),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: _isLoading ? null : _submit,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFFFF6900),
                                foregroundColor: Colors.white,
                                padding: const EdgeInsets.symmetric(
                                  vertical: 16,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(14),
                                ),
                              ),
                              child: _isLoading
                                  ? const SizedBox(
                                      width: 22,
                                      height: 22,
                                      child: CircularProgressIndicator(
                                        strokeWidth: 2.5,
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                              Colors.white,
                                            ),
                                      ),
                                    )
                                  : const Text(
                                      'Continue',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700,
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
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    bool enabled = true,
    String? Function(String?)? validator,
    TextInputType? keyboardType,
    List<TextInputFormatter>? inputFormatters,
    int maxLines = 1,
  }) {
    return TextFormField(
      controller: controller,
      enabled: enabled && !_isLoading,
      maxLines: maxLines,
      keyboardType: keyboardType,
      inputFormatters: inputFormatters,
      validator: validator,
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color(0xFFF9F7F5),
        labelText: label,
        prefixIcon: Icon(icon, color: const Color(0xFFFF6900)),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: Color(0xFFEDE7E1)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: Color(0xFFFF6900), width: 1.5),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: Colors.redAccent),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: Colors.redAccent, width: 1.5),
        ),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 16,
          horizontal: 14,
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: Color(0xFFEDE7E1)),
        ),
      ),
    );
  }

  Widget _buildDropdownField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    required List<String> items,
    bool enabled = true,
    String? Function(String?)? validator,
  }) {
    final currentValue = controller.text.trim();
    final dropdownItems = [
      ...items,
      if (currentValue.isNotEmpty && !items.contains(currentValue))
        currentValue,
    ];

    return DropdownButtonFormField<String>(
      initialValue: currentValue.isEmpty ? null : currentValue,
      onChanged: enabled && !_isLoading
          ? (value) {
              if (value == null) return;
              setState(() => controller.text = value);
            }
          : null,
      validator: validator,
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color(0xFFF9F7F5),
        labelText: label,
        prefixIcon: Icon(icon, color: const Color(0xFFFF6900)),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: Color(0xFFEDE7E1)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: Color(0xFFFF6900), width: 1.5),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: Colors.redAccent),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: Colors.redAccent, width: 1.5),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: Color(0xFFEDE7E1)),
        ),
      ),
      items: dropdownItems
          .map(
            (item) => DropdownMenuItem<String>(value: item, child: Text(item)),
          )
          .toList(),
    );
  }
}
