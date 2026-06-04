# 专业实践 Flutter 小组展示页

这是《专业实践（二）》第14周“Flutter 入门与小组协作实践”的初始项目。

## 本地运行

```powershell
flutter pub get
flutter run -d chrome
```

如果只检查代码：

```powershell
flutter analyze
```

本周课堂最低要求是 `flutter run -d chrome` 能看到页面运行效果。

## 组员修改位置

所有组员本周主要修改：

```text
lib/main.dart
```

分工建议：

1. 组员 A：修改 `projectTitle` 和 `projectSlogan`。
2. 组员 B：修改 `members` 中的真实姓名和分工。
3. 组员 C：修改 `practiceTasks`。
4. 组员 D：修改 `progressNotes`。

每名组员应在自己的分支上修改，提交 commit，push 到自己的 Fork，并向组长仓库发起 Pull Request。

## 可选发布

如果要发布到 GitHub Pages，把 `REPO_NAME` 替换成仓库名：

```powershell
flutter build web --base-href /REPO_NAME/
```

构建产物位于：

```text
build/web/
```
