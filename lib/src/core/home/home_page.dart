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
                    _buildWidget(
                        'Classifica\nGiochi', Colors.red, '/widget1', 'giochi'),
                    _buildWidget(
                        '1v1 Me', Colors.yellow, '/widget3', 'onevsone'),
                    _buildWidget('Perudo', Colors.orange, '/widget4', 'perudo'),
                    _buildWidget(
                        'Chiamala', Colors.purple, '/widget6', 'chiamala'),
                  ]),
                  _buildGridPage([
                    _buildWidget('Cosa Mimi', Colors.cyan, '/widget5', 'mimi'),
                    _buildWidget(
                        'Veto Tracker', Colors.green, '/widget2', 'veto'),
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

  Widget _buildWidget(String title, Color color, String route, String iconUrl) {
    return GestureDetector(
      onTap: () {
        // Add navigation or functionality here
      },
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                  'lib/assets/images/$iconUrl.png'), // Path to your image
              fit: BoxFit.cover,
              opacity: 0.7),
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
              fontWeight: FontWeight.w800,
              fontSize: 28.0, // Increase the font size
            ),
          ),
        ),
      ),
    );
  }

  Widget _settingsButton() {
    return const Center(
        child: Icon(Icons.settings, color: Colors.white, size: 50.0));
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
