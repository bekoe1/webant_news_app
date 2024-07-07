import 'package:bloc_test_app/presentation/all_news_page/all_news_page.dart';
import 'package:bloc_test_app/presentation/all_news_page/bloc/all_news_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Navigation App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [const AllNewsPage()];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) =>
              AllNewsBloc()..add(FetchingNewsEvent()),
        ),
      ],
      child: Scaffold(
        body: Navigator(
          pages: [
            if (_selectedIndex == 0) const MaterialPage(child: AllNewsPage()),
            // if (_selectedIndex == 1) MaterialPage(child: BlogsPage()),
            // if (_selectedIndex == 2) MaterialPage(child: AboutPage()),
          ],
          onPopPage: (route, result) => route.didPop(result),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.article),
              label: 'News',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.library_books),
              label: 'Blogs',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.info),
              label: 'About',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.amber[800],
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
