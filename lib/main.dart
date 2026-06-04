import 'package:flutter/material.dart';

void main() {
  runApp(const ProfessionalPracticeApp());
}

class ProfessionalPracticeApp extends StatelessWidget {
  const ProfessionalPracticeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '专业实践 Flutter 小组展示页',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        scaffoldBackgroundColor: const Color(0xFFF3F8F7),
        cardTheme: const CardThemeData(
          elevation: 1,
          margin: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(18))),
        ),
        useMaterial3: true,
      ),
      home: const PracticeHomePage(),
    );
  }
}

class PracticeHomePage extends StatelessWidget {
  const PracticeHomePage({super.key});

  static const String projectTitle = '专业实践 Flutter 协作成果展示';
  static const String projectSlogan =
      '用 Flutter Web 记录小组分工、实践任务与 GitHub PR 协作过程';

  static const List<Member> members = [
    Member(role: '组长', name: '张三', task: '创建仓库、维护 main 分支、创建 Issue、审核 PR'),
    Member(role: '组员 A', name: '李四', task: '修改实践主题和页面口号'),
    Member(role: '组员 B', name: '王五', task: '补充小组成员姓名与任务分工'),
    Member(role: '组员 C', name: '赵六', task: '整理 Flutter 实践任务清单'),
    Member(role: '组员 D', name: '孙七', task: '记录 GitHub 协作进度和提交说明'),
  ];

  static const List<String> practiceTasks = [
    '完成 Flutter Web 环境检查，确认 Chrome 或 Edge 可运行',
    '创建并运行个人 HelloWorld，提交带本人信息的截图',
    '基于小组展示页项目完成一次 Fork + Pull Request 协作',
    '组长审核并合并 Pull Request，形成最终小组展示页',
  ];

  static const List<String> progressNotes = [
    'main 分支保存 Flutter 项目源代码。',
    '每名组员只修改自己负责的常量区域。',
    'Pull Request 合并后，在 Contributors 页面截图标注自己的头像。',
    '如果时间允许，组长可继续尝试发布到 GitHub Pages。',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('专业实践 Flutter 小组展示页')),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: const [
          HeroSection(),
          SizedBox(height: 18),
          MembersSection(),
          SizedBox(height: 18),
          PracticeTasksSection(),
          SizedBox(height: 18),
          ProgressSection(),
        ],
      ),
    );
  }
}

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFF00796B), Color(0xFF26A69A), Color(0xFF80CBC4)],
          ),
        ),
        child: const Padding(
          padding: EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _HeroBadge(),
              SizedBox(height: 18),
              Text(
                PracticeHomePage.projectTitle,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  height: 1.2,
                ),
              ),
              SizedBox(height: 10),
              Text(
                PracticeHomePage.projectSlogan,
                style: TextStyle(
                    color: Color(0xFFE0F2F1), fontSize: 16, height: 1.6),
              ),
              SizedBox(height: 22),
              Wrap(
                spacing: 12,
                runSpacing: 12,
                children: [
                  _HeroMetric(
                      icon: Icons.groups_rounded, label: '小组成员', value: '5 人'),
                  _HeroMetric(
                      icon: Icons.task_alt_rounded,
                      label: '实践任务',
                      value: '4 项'),
                  _HeroMetric(
                      icon: Icons.call_merge_rounded,
                      label: '协作方式',
                      value: 'PR'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _HeroBadge extends StatelessWidget {
  const _HeroBadge();

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.16),
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: Colors.white.withValues(alpha: 0.28)),
      ),
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 7),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.flutter_dash_rounded, color: Colors.white, size: 18),
            SizedBox(width: 6),
            Text(
              '第 14 周 Flutter 小组实践',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
}

class _HeroMetric extends StatelessWidget {
  const _HeroMetric({
    required this.icon,
    required this.label,
    required this.value,
  });

  final IconData icon;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.18),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.white.withValues(alpha: 0.22)),
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.white, size: 24),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                value,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(label, style: const TextStyle(color: Color(0xFFE0F2F1))),
            ],
          ),
        ],
      ),
    );
  }
}

class MembersSection extends StatelessWidget {
  const MembersSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('小组成员与分工',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        ...PracticeHomePage.members.map((member) => MemberCard(member: member)),
      ],
    );
  }
}

class MemberCard extends StatelessWidget {
  const MemberCard({required this.member, super.key});

  final Member member;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.teal.shade100,
          foregroundColor: Colors.teal.shade900,
          child: Text(member.role.characters.last),
        ),
        title: Text('${member.role}：${member.name}'),
        subtitle: Text(member.task),
      ),
    );
  }
}

class PracticeTasksSection extends StatelessWidget {
  const PracticeTasksSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Flutter 实践任务清单',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            ...PracticeHomePage.practiceTasks.map((task) => Padding(
                  padding: const EdgeInsets.only(bottom: 6),
                  child: Text('• $task'),
                )),
          ],
        ),
      ),
    );
  }
}

class ProgressSection extends StatelessWidget {
  const ProgressSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.teal.shade50,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('GitHub 协作进度与提交说明',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            ...PracticeHomePage.progressNotes.map((note) => Padding(
                  padding: const EdgeInsets.only(bottom: 6),
                  child: Text('• $note'),
                )),
          ],
        ),
      ),
    );
  }
}

class Member {
  const Member({required this.role, required this.name, required this.task});

  final String role;
  final String name;
  final String task;
}
