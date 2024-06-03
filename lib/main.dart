// import 'package:flutter/material.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'NavigationRail Example',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: const NavigationRailExample(),
//     );
//   }
// }

// class NavigationRailExample extends StatefulWidget {
//   const NavigationRailExample({super.key});

//   @override
//   _NavigationRailExampleState createState() => _NavigationRailExampleState();
// }

// class _NavigationRailExampleState extends State<NavigationRailExample> {
//   int _selectedIndex = 0;

//   final List<Widget> _pages = [
//     const Center(child: Text('Home Page', style: TextStyle(fontSize: 24))),
//     const Center(child: Text('Profile Page', style: TextStyle(fontSize: 24))),
//     const Center(child: Text('Settings Page', style: TextStyle(fontSize: 24))),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Row(
//         children: <Widget>[
//           NavigationRail(
//             selectedIndex: _selectedIndex,
//             onDestinationSelected: (int index) {
//               setState(() {
//                 _selectedIndex = index;
//               });
//             },
//             labelType: NavigationRailLabelType.selected,
//             destinations: const [
//               NavigationRailDestination(
//                 icon: Icon(Icons.home),
//                 selectedIcon: Icon(Icons.home_filled),
//                 label: Text('Home'),
//               ),
//               NavigationRailDestination(
//                 icon: Icon(Icons.person),
//                 selectedIcon: Icon(Icons.person),
//                 label: Text('Profile'),
//               ),
//               NavigationRailDestination(
//                 icon: Icon(Icons.settings),
//                 selectedIcon: Icon(Icons.settings),
//                 label: Text('Settings'),
//               ),
//             ],
//           ),
//           const VerticalDivider(thickness: 1, width: 1),
//           Expanded(
//             child: _pages[_selectedIndex],
//           )
//         ],
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Bottom Navigation Bar with IndexedStack',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: const BottomNavBarExample(),
//     );
//   }
// }

// class BottomNavBarExample extends StatefulWidget {
//   const BottomNavBarExample({super.key});

//   @override
//   _BottomNavBarExampleState createState() => _BottomNavBarExampleState();
// }

// class _BottomNavBarExampleState extends State<BottomNavBarExample> {
//   int _selectedIndex = 0;

//   final List<Widget> _pages = [
//     const HomePage(),
//     const ProfilePage(),
//     const SettingsPage(),
//   ];

//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     print("Build qayta ishladi");
//     return Scaffold(
//       body: IndexedStack(
//         index: _selectedIndex,
//         children: _pages,
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         items: const <BottomNavigationBarItem>[
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             label: 'Home',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.person),
//             label: 'Profile',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.settings),
//             label: 'Settings',
//           ),
//         ],
//         currentIndex: _selectedIndex,
//         selectedItemColor: Colors.amber[800],
//         onTap: (int index){

//         },
//       ),
//     );
//   }
// }

// class HomePage extends StatelessWidget {
//   const HomePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const Center(
//       child: Text('Home Page', style: TextStyle(fontSize: 24)),
//     );
//   }
// }

// class ProfilePage extends StatelessWidget {
//   const ProfilePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const Center(
//       child: Text('Profile Page', style: TextStyle(fontSize: 24)),
//     );
//   }
// }

// class SettingsPage extends StatelessWidget {
//   const SettingsPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const Center(
//       child: Text('Settings Page', style: TextStyle(fontSize: 24)),
//     );
//   }
// }


import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  List<Widget> _pages = [
    HomePage(),
    ResultsPage(),
    ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 600) {
          return Scaffold(
            body: _pages[_selectedIndex],
            bottomNavigationBar: BottomNavigationBar(
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.assessment),
                  label: 'Results',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: 'Profile',
                ),
              ],
              currentIndex: _selectedIndex,
              onTap: _onItemTapped,
            ),
          );
        } else {
          return Scaffold(
            body: Row(
              children: [
                NavigationRail(
                  selectedIndex: _selectedIndex,
                  onDestinationSelected: _onItemTapped,
                  labelType: NavigationRailLabelType.all,
                  destinations: [
                    NavigationRailDestination(
                      icon: Icon(Icons.home),
                      label: Text('Home'),
                    ),
                    NavigationRailDestination(
                      icon: Icon(Icons.assessment),
                      label: Text('Results'),
                    ),
                    NavigationRailDestination(
                      icon: Icon(Icons.person),
                      label: Text('Profile'),
                    ),
                  ],
                ),
                Expanded(
                  child: _pages[_selectedIndex],
                ),
              ],
            ),
          );
        }
      },
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: [
          Card(
            child: Center(child: Text('Plans')),
          ),
          Card(
            child: Center(child: Text('Reminders')),
          ),
        ],
      ),
    );
  }
}

class ResultsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Results'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Plans:'),
            Text('Completed: 5'),
            Text('Not Completed: 3'),
            SizedBox(height: 20),
            Text('Reminders:'),
            Text('Total Reminders: 10'),
          ],
        ),
      ),
    );
  }
}

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String _name = 'John Doe';
  String _surname = 'Doe';
  String _phone = '123-456-7890';
  String _imageUrl = 'https://via.placeholder.com/150';

  void _editProfile() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return EditProfileForm(
          name: _name,
          surname: _surname,
          phone: _phone,
          onSave: (name, surname, phone) {
            setState(() {
              _name = name;
              _surname = surname;
              _phone = phone;
            });
            Navigator.of(context).pop();
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(_imageUrl),
            ),
            SizedBox(height: 16),
            Text('Name: $_name'),
            Text('Surname: $_surname'),
            Text('Phone: $_phone'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _editProfile,
              child: Text('Edit Profile'),
            ),
          ],
        ),
      ),
    );
  }
}

class EditProfileForm extends StatefulWidget {
  final String name;
  final String surname;
  final String phone;
  final Function(String, String, String) onSave;

  EditProfileForm({
    required this.name,
    required this.surname,
    required this.phone,
    required this.onSave,
  });

  @override
  _EditProfileFormState createState() => _EditProfileFormState();
}

class _EditProfileFormState extends State<EditProfileForm> {
  late TextEditingController _nameController;
  late TextEditingController _surnameController;
  late TextEditingController _phoneController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.name);
    _surnameController = TextEditingController(text: widget.surname);
    _phoneController = TextEditingController(text: widget.phone);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _surnameController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        children: [
          TextField(
            controller: _nameController,
            decoration: InputDecoration(labelText: 'Name'),
          ),
          TextField(
            controller: _surnameController,
            decoration: InputDecoration(labelText: 'Surname'),
          ),
          TextField(
            controller: _phoneController,
            decoration: InputDecoration(labelText: 'Phone'),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              widget.onSave(
                _nameController.text,
                _surnameController.text,
                _phoneController.text,
              );
            },
            child: Text('Save'),
          ),
        ],
      ),
    );
  }
}
