import 'package:example/examples/provider_example/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:group_button/group_button.dart';
import 'package:provider/provider.dart';

class GroupButtonProviderApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ExarcisesProvider>(
          create: (_) => ExarcisesProvider(),
        ),
      ],
      builder: (ctx, _) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: HomePage(),
        );
      },
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  Axis direction = Axis.horizontal;

  @override
  Widget build(BuildContext context) {
    final _eProvider = Provider.of<ExarcisesProvider>(context);
    final size = MediaQuery.of(context).size;
    return DefaultTabController(
      length: _eProvider.exercise.questions.length,
      child: Scaffold(
        appBar: AppBar(
          title: Text("GroupButton & Provider"),
          bottom: _buildTabBar(_eProvider),
        ),
        body: _buildTabBarView(_eProvider, size),
      ),
    );
  }

  TabBarView _buildTabBarView(ExarcisesProvider _eProvider, Size size) {
    return TabBarView(
      children: _eProvider.exercise.questions
          .map(
            (q) => Padding(
              padding: const EdgeInsets.all(40.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Text(
                        q.title,
                        style: TextStyle(
                          fontSize: 24,
                        ),
                      ),
                      SizedBox(height: 20),
                      GroupButton(
                        spacing: 15,
                        isRadio: false,
                        onSelected: (index, isSelected) {
                          print(
                              '$index button is ${isSelected ? 'selected' : 'unselected'}');
                          _eProvider.updateAnswer(index, isSelected);
                        },
                        selectedColor: Colors.blue,
                        buttons: q.answerTitles,
                        selectedButtons: q.selectedIndexes,
                      ),
                    ],
                  ),
                  SizedBox(
                    width: size.width,
                    child: ElevatedButton(
                      onPressed: () {
                        final result = _eProvider.checkResult();

                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              result
                                  ? 'Great! correct answer'
                                  : 'Bad answer! Try again',
                            ),
                            backgroundColor: result ? Colors.green : Colors.red,
                          ),
                        );
                      },
                      child: Text('Check'),
                    ),
                  ),
                ],
              ),
            ),
          )
          .toList(),
    );
  }

  TabBar _buildTabBar(ExarcisesProvider _eProvider) {
    return TabBar(
      onTap: (value) {
        _eProvider.selectedIndex = value;
      },
      tabs: List.generate(
        _eProvider.exercise.questions.length,
        (index) => index + 1,
      )
          .map(
            (e) => Tab(
              icon: Text('$e'),
            ),
          )
          .toList(),
    );
  }
}
