# 🎓 SkillBit - Interactive Learning Platform

<div align="center">

![Flutter](https://img.shields.io/badge/Flutter-3.x-blue?style=for-the-badge&logo=flutter)
![Dart](https://img.shields.io/badge/Dart-Latest-blue?style=for-the-badge&logo=dart)
![License](https://img.shields.io/badge/License-MIT-green?style=for-the-badge)

**Master Programming Skills Through Interactive Challenges, Real-Time Contests, and Gamified Learning**

[Key Features](#-key-features) • [Getting Started](#-getting-started) • [Technical Architecture](#-technical-architecture) • [Gamification Deep Dive](#-gamification-deep-dive) • [Contributing](#-contributing)

</div>

---

## 📱 Project Overview

**SkillBit** is an innovative, interactive online learning platform designed specifically for programming beginners and junior developers. Drawing inspiration from platforms like SoloLearn and LeetCode, SkillBit combines structured course content, interactive quizzes, and competitive weekly contests to create an engaging learning experience that motivates skill development.

Whether you're just starting your programming journey or looking to strengthen your fundamentals, SkillBit provides a comprehensive ecosystem to learn, practice, and compete with learners worldwide.

---

## 🚀 Key Features

### 👤 Intelligent User Onboarding
- **Flexible Learning Path**: Begin at Level 1 or take an AI-powered assessment test
- **Personalized Level Placement**: Our AI model analyzes your test responses to place you at an appropriate starting level
- **Continuous Progress**: Advance through levels as you master new concepts

### 📚 Structured Learning System

#### Course Architecture
- **Organized Curriculum**: Courses broken down into progressive lessons
- **Comprehensive Lessons**: Each lesson covers specific programming concepts with detailed explanations
- **Reinforcing Quizzes**: 
  - Quiz content covers the current lesson + previous lessons for reinforcement
  - Immediate feedback on answers
  - Hints and explanations for incorrect responses

#### Achievement System
- **Milestone Recognition**: Unlock "Contestant Achievement" badges upon course completion
- **Skill Verification**: Demonstrates mastery of course material

### 🏆 Weekly Contests

#### Contest Features
- **Exclusive Access**: Only users with "Contestant Achievement" can participate
- **Level-Specific Contests**: Each student level has its own contest difficulty tier
- **Comprehensive Coverage**: Contests cover all topics studied within a specific level
- **Flexible Review**:
  - Post-contest answer review with hints explaining solution logic
  - Optional skipping of review for quick leaderboard navigation

#### Leaderboards & Recognition
- **Visual Podium System**: Top 3 performers displayed on a prestigious podium
- **Comprehensive Rankings**: Remaining participants listed in order of performance
- **Personal Highlighting**: Your position prominently highlighted in the leaderboard
- **Real-Time Updates**: Live leaderboard tracking during and after contests

### 🎮 Gamification System

#### Point & Badge System
- **Earn Points Through**:
  - ✅ Completing courses
  - 🏅 Unlocking achievements
  - 🥇 Performing well in weekly contests
- **Progress-Based Badges**: Badges representing your rank and expertise level
- **Community Standing**: Showcase your badges among the app community
- **Motivation Engine**: Visible progression encourages continued learning and participation

---

## 🏗️ Technical Architecture

### Technology Stack

#### Frontend Framework
- **Flutter**: 88% of codebase - Cross-platform mobile development
- **Dart**: Primary programming language

#### Architecture & State Management
- **Clean Architecture**: Organized, maintainable, and scalable codebase structure
- **Bloc Pattern**: Robust state management for predictable app behavior
- **GoRouter**: Modern routing solution for seamless navigation
- **Dependency Injection**: Get_IT for efficient DI container management

#### HTTP & Networking
- **Dio**: Powerful HTTP client with interceptor support for API calls
- **Interceptors**: Request/response handling, error management, authentication

#### Data Visualization
- **fl_chart**: Beautiful, responsive charts for progress tracking and statistics
- **Performance Analytics**: Visual representation of learning progress

#### Platform-Specific
- **C++**: 6.1% of codebase - Native performance optimization
- **Swift**: 0.5% of codebase - iOS-specific functionality
- **C**: 0.4% of codebase - Low-level optimizations
- **CMake**: 4.7% of codebase - Native build configuration

### Project Structure

```
SkillBit/
├── lib/
│   ├── core/                 # Core utilities, constants, theme
│   ├── features/             # Feature modules (courses, contests, auth, etc.)
│   │   └── [feature]/
│   │       ├── data/        # Data layer (repositories, data sources)
│   │       ├── domain/      # Domain layer (entities, use cases)
│   │       └── presentation/ # Presentation layer (UI, bloc, pages)
│   ├── config/              # App configuration & DI setup
│   └── main.dart           # App entry point
├── scripts/
│   └── generate_injector    # DI template generator script
├── pubspec.yaml            # Dart/Flutter dependencies
└── README.md              # This file
```

### Design Patterns

- **Repository Pattern**: Abstract data sources from business logic
- **Use Case Pattern**: Encapsulate business logic in dedicated classes
- **Bloc Pattern**: Manage UI state with clear separation of concerns
- **Dependency Injection**: Loose coupling through injected dependencies

---

## 🎯 Gamification Deep Dive

### Point System
The point system is the core of SkillBit's motivation engine:

| Activity | Points | Reward Type |
|----------|--------|------------|
| Complete Lesson | 10 | Course Progress |
| Pass Lesson Quiz | 25 | Knowledge Verification |
| Complete Course | 100 | Contestant Achievement |
| Weekly Contest Participation | 50 | Base Participation |
| Contest 1st Place | 150 | Top Tier |
| Contest 2nd Place | 100 | High Achievement |
| Contest 3rd Place | 75 | Recognition |
| Top 10 Finish | 50 | Encouragement |

### Badge Tiers
Badges unlock progressively as users accumulate points:

```
🥉 Bronze Badge    → 500 points   (Beginner)
🥈 Silver Badge    → 1,500 points (Intermediate)
🥇 Gold Badge      → 3,000 points (Advanced)
💎 Platinum Badge  → 5,000 points (Expert)
👑 Master Badge    → 10,000 points (Master)
```

### Leaderboard Tiers
- **Global Leaderboard**: Top performers across all levels
- **Level-Specific Leaderboards**: Competition within your learning level
- **Weekly Contest Leaderboards**: Fresh competition every week
- **Monthly Achievements**: Seasonal rankings and special recognitions

---

## 🛠️ Getting Started

### Prerequisites
- Flutter SDK (3.0 or higher)
- Dart SDK (3.0 or higher)
- Android Studio / Xcode (for emulator)
- Git

### Installation

1. **Clone the Repository**
   ```bash
   git clone https://github.com/Phly101/SkillBit.git
   cd SkillBit
   ```

2. **Install Dependencies**
   ```bash
   flutter pub get
   ```

3. **Generate DI Files** (Optional - for new features)
   ```bash
   dart scripts/generate_injector.dart
   ```
   This script automatically generates dependency injection templates for new features, eliminating manual DI configuration.

4. **Run the App**
   ```bash
   flutter run
   ```

5. **Build for Release**
   ```bash
   # Android
   flutter build apk --release
   
   # iOS
   flutter build ios --release
   ```

### Development Setup

#### Code Generation
The project uses code generation for part of its functionality:
```bash
flutter pub run build_runner build
```

#### Running Tests
```bash
flutter test
```

#### Linting
```bash
flutter analyze
```

---

## 📖 User Journey

### Onboarding Flow
```
User Sign Up/Login
    ↓
Assessment Test (Optional) ← AI Level Placement
    ↓
Start at Appropriate Level
    ↓
Choose Course
```

### Learning Flow
```
Course Selection
    ↓
Complete Lessons
    ↓
Pass Quizzes
    ↓
Unlock Contestant Achievement
    ↓
Join Weekly Contests
    ↓
View Leaderboards
    ↓
Earn Points & Badges
```

### Contest Flow
```
Contest Starts
    ↓
Attempt Questions (Level-Appropriate)
    ↓
Submit Answers
    ↓
View Results
    ↓
Review with Hints (Optional)
    ↓
Check Leaderboard
    ↓
Track Progress & Points
```

---

## 🤖 AI-Powered Features

### Intelligent Assessment System
- **Adaptive Testing**: Questions adjust based on previous answers
- **Accurate Placement**: AI model analyzes response patterns to determine optimal starting level
- **Hint Generation**: AI-powered hint system explains solution reasoning
- **Personalized Learning**: Recommendations based on performance data

---

## 📊 Analytics & Progress Tracking

### User Dashboard
- **Progress Visualization**: Charts showing course completion and score trends
- **Badge Collection**: Visual display of earned badges
- **Contest History**: Past contest performance and results
- **Learning Statistics**: Time spent, topics mastered, improvement areas

### Performance Metrics
- **Course Completion Rate**: Track progress through courses
- **Quiz Accuracy**: Monitor understanding of concepts
- **Contest Rankings**: Track competitive performance
- **Point Accumulation**: Visualize badge progression toward next tier

---

## 🔐 Security & Privacy

- **Secure Authentication**: Protected user credentials
- **Data Encryption**: Sensitive user data encrypted in transit and at rest
- **API Security**: Interceptors for request validation and error handling
- **Privacy First**: User data handling complies with privacy regulations

---

## 🚀 Performance Optimization

- **Native Code**: C++ and Swift integration for performance-critical operations
- **Efficient State Management**: Bloc pattern prevents unnecessary rebuilds
- **Lazy Loading**: Courses and contest data loaded on-demand
- **Caching Strategy**: Smart caching of frequently accessed data
- **Image Optimization**: Optimized asset delivery

---

## 📦 Key Dependencies

```yaml
# State Management & Navigation
flutter_bloc: ^8.x
go_router: ^10.x

# HTTP & Networking
dio: ^5.x

# Dependency Injection
get_it: ^7.x

# Data Visualization
fl_chart: ^0.65.x

# Additional Utilities
freezed_annotation: ^2.x
json_serializable: ^6.x
```

See `pubspec.yaml` for the complete list of dependencies.

---

## 🎨 Features in Development

- [ ] Offline learning mode for lessons
- [ ] Social features (friend requests, study groups)
- [ ] Custom practice problem creation
- [ ] Real-time multiplayer contests
- [ ] Mobile app notifications
- [ ] Advanced analytics dashboard
- [ ] Mentor matching system
- [ ] API for third-party integrations

---

## 🤝 Contributing

We welcome contributions from the community! Here's how to get involved:

### Steps to Contribute

1. **Fork the Repository**
   ```bash
   git clone https://github.com/[your-username]/SkillBit.git
   ```

2. **Create a Feature Branch**
   ```bash
   git checkout -b feature/amazing-feature
   ```

3. **Follow Code Standards**
   - Follow Dart style guide
   - Maintain Clean Architecture principles
   - Use Bloc pattern for state management
   - Add unit/widget tests for new features

4. **Generate DI for New Features**
   ```bash
   dart scripts/generate_injector.dart [feature_name]
   ```

5. **Commit Changes**
   ```bash
   git commit -m 'Add amazing feature'
   ```

6. **Push to Branch**
   ```bash
   git push origin feature/amazing-feature
   ```

7. **Open a Pull Request**
   - Provide clear description of changes
   - Include before/after screenshots if UI changes
   - Link related issues
   - Ensure all tests pass

### Code Style Guidelines

- Use meaningful variable and function names
- Document complex logic with comments
- Follow Dart formatting conventions
- Keep functions single-responsibility
- Maintain consistent indentation (2 spaces)

### Reporting Issues

Found a bug? Have a feature suggestion? [Open an issue](https://github.com/Phly101/SkillBit/issues) with:
- Clear title and description
- Steps to reproduce (for bugs)
- Expected vs actual behavior
- Screenshots if applicable
- Environment details (Flutter version: 3.41.3, OS: Windows, device: Mobile Phones)

---

## 📝 License

This project is licensed under the MIT License - see the LICENSE file for details.

---

## 👨‍💻 Author

**Phly101** - Full-stack developer passionate about education technology and mobile development.

---

## 🙏 Acknowledgments

- Flutter team for the amazing framework
- Community contributors and testers
- Design inspiration from SoloLearn and LeetCode
- Educators and learners who shaped the vision

---

## 📞 Support & Contact

- **GitHub Issues**: For bug reports and feature requests
- **Discussions**: For general questions and discussions
- **Email**: [basel6889@gmail.com]

---

## 🌟 Show Your Support

If you find SkillBit valuable, please consider:
- ⭐ Starring the repository
- 🐛 Reporting bugs and suggesting features
- 📤 Sharing with fellow developers
- 🤝 Contributing code improvements
- 💬 Providing feedback

---

<div align="center">

**Happy Learning! 🚀**

Built with ❤️ for the developer community

</div>
