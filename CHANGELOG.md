# 更新日志（CHANGELOG）

> 记录 **skill 定义** 的变更（`SKILL.md` / `templates/**` / `README.md` / 同步脚本等）。  
> 不记录用户数据的日常变化（例如 `dish-library.md`、`dish-details.md`、`meal-plan-*.md`、`user-profile.md` 的个人内容变更）。

---

## 2026-04-26

- 初始化 `meal-planner-skill`（显式点名调用、按月食谱归档、DATA_ROOT 规则）
- 新增/调整菜品库格式：菜名库（`dish-library.md`）与详情库（`dish-details.md`）拆分
- 增加同步脚本与仓库级 agent 规则，确保 skill 定义与个人副本一致
- `meal-plan` 模板支持“午晚相同 → 合并为正餐；不同时才拆分”

