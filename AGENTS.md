# Agent Instructions for `meal-planner-skill` Repository

> Cursor 会自动加载这个文件。任何在本仓库内工作的 agent **必须**遵守以下规则。

## 同步策略（每次改 skill 定义都要做）

本仓库是 `meal-planner-skill` 的源仓库。同一份 skill 还存在用户个人 skill 目录的副本：

- 源仓库（编辑这里）：`D:\GitClone\meal-planner-skill\`
- 个人副本（运行用）：`C:\Users\Administrator\.cursor\skills\meal-planner-skill\`

### 规则

**任何修改 skill "定义文件"** 之后，**必须立刻**运行同步脚本把改动推到个人副本：

```powershell
pwsh "D:\GitClone\meal-planner-skill\sync-to-personal.ps1"
```

否则 agent 在新会话里加载到的还是旧版 skill，用户会拿到不一致的行为。

### 哪些算 "skill 定义文件"（改了 → 必须同步）

- `SKILL.md`
- `README.md`
- `templates/` 下任何文件
- 未来可能新增的 `scripts/`、`reference.md` 等结构性文件

### 哪些是 "用户数据"（改了 → 不要同步）

这些文件在两边各自独立，**不同步、不互相覆盖**：

| 文件 | 性质 |
|------|------|
| `user-profile.md` | 用户个人偏好档案 |
| `dish-library.md` | 用户私人菜品库 |
| `meal-plan-YYYY-MM.md` | 用户每月食谱 |

> 同步脚本已经在 `/XF` 里排除以上文件，正常调用脚本不会误传。

### 仓库元/工具文件（也不同步）

- `.git/`、`AGENTS.md`、`sync-to-personal.ps1` 本身——脚本已自动排除。

### Dry-Run

如果不确定改动会怎么传：

```powershell
pwsh "D:\GitClone\meal-planner-skill\sync-to-personal.ps1" -DryRun
```

## 工作流速查

改 skill 定义的标准流程：

1. 在 `D:\GitClone\meal-planner-skill\` 中编辑（`SKILL.md` / 模板 / README）。
2. 运行 `pwsh ./sync-to-personal.ps1`。
3. 看到 `Sync OK` 即可；列出的文件清单可作为同步结果确认。

> 用户**没**要求改 skill 定义、只是在使用 skill（生成食谱、加菜、改档案）时，**不要**触发同步——那些都是用户数据，本就该留在调用所在的 skill 副本里。
