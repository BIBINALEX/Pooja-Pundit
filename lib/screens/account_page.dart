import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:pooja_pundit/core/di/providers.dart' as di;
import 'package:pooja_pundit/core/widgets/app_confirmation_dialog.dart';
import 'package:pooja_pundit/l10n/generated/app_localizations.dart';
import 'package:pooja_pundit/services/api/backend_models.dart';
import 'language_selection_page.dart';
import '../services/localization/catalog_localizations.dart';
import '../providers/booking_provider.dart';

class AccountPage extends ConsumerStatefulWidget {
  const AccountPage({super.key});

  @override
  ConsumerState<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends ConsumerState<AccountPage> {
  bool _isLoggingOut = false;
  bool _isLoadingProfile = true;
  String? _profileError;
  Pandit? _pandit;

  @override
  void initState() {
    super.initState();
    _loadProfile();
  }

  Future<void> _loadProfile() async {
    final l10n = AppLocalizations.of(context);
    try {
      final pandit = await ref
          .read(di.backendApiServiceProvider)
          .fetchPanditProfile();
      if (!mounted) return;
      setState(() {
        _pandit = pandit;
        _isLoadingProfile = false;
        _profileError = pandit == null ? l10n.profileNotFound : null;
      });
    } catch (_) {
      if (!mounted) return;
      setState(() {
        _isLoadingProfile = false;
        _profileError = l10n.unableToLoadProfile;
      });
    }
  }

  Future<void> _logout() async {
    final l10n = AppLocalizations.of(context);
    final shouldLogout = await showDialog<bool>(
      context: context,
      builder: (context) => AppConfirmationDialog(
        title: l10n.logOutQuestion,
        message: l10n.signInAgainMessage,
        cancelLabel: l10n.cancel,
        confirmLabel: l10n.logOut,
      ),
    );
    if (shouldLogout != true || !mounted) return;

    setState(() => _isLoggingOut = true);
    Object? logoutError;

    try {
      await ref.read(bookingProvider.notifier).disconnect();
      await ref.read(di.backendApiServiceProvider).logout();
    } catch (error) {
      logoutError = error;
    } finally {
      await FirebaseAuth.instance.signOut();
    }

    if (!mounted) return;
    context.go('/login');
    if (logoutError != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(l10n.loggedOutLocallyServerSyncFailed)),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final state = ref.watch(bookingProvider);
    final locale = Localizations.localeOf(context);
    final profileDetails = [
      _pandit?.specialization,
      _pandit?.language,
      _pandit?.email,
      _pandit?.phone,
    ].whereType<String>().where((value) => value.isNotEmpty).join(' • ');

    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      children: [
        const Gap(12),
        Text(
          l10n.accountAndSettings,
          style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w700),
        ),
        const Gap(16),
        Container(
          margin: EdgeInsets.only(bottom: 12.h),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(21),
            border: Border.all(color: const Color(0xFFFFE5C4)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withAlpha(40),
                blurRadius: 13,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: ListTile(
            leading: const CircleAvatar(child: Icon(Icons.person)),
            title: Text(
              _isLoadingProfile
                  ? l10n.loadingProfile
                  : _pandit?.name ?? l10n.panditProfile,
            ),
            subtitle: Text(
              _profileError ??
                  (profileDetails.isNotEmpty ? profileDetails : _pandit?.bio) ??
                  l10n.yourProfileDetailsWillAppearHere,
            ),
          ),
        ),
        const Gap(12),
        SwitchListTile.adaptive(
          value: true,
          onChanged: (_) {},
          title: Text(l10n.acceptInstantRequests),
          subtitle: Text(l10n.getNotifiedNewRequest),
        ),
        SwitchListTile.adaptive(
          value: state.isConnected,
          onChanged: (_) {},
          title: Text(l10n.socketLiveUpdates),
          subtitle: Text(l10n.keepBookingFeedSynced),
        ),
        const Gap(12),
        ListTile(
          leading: const Icon(Icons.language),
          title: Text(l10n.languageLabel),
          trailing: const Icon(Icons.arrow_forward_ios),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute<void>(
                builder: (_) => const LanguageSelectionPage(),
              ),
            );
          },
        ),
        const Gap(12),
        ListTile(
          title: Text(l10n.currentBookingStatus),
          subtitle: Text(
            state.active == null
                ? l10n.noActiveBooking
                : localizedService(state.active!.service, locale),
          ),
          trailing: const Icon(Icons.arrow_forward_ios),
        ),
        const Gap(12),
        ListTile(
          enabled: !_isLoggingOut,
          leading: const Icon(Icons.logout_rounded),
          title: Text(_isLoggingOut ? l10n.loggingOut : l10n.logOut),
          onTap: _isLoggingOut ? null : _logout,
        ),
      ],
    );
  }
}
