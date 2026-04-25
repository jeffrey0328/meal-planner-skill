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
- `CHANGELOG.md`
- `templates/` 下任何文件
- 未来可能新增的 `scripts/`、`reference.md` 等结构性文件

## 更新日志（每次改定义都要写）

只要修改了任意 **skill 定义文件**（例如 `SKILL.md` / `templates/**` / `README.md` / 同步脚本等），必须在 `CHANGELOG.md` 的**当天日期小节**追加 1 条记录，说明这次改了什么（1-3 行即可）。

> 不记录用户数据的日常变化：`dish-library.md`、`dish-details.md`、`meal-plan-*.md`、`user-profile.md` 的内容更新属于用户数据，不写进 `CHANGELOG.md`。

### 哪些是 "用户数据"（改了 → 不要同步）

这些在版本库/个人 skill 与日常使用时**不随同步脚本**互相覆盖，由用户本地、对话中管理：

| 文件 / 位置 | 性质 |
|------------|------|
| `user-profile.md` | 始终在** skill 根目录**；可含第 0 节「`DATA_ROOT`」指向**外部绝对路径** |
| `dish-library.md` | 默认在 skill 同目录，否则在 **user-profile 第 0 节** 的 `DATA_ROOT`（仅**允许**在 `DATA_ROOT` 中存在的两类用户文件之一） |
| `meal-plan-YYYY-MM.md` | 同上，与 `dish-library` 始终同根，且**只**有这两类可放在 `DATA_ROOT`；**不要**在 `DATA_ROOT` 放档案、说明或其它文件 |

> 同步脚本在 `/XF` 里已排除 `user-profile`、菜品库、月份食谱的**文件名**（以免覆盖 skill 目录下的本地副本；若 `DATA_ROOT` 在外部盘，本脚本本来就不触及，需自行备份）。

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
