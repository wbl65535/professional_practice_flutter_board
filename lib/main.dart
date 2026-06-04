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
        useMaterial3: true,
      ),
      home: const PracticeHomePage(),
    );
  }
}

class PracticeHomePage extends StatelessWidget {
  const PracticeHomePage({super.key});

  static const String projectTitle = '专业实践 Flutter 协作成果展示';
  static const String projectSlogan = '用 Flutter Web 记录小组分工、实践任务与 GitHub PR 协作过程';

  static const List<Member> members = [
    Member(role: '组长', name: '张三', task: '创建仓库、维护 main 分支、创建 Issue、审核 PR'),
    Member(role: '组员 A', name: '李四', task: '修改实践主题和页面口号'),
    Member(role: '组员 B', name: '王五', task: '补充小组成员姓名与任务分工'),
    Member(role: '组员 C', name: '赵六', task: '整理 Flutter 实践任务清单'),
    Member(role: '组员 D', name: '孙七', task: '记录 GitHub 协作进度和提交说明'),
  ];

  static const List<String> practiceTasks = [
    '检查 Flutter Web 环境，确认 Chrome 或 Edge 可运行',
    '理解 Widget 树、声明式 UI 和 Flutter Web 的基本思想',
    '创建并运行个人 HelloWorld，提交带本人信息的截图',
    '基于小组展示页项目完成 Fork + Branch + Pull Request 协作',
    'PR 合并后提交 Contributors 标注截图',
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
    return const Card(
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              PracticeHomePage.projectTitle,
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(PracticeHomePage.projectSlogan, style: TextStyle(fontSize: 16)),
          ],
        ),
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
        const Text('小组成员与分工', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
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
      child: ListTile(
        leading: CircleAvatar(child: Text(member.role.characters.last)),
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
            const Text('Flutter 实践任务清单', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
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
            const Text('GitHub 协作进度与提交说明', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
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
