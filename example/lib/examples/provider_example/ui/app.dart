import 'package:example/examples/provider_example/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:group_button/group_button.dart';
import 'package:provider/provider.dart';

const primaryColor = Colors.purple;

/// !!!!!!!!!!!!!!!!!!! DON`T WORK NOW !!!!!!!!!!!!!!!!!!!
class GroupButtonProviderExample extends StatelessWidget {
  GroupButtonProviderExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ExercisesProvider>(
          create: (_) => ExercisesProvider(),
        ),
      ],
      builder: (ctx, _) {
        return Theme(
          data: ThemeData(
            primaryColor: primaryColor,
            primarySwatch: primaryColor,
          ),
          child: HomePage(),
        );
      },
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  var direction = Axis.horizontal;

  @override
  Widget build(BuildContext context) {
    final _eProvider = Provider.of<ExercisesProvider>(context);
    final size = MediaQuery.of(context).size;
    return DefaultTabController(
      length: _eProvider.exercise.questions.length,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('GroupButton & Provider'),
          bottom: TabBar(
            onTap: (value) {
              _eProvider.selectedIndex = value;
            },
            tabs: List.generate(
              _eProvider.exercise.questions.length,
              (index) => index + 1,
            ).map((e) => Tab(icon: Text('$e'))).toList(),
          ),
        ),
        body: _buildTabBarView(_eProvider, size),
      ),
    );
  }

  TabBarView _buildTabBarView(ExercisesProvider _eProvider, Size size) {
    return TabBarView(
      children: _eProvider.exercise.questions
          .map(
            (q) => Padding(
              padding: const EdgeInsets.all(40.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Text(
                        q.title,
                        style: const TextStyle(
                          fontSize: 24,
                        ),
                      ),
                      const SizedBox(height: 20),
                      GroupButton(
                        options: GroupButtonOptions(
                          spacing: 15,
                          selectedColor: primaryColor,
                        ),
                        isRadio: false,
                        onSelected: (_, index, isSelected) {
                          debugPrint(
                            '$index button is ${isSelected ? 'selected' : 'unselected'}',
                          );
                          _eProvider.updateAnswer(index, value: isSelected);
                        },
                        buttons: q.answerTitles,
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
                      child: const Text('Check'),
                    ),
                  ),
                ],
              ),
            ),
          )
          .toList(),
    );
  }
}
