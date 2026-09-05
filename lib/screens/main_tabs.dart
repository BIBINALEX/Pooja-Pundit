import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pooja_pundit/screens/bookings_page.dart';
import 'package:pooja_pundit/screens/booking_history_page.dart';
import 'package:pooja_pundit/screens/account_page.dart';
import '../widgets/bottom_bar.dart';
import '../widgets/app_bar.dart';
import '../providers/tab_index_provider.dart';

class MainTabs extends ConsumerWidget {
  const MainTabs({super.key});

  final List<Widget> _pages = const [
    BookingsPage(),
    BookingHistoryPage(),
    AccountPage(),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final index = ref.watch(tabIndexProvider);
    return Scaffold(
      appBar: const CustomAppBar(),
      body: IndexedStack(index: index, children: _pages),
      bottomNavigationBar: TabBottomBar(
        currentIndex: index,
        onTap: (i) => ref.read(tabIndexProvider.notifier).selectTab(i),
      ),
    );
  }
}
