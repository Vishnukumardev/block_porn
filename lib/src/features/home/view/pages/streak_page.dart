import 'package:auto_route/annotations.dart';
import 'package:material_ui/material_ui.dart';

@RoutePage()
class StreakPage extends StatefulWidget {
  const StreakPage({super.key});

  @override
  State<StreakPage> createState() => _StreakPageState();
}

class _StreakPageState extends State<StreakPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: Text('Streak'),
            automaticallyImplyLeading: true,
          ),
        ),
      ),
    );
  }
}
