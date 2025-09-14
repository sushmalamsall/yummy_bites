import 'package:auto_route/annotations.dart';
import 'package:enefty_icons/enefty_icons.dart';
import 'package:flutter/material.dart';
import 'package:yummy_bites/module/home/view/home_view.dart';
import 'package:yummy_bites/theme/app_colors.dart';

@RoutePage()
class DashboardView extends StatefulWidget {
  const DashboardView({super.key});

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  int _selectedIndex = 0;

  final List<IconData> _icons = [
    EneftyIcons.home_outline,
    EneftyIcons.search_status_outline,
    EneftyIcons.heart_outline,
    EneftyIcons.setting_outline,
  ];

  final List<Widget> _pages = const [
    HomeView(),
    HomeView(),
    HomeView(),
    HomeView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomAppBar(
        color: const Color(0xFF1A1A1A),
        shape: const CircularNotchedRectangle(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(_icons.length, (index) {
            final isActive = _selectedIndex == index;
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(
                    _icons[index],
                    color: isActive
                        ? AppColors.of(context).primaryYellow
                        : AppColors.of(context).lightBlack,
                    size: 20,
                  ),
                  onPressed: () {
                    setState(() {
                      _selectedIndex = index;
                    });
                  },
                ),
                AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  height: 6,
                  width: 6,
                  decoration: BoxDecoration(
                    color: isActive
                        ? AppColors.of(context).primaryYellow
                        : Colors.transparent,
                    shape: BoxShape.circle,
                  ),
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}
