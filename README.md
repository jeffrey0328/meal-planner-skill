# meal-planner-skill

一个 Cursor Agent Skill：根据你的饮食偏好和当周饮食目标，从你私人维护的菜品库里挑菜，生成定制化的一周食谱并自动写入文件。

## 功能特点

- **首次自动建档**：会问清你的早餐 / 正餐结构、忌口、健康目标、厨房工具、菜系偏好，然后生成 `user-profile.md`。
- **私人菜品库**：所有食谱菜品都来自 `dish-library.md`，分早餐（肉类 / 蛋类 / 水果 / 主食）和正餐（肉菜 / 素菜），不会胡编。
- **菜品库随用随长**：当你说"想多吃 XX"但库里不够，agent 会先把新菜加进库再排食谱；不喜欢的菜会被标为"已停用"而不是删除。
- **按月份归档**：每月一份 `meal-plan-YYYY-MM.md`，月内按周追加小节（标题带日期段）。**跨月的一周看周一**：周一在哪月就归哪月，便于按月翻阅与统计。
- **支持各种期望**：减脂 / 增肌 / 控糖 / 食材频率 / 烹饪时间 / 重复度 / 周末加菜……都能转成约束。

## 文件结构

- **始终只在 skill 目录**：`SKILL.md`、`README.md`、`templates/**`、`user-profile.md`（档案**不会**进下面的「数据根目录」）。
- **可放在你指定的根目录`DATA_ROOT`（只限二类）**：`dish-library.md`、`meal-plan-YYYY-MM.md`。  
  在 `user-profile.md` 的 **「0. 数据文件位置」** 中填写想用的**绝对路径**；留空则 `DATA_ROOT` 与 skill 同目录。  
- **除上述二类外，不得**在 `DATA_ROOT` 中创建或迁移其它任何文件；详见主指令 `SKILL.md` 中的「数据路径」。

```
meal-planner-skill/                    # 或用户 skill 下的同名文件夹
├── SKILL.md
├── README.md
├── templates/ …
└── user-profile.md                    # 只在这里；内含 DATA_ROOT 配置

{DATA_ROOT}/                           # 可能等于上目录，或为你单独指定的绝对路径
├── dish-library.md
└── meal-plan-YYYY-MM.md
```

## 安装与启用

把整个 `meal-planner-skill/` 目录放到下面**任一**位置，Cursor 就能发现它：

| 类型 | 路径 | 适用场景 |
|------|------|---------|
| 个人 skill | `~/.cursor/skills/meal-planner-skill/` | 任何项目都能用 |
| 项目 skill | `<repo>/.cursor/skills/meal-planner-skill/` | 跟仓库一起共享 |

> 在 Windows 下，个人 skill 路径是 `C:\Users\<你>\.cursor\skills\meal-planner-skill\`。

## 怎么用

直接对 Cursor agent 说类似的话即可触发：

- "帮我规划下周的食谱"
- "排一周食谱，这周想多吃鸡胸肉，控制点碳水"
- "我在减脂，给我做一周菜单"
- "把上周的食谱里周三的鱼换成牛肉"

首次会被问一串问题（昵称、过敏、早正餐结构、偏好等），之后就只问"这周想怎么吃"即可。

## 与 agent 的协作约定

- 所有菜必须来自菜品库，缺菜会先问你能不能加。
- 菜品库与月饮食计划落在 **`user-profile` 里配置的 `DATA_ROOT`**；**只有** `dish-library.md` 和 `meal-plan-*.md` 可以进该目录，其它文件**不会**被写进那里。换目录=改第 0 节，不拆成多套路径；详见 `SKILL.md`。
- 反馈"不好吃 / 吃腻了"会让对应菜被标记停用而不是被删除，方便日后恢复。
- 反馈"很喜欢"会给菜加 `[最爱]` 标签，下周排菜时优先级更高。

## 隐私

`user-profile.md` 包含个人偏好与健康目标，菜品库与食谱可能反映饮食习惯。如果你把这个 skill 放到公共仓库里，记得用 `.gitignore` 屏蔽：

```
user-profile.md
dish-library.md
meal-plan-????-??.md
```

模板和 SKILL.md 本身不含个人数据，可以安全公开。
