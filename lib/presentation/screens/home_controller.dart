import 'package:badihi/core/extensions/context_extensions.dart';
import 'package:badihi/core/theme/app_tokens.dart';
import 'package:badihi/presentation/screens/bookmarks_page.dart';
import 'package:badihi/presentation/screens/courses_page.dart';
import 'package:badihi/presentation/screens/home_page.dart';
import 'package:badihi/presentation/screens/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeController extends StatefulWidget {
  final int selectedPage;

  const HomeController({Key? key, this.selectedPage = 0}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomeController> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    CoursesPage(),
    BookmarksPage(),
    ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      _selectedIndex = widget.selectedPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: context.appColors.bgPrimaryAlt,
          border: Border(
            top: BorderSide(color: context.appColors.borderSecondary, width: 2), // Top border
          ),
        ),
        child: Container(
          margin: EdgeInsets.only(bottom: 25, right: AppSpacing.spacing2XL, left: AppSpacing.spacing2XL),
          child: Row(
            // Padding
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(child: _buildNavItem("home-05", "الرئيسية", 0)),
              Expanded(child: _buildNavItem("book-open-01", "الدورات", 1)),
              Expanded(child: _buildNavItem("bookmark", "المحفوظات", 2)),
              Expanded(child: _buildNavItem("user-01", "الحساب", 3)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(String icon, String label, int index) {
    bool isSelected = _selectedIndex == index;

    return GestureDetector(
      onTap: () => _onItemTapped(index),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300), // Smooth transition
        curve: Curves.easeInOut,
        padding: EdgeInsets.only(top: AppSpacing.spacingMD),
        decoration: BoxDecoration(
          color: Colors.transparent,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: AppSpacing.spacingMD),
              child: SvgPicture.asset(
                "assets/images/icons/$icon.svg",
                width: 24,
                height: 24,
                colorFilter: ColorFilter.mode(
                    isSelected ? context.appColors.fgBrandPrimary : context.appColors.fgSecondary,
                    BlendMode.srcIn),
              ),
            ),
            SizedBox(height: AppSpacing.spacingMD),
            Text(
              label,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: isSelected ? context.appColors.fgBrandPrimary : context.appColors.textSecondary,
                fontSize: 14,
                fontWeight: FontWeight.w500,
                height: 1.43,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
