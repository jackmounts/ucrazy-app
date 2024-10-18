import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController _pageController = PageController(initialPage: 1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(color: Color.fromARGB(255, 51, 51, 51)),
        child: Column(
          children: [
            Expanded(
              child: PageView(
                controller: _pageController,
                children: [
                  _buildSettingPage(),
                  _buildGridPage([
                    _buildWidget('Classifica Giochi', Colors.red, '/widget1'),
                    _buildWidget('Veto Tracker', Colors.green, '/widget2'),
                    _buildWidget('1v1 Me', Colors.yellow, '/widget3'),
                    _buildWidget('Perudo', Colors.orange, '/widget4'),
                  ]),
                  _buildGridPage([
                    _buildWidget('Cosa Mimi', Colors.cyan, '/widget5'),
                    _buildWidget('Chiamala', Colors.purple, '/widget6'),
                    _buildEmpty(),
                    _buildEmpty(),
                  ]),
                ],
              ),
            ),
            SmoothPageIndicator(
              controller: _pageController,
              count: 3, // Number of pages
              effect: const ExpandingDotsEffect(
                dotHeight: 12.0,
                dotWidth: 12.0,
                activeDotColor: Color.fromARGB(255, 227, 227, 227),
                dotColor: Colors.grey,
              ),
            ),
            const SizedBox(height: 22.0), // Add some space below the indicator
          ],
        ),
      ),
    );
  }

  Widget _buildGridPage(List<Widget> widgets) {
    return Center(
      child: GridView.count(
        crossAxisCount: 2, // Number of columns
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 10.0,
        shrinkWrap: true,
        padding: const EdgeInsets.fromLTRB(8, 24, 8, 0),
        physics: const NeverScrollableScrollPhysics(), // Disable scrolling
        childAspectRatio: 0.5,
        children: widgets,
      ),
    );
  }

  Widget _buildEmpty() {
    return Container(
      margin: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 51, 51, 51),
        borderRadius: BorderRadius.circular(8.0),
      ),
    );
  }

  Widget _buildWidget(String title, Color color, String route) {
    return GestureDetector(
      onTap: () {
        // Add navigation or functionality here
      },
      child: Container(
        // margin: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Center(
          child: Text(
            title,
            textAlign: TextAlign.center,
            softWrap: true,
            overflow: TextOverflow.visible,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20.0, // Increase the font size
            ),
          ),
        ),
      ),
    );
  }

  Widget _settingsButton() {
    return Center(
        child: Container(
      child: const Icon(Icons.settings, color: Colors.white, size: 50.0),
    ));
  }

  Widget _buildSettingPage() {
    return Center(
      child: GridView.count(
        crossAxisCount: 1, // Number of columns
        childAspectRatio: 1,
        children: [_settingsButton()],
      ),
    );
  }
}
