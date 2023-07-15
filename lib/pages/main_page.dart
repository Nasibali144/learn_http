import 'package:flutter/material.dart';
import 'package:learn_http/pages/harry_potter/harry_home_page.dart';
import 'package:learn_http/pages/movie/home_page.dart';
import 'package:learn_http/pages/users/user_list_page.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomePage(),
                  ),
                );
              },
              style: Theme.of(context).elevatedButtonTheme.style,
              child: const Text(
                "Movie One",
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HarryPotterHome(),
                  ),
                );
              },
              style: Theme.of(context).elevatedButtonTheme.style,
              child: const Text(
                "Harry Potter",
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const UserListPage(),
                  ),
                );
              },
              style: Theme.of(context).elevatedButtonTheme.style,
              child: const Text(
                "Users",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
