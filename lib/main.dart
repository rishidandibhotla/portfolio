import 'package:flutter/material.dart';

const Color kPrimary = Color(0xFF4659B8);
const Color kPrimaryDark = Color(0xFF334594);
const Color kLavender = Color(0xFFE7EAF7);
const Color kPage = Color(0xFFFAFAFA);
const Color kText = Color(0xFF424242);

void main() {
  runApp(const RishiPortfolioApp());
}

class RishiPortfolioApp extends StatelessWidget {
  const RishiPortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Portfolio',
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: kPage,
        fontFamily: 'Roboto',
        colorScheme: ColorScheme.fromSeed(seedColor: kPrimary),
      ),
      initialRoute: '/',
      routes: {
        '/': (_) => const HomePage(),
        '/about': (_) => const AboutPage(),
        '/projects': (_) => const ProjectsPage(),
      },
    );
  }
}

class PortfolioAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool showBack;

  const PortfolioAppBar({
    super.key,
    required this.title,
    this.showBack = false,
  });

  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: kPrimary,
      foregroundColor: Colors.black87,
      elevation: 0,
      centerTitle: true,
      automaticallyImplyLeading: false,
      leading: showBack
          ? IconButton(
              onPressed: () => Navigator.of(context).pop(),
              padding: EdgeInsets.zero,
              icon: const Icon(Icons.arrow_back, size: 26),
              tooltip: 'Back',
            )
          : null,
      title: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 29,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PortfolioAppBar(title: 'My Portfolio'),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final isSmall = constraints.maxWidth < 600;

            return Center(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(
                  horizontal: isSmall ? 20 : 24,
                  vertical: 20,
                ),
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 900),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Avatar(),
                      const SizedBox(height: 26),
                      const Text(
                        'RISHI DANDIBHOTLA',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: kPrimaryDark,
                          fontSize: 29,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 12),
                      const Text(
                        'B.Tech 3rd Year • Computer Science',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFF5D5D5D),
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(height: 38),
                      HomeButton(
                        label: 'About Me',
                        onPressed: () => Navigator.pushNamed(context, '/about'),
                      ),
                      const SizedBox(height: 18),
                      HomeButton(
                        label: 'Projects',
                        onPressed: () => Navigator.pushNamed(context, '/projects'),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PortfolioAppBar(title: 'About Me', showBack: true),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final isSmall = constraints.maxWidth < 720;

            return SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.fromLTRB(
                  isSmall ? 14 : 24,
                  isSmall ? 34 : 270,
                  isSmall ? 14 : 24,
                  40,
                ),
                child: Card(
                  color: kLavender,
                  elevation: 7,
                  shadowColor: Colors.black26,
                  margin: EdgeInsets.zero,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(
                      isSmall ? 22 : 46,
                      isSmall ? 30 : 46,
                      isSmall ? 22 : 46,
                      isSmall ? 30 : 32,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(
                          Icons.person,
                          size: 70,
                          color: kPrimary,
                        ),
                        const SizedBox(height: 22),
                        const Text(
                          'Hello! I’m Rishi Dandibhotla, a passionate Computer Science Engineering student. I enjoy exploring algorithms and AI, building software projects, and solving real-world problems. My skills include Python, Java, Dynamic Programming, AI fundamentals, Flutter and Dart, problem solving, and GitHub.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: kText,
                            fontSize: 19,
                            height: 1.45,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const SizedBox(height: 30),
                        HomeButton(
                          label: 'Back to Home',
                          onPressed: () => Navigator.of(context).pop(),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class ProjectsPage extends StatelessWidget {
  const ProjectsPage({super.key});

  static const projects = <ProjectData>[
    ProjectData(
      title: 'Hurestic_programing',
      description: 'Python programs for heuristic/problem-solving experiments, including bosspuzzle.py and checkdetection.py.',
    ),
    ProjectData(
      title: 'Dynamic_programming',
      description: 'Python implementations for sequence alignment using Smith-Waterman and Wushman-Neddle algorithms.',
    ),
    ProjectData(
      title: 'RISHI',
      description: 'A personal learning repository focused on developing algorithms and understanding artificial intelligence.',
    ),
    ProjectData(
      title: 'TurboScribe',
      description: 'An AI transcription project for converting audio and video into useful, searchable text.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PortfolioAppBar(title: 'My Projects', showBack: true),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final isSmall = constraints.maxWidth < 700;

            return SingleChildScrollView(
              padding: EdgeInsets.fromLTRB(
                isSmall ? 12 : 20,
                isSmall ? 20 : 34,
                isSmall ? 12 : 20,
                40,
              ),
              child: Column(
                children: [
                  for (int i = 0; i < projects.length; i++) ...[
                    ProjectCard(project: projects[i]),
                    if (i != projects.length - 1) const SizedBox(height: 20),
                  ],
                  const SizedBox(height: 36),
                  HomeButton(
                    label: 'Back to Home',
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class Avatar extends StatelessWidget {
  const Avatar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 156,
      height: 156,
      decoration: const BoxDecoration(
        color: Color(0xFFE5D8FB),
        shape: BoxShape.circle,
      ),
    );
  }
}

class HomeButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  const HomeButton({
    super.key,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 208,
      height: 38,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: kPrimary,
          foregroundColor: Colors.white,
          elevation: 2,
          padding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          textStyle: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
        child: Text(label),
      ),
    );
  }
}

class ProjectData {
  final String title;
  final String description;

  const ProjectData({
    required this.title,
    required this.description,
  });
}

class ProjectCard extends StatelessWidget {
  final ProjectData project;

  const ProjectCard({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Card(
        color: Colors.white,
        elevation: 4,
        shadowColor: Colors.black26,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(17),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                project.title,
                style: const TextStyle(
                  color: kPrimaryDark,
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                project.description,
                style: const TextStyle(
                  color: kText,
                  fontSize: 17,
                  height: 1.35,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
