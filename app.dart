import 'package:flutter/material.dart';

class AppleWatchUI extends StatefulWidget {
  @override
  _AppleWatchUIState createState() => _AppleWatchUIState();
}

class _AppleWatchUIState extends State<AppleWatchUI> {
  ScrollController _scrollController = ScrollController();
  List<int> _items =
      List.generate(40, (index) => index); // Empezamos con 40 íconos

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent - 200) {
        _loadMoreItems();
      }
    });
  }

  void _loadMoreItems() {
    setState(() {
      _items.addAll(List.generate(40, (index) => _items.length + index));
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Apple Watch UI'),
      ),
      body: GridView.builder(
        controller: _scrollController,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: _items.length,
        itemBuilder: (BuildContext context, int index) {
          return AnimatedScale(
            scale: _getScale(index),
            duration: Duration(milliseconds: 300),
            child: CircleAvatar(
              radius: 40,
              backgroundColor: _getBackgroundColor(index),
              child: Icon(
                _getIconData(index),
                size: 30,
                color: Colors.white,
              ),
            ),
          );
        },
      ),
    );
  }

  double _getScale(int index) {
    return 1.0 + (index % 10) / 20.0;
  }

  Color _getBackgroundColor(int index) {
    List<Color> colors = [
      Colors.blue,
      Colors.blueAccent,
      Colors.green,
      Colors.red,
      Colors.orange,
      Colors.purple,
      Colors.yellow,
      Colors.cyan,
      Colors.deepOrange,
      Colors.pink,
      Colors.teal,
      Colors.indigo,
      Colors.amber,
      Colors.brown,
      Colors.grey,
    ];
    return colors[index % colors.length];
  }

  IconData _getIconData(int index) {
    List<IconData> icons = [
      Icons.cloud,
      Icons.calendar_today,
      Icons.mail,
      Icons.phone,
      Icons.photo,
      Icons.map,
      Icons.access_alarm,
      Icons.mic,
      Icons.language,
      Icons.directions_run,
      Icons.message,
      Icons.music_note,
      Icons.settings,
      Icons.play_circle_filled,
      Icons.airplanemode_active,
    ];
    return icons[index % icons.length];
  }
}
