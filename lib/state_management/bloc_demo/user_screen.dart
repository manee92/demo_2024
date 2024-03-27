import 'package:calendar_app/state_management/bloc_demo/user_bloc/user_bloc.dart';
import 'package:calendar_app/state_management/bloc_demo/user_bloc/user_event.dart';
import 'package:calendar_app/state_management/bloc_demo/user_bloc/user_state.dart';
import 'package:calendar_app/state_management/bloc_demo/user_model.dart';
import 'package:calendar_app/state_management/bloc_demo/user_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xffffdfde)),
        useMaterial3: true,
      ),
      home: MultiBlocProvider(
        providers: [
          BlocProvider<UserListBloc>(
            create: (BuildContext context) =>
                UserListBloc(userRepository: UserRepository()),
          ),
        ],
        child: const MyHomePage(title: 'User List'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    context.read<UserListBloc>().add(const LoadUserList());
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: BlocBuilder<UserListBloc, UserListState>(
        builder: (context, state) {
          if (state is UserListLoading) {
            return SizedBox(
              height: h,
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else if (state is UserListSuccess) {
            return  UserList(userList:state.userList);
          } else {
            return const ErrorScreen();
          }
        },
      ),
    );
  }
}

class UserList extends StatelessWidget {
   const UserList({Key? key, required this.userList}) : super(key: key);
  final List<User> userList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: userList.length,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        itemBuilder: (BuildContext context, index) {
      return  UserCard(user:userList[index]);
    });
  }
}

class UserCard extends StatelessWidget {
  const UserCard({Key? key, required this.user}) : super(key: key);
  final User user;

  @override
  Widget build(BuildContext context) {
    return  Card(
      margin: const EdgeInsets.only(bottom: 10),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Row(
              children: [
                 Expanded(
                  flex: 0,
                    child: CircleAvatar(
                      child: Text(user.name[0]),
                    )),
                const SizedBox(width: 20),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(user.name, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 15),),
                      Text(user.email,style: const TextStyle(fontSize: 12),)
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Card(
      child: Column(
        children: [Text("Error")],
      ),
    );
  }
}
