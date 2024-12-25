import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class NavbarScreen extends StatefulWidget {
  const NavbarScreen({super.key});

  @override
  State<NavbarScreen> createState() => _NavbarScreenState();
}

class _NavbarScreenState extends State<NavbarScreen> {
  final PersistentTabController _controller = PersistentTabController(initialIndex: 0);

  List<Widget> screens = [
    Container(color: Colors.red, child: Center(child: Text("Beranda"))),
    Center(child: Text("Cari")),
    Center(child: Text("Pesan")),
    Center(child: Text("Notifikasi")),
    Center(child: Text("Akun")),
  ];

  List<PersistentBottomNavBarItem> items = [
    PersistentBottomNavBarItem(
      icon: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Icon(Icons.home),
      ),
      title: "Beranda",
      activeColorPrimary: Colors.blue,
      inactiveColorPrimary: Colors.grey,
    ),
    PersistentBottomNavBarItem(
      icon: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Icon(Icons.search),
      ),
      title: "Cari",
      activeColorPrimary: Colors.blue,
      inactiveColorPrimary: Colors.grey,
    ),
    PersistentBottomNavBarItem(
      contentPadding: 16,
      icon: Center(
        child: Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
          child: Icon(
            Icons.forum,
            color: Colors.blue,
            size: 20,
          ),
        ),
      ),
      inactiveIcon: Center(
        child: Container(
          width: 120, // Pastikan ukuran ditentukan
          height: 120,
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
          child: Icon(
            Icons.forum,
            color: Colors.grey,
            size: 20,
          ),
        ),
      ),
      title: "Pesan",
      inactiveColorSecondary: Colors.grey,
      inactiveColorPrimary: Colors.grey,
      activeColorPrimary: Colors.transparent,
      activeColorSecondary: Colors.blue,
      textStyle: TextStyle(
        color: Colors.blue,
        fontSize: 12,
        fontWeight: FontWeight.w500,
      ),
    ),
    PersistentBottomNavBarItem(
      icon: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Icon(Icons.notifications),
      ),
      title: "Notifikasi",
      activeColorPrimary: Colors.blue,
      inactiveColorPrimary: Colors.grey,
    ),
    PersistentBottomNavBarItem(
      icon: Padding(
        padding: const EdgeInsets.all(8.0),
        // child: SvgPicture.asset(
        //   'assets/images/ic-akun.svg',
        //   colorFilter: ColorFilter.mode(Colors.red, BlendMode.darken),
        // ),
        child: Icon(
          Icons.account_circle,
        ),
      ),
      title: "Akun",
      activeColorPrimary: Colors.blue,
      inactiveColorPrimary: Colors.grey,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PersistentTabView(
        context,
        controller: _controller,
        screens: screens,
        items: items,
        confineToSafeArea: true,
        backgroundColor: Colors.white,
        handleAndroidBackButtonPress: true,
        resizeToAvoidBottomInset: true,
        stateManagement: true,
        navBarHeight: 70,
        padding: EdgeInsets.only(bottom: 6),
        decoration: NavBarDecoration(
          boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 6)],
        ),
        navBarStyle: NavBarStyle.style15, // Pilih gaya navbar yang sederhana
      ),
    );
  }
}
