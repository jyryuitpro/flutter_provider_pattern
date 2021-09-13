import 'package:flutter/material.dart';
import 'package:flutter_provider_pattern/src/provider/bottom_navigation_provider.dart';
import 'package:flutter_provider_pattern/src/provider/count_provider.dart';
import 'package:flutter_provider_pattern/src/ui/count_home_widget.dart';
import 'package:flutter_provider_pattern/src/ui/movie_list_widget.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  BottomNavigationProvider? _bottomNavigationProvider;

  Home({Key? key}) : super(key: key);

  Widget _navigationBody() {
    switch (_bottomNavigationProvider!.currentPage) {
      case 0:
        return CountHomeWidget();
        break;
      case 1:
        return MovieListWidget();
        break;
    }
    return Container();
  }

  Widget _bottomNavigationBarWidget() {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.movie), label: 'Movie'),
      ],
      currentIndex: _bottomNavigationProvider!.currentPage,
      selectedItemColor: Colors.red,
      onTap: (index) {
        // provider navigation state
        _bottomNavigationProvider!.updateCurrentPage(index);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    _bottomNavigationProvider = Provider.of<BottomNavigationProvider>(context);
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(
      //     "Provider Sample",
      //   ),
      // ),
      body: _navigationBody(),
      bottomNavigationBar: _bottomNavigationBarWidget(),
    );
  }
}
