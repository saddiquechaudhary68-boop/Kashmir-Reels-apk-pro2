import 'package:flutter/material.dart';

void main() {
  runApp(const KashmirReelsApp());
}

class KashmirReelsApp extends StatelessWidget {
  const KashmirReelsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kashmir Reels Pro',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.black,
        primaryColor: Colors.redAccent,
      ),
      home: const MainNavigationScreen(),
    );
  }
}

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const HomeScreen(),
    const SearchScreen(),
    const CameraUploadScreen(),
    const ProfileScreen(),
    const SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        backgroundColor: Colors.black,
        selectedItemColor: Colors.redAccent,
        unselectedItemColor: Colors.white54,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.add_box, size: 35), label: 'Create'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
        ],
      ),
    );
  }
}

// 1. HOME SCREEN WITH FYP & FRIENDS SWIPE FEED
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: const TabBar(
            indicatorColor: Colors.redAccent,
            tabs: [
              Tab(text: "Friends"),
              Tab(text: "For You (FYP)"),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            ReelFeedView(feedType: "Friends"),
            ReelFeedView(feedType: "FYP"),
          ],
        ),
      ),
    );
  }
}

class ReelFeedView extends StatelessWidget {
  final String feedType;
  const ReelFeedView({super.key, required this.feedType});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> reels = [
      {
        'username': 'talha_owner',
        'caption': 'Welcome to Kashmir Reels Pro! Permanent Blue Tick Admin Account 🏔️',
        'likes': '45.2K',
        'views': '520 (Auto Boosted)',
        'followers': 1200000,
        'userRank': 1, // Super Admin
        'badge': 'Blue',
      },
      {
        'username': 'first_25_user',
        'caption': 'Early Creator #12 - Auto Free Blue Tick Active! 🎉',
        'likes': '1.2K',
        'views': '480 (Auto Boosted)',
        'followers': 450,
        'userRank': 12, // First 25 Free Blue Tick
        'badge': 'Blue',
      },
      {
        'username': 'kashmir_vlogger',
        'caption': 'Neelum Valley Waterfall Views 🌲 #Kashmir',
        'likes': '10.5K',
        'views': '510 (Auto Boosted)',
        'followers': 55000, // 50k+ Followers Criteria
        'userRank': 102,
        'badge': 'Blue',
      },
    ];

    return PageView.builder(
      scrollDirection: Axis.vertical,
      itemCount: reels.length,
      itemBuilder: (context, index) {
        final item = reels[index];
        return Stack(
          children: [
            Container(
              color: Colors.grey[900],
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.play_circle_fill, size: 80, color: Colors.white54),
                    const SizedBox(height: 10),
                    Text("$feedType Video #${index + 1}", style: const TextStyle(fontSize: 18)),
                    const SizedBox(height: 5),
                    Text("Views: ${item['views']}", style: const TextStyle(color: Colors.greenAccent)),
                  ],
                ),
              ),
            ),
            Positioned(
              left: 15,
              bottom: 30,
              right: 80,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        "@${item['username']}",
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      const SizedBox(width: 5),
                      if (item['badge'] == 'Blue')
                        const Icon(Icons.verified, color: Colors.blueAccent, size: 18),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(item['caption']),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}

// 2. SEARCH & DISCOVER ENGINE
class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          decoration: InputDecoration(
            hintText: "Search videos, creators, sounds...",
            prefixIcon: const Icon(Icons.search, color: Colors.white54),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide: BorderSide.none,
            ),
            filled: true,
            fillColor: Colors.grey[800],
          ),
        ),
      ),
      body: const Center(
        child: Text("Search Results & Trending Hashtags Engine"),
      ),
    );
  }
}

// 3. CAMERA, FILTERS & SOUNDS STUDIO
class CameraUploadScreen extends StatelessWidget {
  const CameraUploadScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Create Reel")),
      body: Column(
        children: [
          Expanded(
            child: Container(
              color: Colors.grey[850],
              child: const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.camera_alt, size: 60, color: Colors.white54),
                    SizedBox(height: 10),
                    Text("Camera Preview, Effects & Sounds Studio"),
                  ],
                ),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(20),
            color: Colors.black,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(icon: const Icon(Icons.music_note), onPressed: () {}),
                IconButton(
                  icon: const Icon(Icons.circle, color: Colors.red, size: 60),
                  onPressed: () {},
                ),
                IconButton(icon: const Icon(Icons.flip_camera_ios), onPressed: () {}),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// 4. PROFILE & ADMIN MANUAL BLUE TICK CONTROL
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Profile"),
        actions: [
          IconButton(icon: const Icon(Icons.menu), onPressed: () {}),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            const CircleAvatar(radius: 45, child: Icon(Icons.person, size: 50)),
            const SizedBox(height: 10),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("@talha_owner", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                SizedBox(width: 5),
                Icon(Icons.verified, color: Colors.blueAccent, size: 20),
              ],
            ),
            const SizedBox(height: 15),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(children: [Text("120", style: TextStyle(fontWeight: FontWeight.bold)), Text("Following")]),
                Column(children: [Text("1.2M", style: TextStyle(fontWeight: FontWeight.bold)), Text("Followers")]),
                Column(children: [Text("4.5M", style: TextStyle(fontWeight: FontWeight.bold)), Text("Likes")]),
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.redAccent),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Admin Control: Manual Blue Tick Granted!')),
                );
              },
              child: const Text("Admin: Grant Blue Tick to Selected User"),
            ),
          ],
        ),
      ),
    );
  }
}

// 5. TIKTOK-STYLE ACCOUNT SETTINGS & PRIVACY POLICIES
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Settings and Privacy")),
      body: ListView(
        children: [
          const ListTile(leading: Icon(Icons.person), title: Text("Account Management")),
          const ListTile(leading: Icon(Icons.lock), title: Text("Privacy & Safety")),
          const ListTile(leading: Icon(Icons.notifications), title: Text("Push Notifications")),
          const ListTile(leading: Icon(Icons.security), title: Text("Security & Login")),
          const ListTile(leading: Icon(Icons.verified_user), title: Text("Apply for Blue Tick Verification")),
          const ListTile(leading: Icon(Icons.policy), title: Text("Terms of Service & Privacy Policy")),
          ListTile(
            leading: const Icon(Icons.logout, color: Colors.redAccent),
            title: const Text("Log Out", style: TextStyle(color: Colors.redAccent)),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
