# 食谱 — {{year}} 年 {{month}} 月

> 由 meal-planner-skill 维护。**按月份分文件**，文件名 `meal-plan-YYYY-MM.md`，与 `dish-library.md` 位于同一 **`DATA_ROOT`**（见 `user-profile` 第 0 节；若同 skill 同目录，二者并列即可）。  
> 每周以独立小节追加在下方。**跨月的一周以"该周周一所在月份"为准**：周一在本月就归本月，周日在不在本月不影响归属。  
> 所有菜品均引用自 **`DATA_ROOT/dish-library.md`**；来源行须写**可定位路径**。  
> **不要**在 `DATA_ROOT` 中创建除本文件与菜品库外的其它内容。

## 月份信息

- 用户：{{user_nickname}}
- 月份：{{year}}-{{month}}
- 文件首次创建：{{file_created_at}}
- 最近更新：{{file_updated_at}}

---

<!--
  以下"## 周食谱 …"小节按时间顺序追加。每新规划一周就在最后一个周小节之后再追加一节。
  标题日期格式严格使用：## 周食谱 YYYY-MM-DD ~ YYYY-MM-DD
  起始日期 = 该周周一；结束日期 = 该周周日。
-->

## 周食谱 {{start_date}} ~ {{end_date}}

### 本周概览

- 周一日期（归属判断依据）：{{monday_date}}
- 用户本周饮食期望（原话）：
  > {{raw_user_request}}
- 解析后的约束：
  - 健康目标：{{goal_constraint}}
  - 食材频率要求：{{ingredient_freq_constraint}}
  - 烹饪时间约束：{{time_constraint}}
  - 重复度约束：{{variety_constraint}}
  - 其他：{{other_constraint}}
- 不规划餐次（外食/外卖）：{{skipped_slots}}
- 生成时间：{{generated_at}}

### 周食谱表

<!--
  默认模式：午餐 = 晚餐（正餐不区分午/晚），用下面的 3 列表格。
  若用户档案明确写了“午餐和晚餐不一致”，才使用下方的「午晚拆分」备用表格。
-->

#### 默认：正餐不拆分（推荐）

| 日期 / 周几 | 早餐 | 正餐 |
|------------|------|------|
| {{date_mon}} 周一 | {{mon_breakfast}} | {{mon_main_meal}} |
| {{date_tue}} 周二 | {{tue_breakfast}} | {{tue_main_meal}} |
| {{date_wed}} 周三 | {{wed_breakfast}} | {{wed_main_meal}} |
| {{date_thu}} 周四 | {{thu_breakfast}} | {{thu_main_meal}} |
| {{date_fri}} 周五 | {{fri_breakfast}} | {{fri_main_meal}} |
| {{date_sat}} 周六 | {{sat_breakfast}} | {{sat_main_meal}} |
| {{date_sun}} 周日 | {{sun_breakfast}} | {{sun_main_meal}} |

<details>
<summary>备用：午/晚拆分（仅当午餐和晚餐不一样时用）</summary>

| 日期 / 周几 | 早餐 | 午餐 | 晚餐 |
|------------|------|------|------|
| {{date_mon}} 周一 | {{mon_breakfast}} | {{mon_lunch}} | {{mon_dinner}} |
| {{date_tue}} 周二 | {{tue_breakfast}} | {{tue_lunch}} | {{tue_dinner}} |
| {{date_wed}} 周三 | {{wed_breakfast}} | {{wed_lunch}} | {{wed_dinner}} |
| {{date_thu}} 周四 | {{thu_breakfast}} | {{thu_lunch}} | {{thu_dinner}} |
| {{date_fri}} 周五 | {{fri_breakfast}} | {{fri_lunch}} | {{fri_dinner}} |
| {{date_sat}} 周六 | {{sat_breakfast}} | {{sat_lunch}} | {{sat_dinner}} |
| {{date_sun}} 周日 | {{sun_breakfast}} | {{sun_lunch}} | {{sun_dinner}} |

</details>

> 单元格写法：`【分类】菜名` 多个用 `、` 分隔。例如：`【肉】煎鸡胸、【蛋】水煮蛋、【果】蓝莓、【主】燕麦粥`。  
> 跨月行用 `*` 标注：例如 `{{date_sun}} 周日 *(下月)`，方便一眼看出。

### 每日详情（含菜品库引用）

#### {{date_mon}} 周一

- 早餐
  - 肉类：{{mon_b_meat}} `[来源: dish-library.md#{{mon_b_meat_anchor}}]`
  - 蛋类：{{mon_b_egg}} `[来源: dish-library.md#{{mon_b_egg_anchor}}]`
  - 水果：{{mon_b_fruit}} `[来源: dish-library.md#{{mon_b_fruit_anchor}}]`
  - 主食：{{mon_b_staple}} `[来源: dish-library.md#{{mon_b_staple_anchor}}]`

<!-- 默认模式：午晚相同 → 只写一份「正餐」 -->
- 正餐
  - 肉菜：{{mon_m_meat}} `[来源: ...]`
  - 素菜：{{mon_m_veg}} `[来源: ...]`

<details>
<summary>备用：午/晚拆分（仅当午餐和晚餐不一样时用）</summary>

- 午餐
  - 肉菜：{{mon_l_meat}} `[来源: ...]`
  - 素菜：{{mon_l_veg}} `[来源: ...]`
- 晚餐
  - 肉菜：{{mon_d_meat}} `[来源: ...]`
  - 素菜：{{mon_d_veg}} `[来源: ...]`

</details>

> 其他天按相同结构追加。如某餐次为外食/外卖，写 `外食 — 不规划`。

### 营养小结（粗估）

| 指标 | 周均/天 | 目标 | 备注 |
|------|--------|------|------|
| 热量 | {{avg_kcal}} | {{target_kcal}} | |
| 蛋白质 | {{avg_protein}}g | {{target_protein}}g | |
| 蔬菜份数 | {{avg_veg}} | ≥ 5 | |
| 水果份数 | {{avg_fruit}} | 1-2 | |

> 数值来自菜品库的 `估算热量(kcal/份)`，仅作粗略参考。

### 本周采购清单

> 按用餐人数与天数已合并，可直接照单买菜。

#### 蛋白质
- {{ingredient}} —— {{quantity}}

#### 蔬菜
- {{ingredient}} —— {{quantity}}

#### 水果
- {{ingredient}} —— {{quantity}}

#### 主食/谷物
- {{ingredient}} —— {{quantity}}

#### 调味/其他
- {{ingredient}} —— {{quantity}}

### 本周反馈记录

- 引用菜品库版本：{{dish_library_version}}
- 引用用户档案版本：{{user_profile_version}}
- 反馈：
  - [ ] {{date}}：{{feedback_text}}

---

<!-- 下一周的小节从这里继续追加，标题仍为 "## 周食谱 YYYY-MM-DD ~ YYYY-MM-DD" -->

## 本月周索引

> 每追加一个新的周小节，就在这里追加一行（按时间顺序）。点击锚点可跳转。

- [{{start_date}} ~ {{end_date}}](#周食谱-{{start_date}}--{{end_date}})
