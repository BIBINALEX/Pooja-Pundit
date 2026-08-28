import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../providers/booking_provider.dart';

class AccountPage extends ConsumerWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(bookingProvider);

    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      children: [
        const Gap(12),
        Text(
          'Account and settings',
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
            title: const Text('Ramesh Pundit'),
            subtitle: const Text('Temple specialist • 4.9 rating'),
          ),
        ),
        const Gap(12),
        SwitchListTile.adaptive(
          value: true,
          onChanged: (_) {},
          title: const Text('Accept instant requests'),
          subtitle: const Text('Get notified when a new pooja request arrives'),
        ),
        SwitchListTile.adaptive(
          value: state.isConnected,
          onChanged: (_) {},
          title: const Text('Socket live updates'),
          subtitle: const Text('Keep the booking feed synced'),
        ),
        const Gap(12),
        ListTile(
          title: const Text('Current booking status'),
          subtitle: Text(state.active?.service ?? 'No active booking'),
          trailing: const Icon(Icons.arrow_forward_ios),
        ),
      ],
    );
  }
}
