import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:pooja_pundit/app/app.dart';
import 'package:pooja_pundit/l10n/generated/app_localizations.dart';
import 'package:pooja_pundit/services/localization/locale_service.dart';

class LanguageSelectionPage extends ConsumerWidget {
  const LanguageSelectionPage({super.key});

  static const List<_LanguageOption> _options = <_LanguageOption>[
    _LanguageOption(code: 'en', label: 'English'),
    _LanguageOption(code: 'bn', label: 'বাংলা'),
    _LanguageOption(code: 'gu', label: 'ગુજરાતી'),
    _LanguageOption(code: 'hi', label: 'हिन्दी'),
    _LanguageOption(code: 'kn', label: 'ಕನ್ನಡ'),
    _LanguageOption(code: 'ml', label: 'മലയാളം'),
    _LanguageOption(code: 'pa', label: 'ਪੰਜਾਬੀ'),
    _LanguageOption(code: 'sa', label: 'संस्कृतम्'),
    _LanguageOption(code: 'ta', label: 'தமிழ்'),
    _LanguageOption(code: 'te', label: 'తెలుగు'),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentLocale = ref.watch(localeProvider);
    final l10n = AppLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          l10n.languageLabel,
          style: TextStyle(
            color: Color(0xFF1F2937),
            fontSize: 18.h,
            fontWeight: FontWeight.w700,
            height: 1.1,
          ),
        ),
        centerTitle: false,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: SafeArea(
        child: ListView.separated(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
          itemCount: _options.length,
          separatorBuilder: (_, _) =>
              const Divider(height: 1, color: Color(0x88B3B3B3)),
          itemBuilder: (context, index) {
            final option = _options[index];
            final isSelected = currentLocale?.languageCode == option.code;

            return ListTile(
              title: Text(
                option.label,
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF1F2937),
                ),
              ),
              trailing: isSelected
                  ? Icon(Icons.check, color: AppColors.primaryColor)
                  : null,
              onTap: () async {
                await ref
                    .read(localeProvider.notifier)
                    .set(Locale(option.code));
                if (context.mounted) {
                  context.pop();
                }
              },
            );
          },
        ),
      ),
    );
  }
}

class _LanguageOption {
  const _LanguageOption({required this.code, required this.label});

  final String code;
  final String label;
}
