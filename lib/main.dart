import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import 'providers/assignment_api.dart';
import 'providers/course_api.dart';
import 'providers/group_api.dart';
import 'providers/homework_api.dart';
import 'providers/result_api.dart';
import 'providers/student_api.dart';
import 'screens/categories_screen.dart';
import 'screens/home_screen.dart';
import 'screens/login_screen.dart';
import 'screens/result_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => GroupApi()),
        ChangeNotifierProvider(create: (context) => HomeworkApi()),
        ChangeNotifierProvider(create: (context) => StudentApi()),
        ChangeNotifierProvider(create: (context) => CourseApi()),
        ChangeNotifierProvider(create: (context) => ResultApi()),
        ChangeNotifierProvider(create: (context) => AssignmentApi()),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'CodeAcademy',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routerConfig: GoRouter(
          initialLocation: '/',
          routes: [
            GoRoute(
              path: '/',
              name: LoginScreen.routeName,
              builder: (context, state) => LoginScreen(),
              routes: [
                GoRoute(
                  path: 'home',
                  name: HomeScreen.routeName,
                  builder: (context, state) => const HomeScreen(),
                  routes: [
                    GoRoute(
                      path: 'category/:id',
                      name: CategoriesScreen.routeName,
                      builder: (context, state) => CategoriesScreen(
                        id: int.parse(state.params['id'] as String),
                        groupName: state.extra.toString(),
                      ),
                      routes: [
                        GoRoute(
                          path: 'results/:assignmentId/:lessonId',
                          name: ResultScreen.routeName,
                          builder: (context, state) => ResultScreen(
                            assignmentId: int.parse(state.params['assignmentId'] as String),
                            lessonId: int.parse(state.params['lessonId'] as String),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
