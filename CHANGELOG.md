# 更新日志（CHANGELOG）

> 记录 **skill 定义** 的变更（`SKILL.md` / `templates/**` / `README.md` / 同步脚本等）。  
> 不记录用户数据的日常变化（例如 `dish-library.md`、`dish-details.md`、`meal-plan-*.md`、`user-profile.md` 的个人内容变更）。

---

## 2026-05-12

- 按 `jeffrey-workflow-skill` 补充 **双通道**：新增根目录 **`human-guide.html`**（仅描述本 skill，非照搬其它仓库 HTML）；**`README.md`** 增加「本目录怎么读」表与树中的相关条目。
- **`SKILL.md`** 增加 **仓库文件索引** 表，便于对照 `README` / `human-guide.html` / 模板与脚本。
- **`human-guide.html`**：去掉独立「Git 与远程」区块；远端与 `.gitignore` 仅在目录表下用一行说明（Git 非每仓必备，见 `jeffrey-workflow-skill` §2.2）。

## 2026-04-26

- 初始化 `meal-planner-skill`（显式点名调用、按月食谱归档、DATA_ROOT 规则）
- 新增/调整菜品库格式：菜名库（`dish-library.md`）与详情库（`dish-details.md`）拆分
- 增加同步脚本与仓库级 agent 规则，确保 skill 定义与个人副本一致
- `meal-plan` 模板支持“午晚相同 → 合并为正餐；不同时才拆分”

