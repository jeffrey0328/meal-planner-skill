# 用户饮食档案

> 由 meal-planner-skill 在首次使用时根据用户回答自动填写。  
> 后续可被用户或 agent 增量更新。**修改后请同步更新底部"档案版本"日期。**

## 1. 基本信息

- 称呼：{{nickname}}
- 所在地区/时区：{{region_or_tz}}
- 单餐就餐人数：{{people_per_meal}}
- 一周自炊餐次：早 {{breakfast_count}} / 午 {{lunch_count}} / 晚 {{dinner_count}}
- 外食/外卖固定餐次：{{eat_out_slots}}（这些餐次不规划）

## 2. 饮食限制（硬约束，规划时绝不违反）

- 过敏：{{allergies}}
- 忌口/不吃：{{dislikes_hard}}
- 宗教或伦理限制：{{religion_ethics}}
- 慢性病/医嘱限制：{{medical}}

## 3. 健康目标

- 当前长期目标：{{long_term_goal}}（例：减脂 / 增肌 / 控糖 / 维持）
- 每日热量目标(kcal)：{{daily_kcal}}（可留空）
- 蛋白质目标(g/天)：{{protein_target}}（可留空）
- 其他偏好：{{health_notes}}

## 4. 早餐结构

- 组成类别：{{breakfast_categories}}（默认：肉类 + 蛋类 + 水果 + 主食）
- 每类份数：
  - 肉类：{{b_meat_qty}}
  - 蛋类：{{b_egg_qty}}
  - 水果：{{b_fruit_qty}}
  - 主食：{{b_staple_qty}}
  - 其他：{{b_other}}
- 烹饪时间预算：{{breakfast_time_budget}} 分钟以内
- 备注：{{breakfast_notes}}

## 5. 正餐结构

> 适用于午餐和晚餐。如果两餐结构不同，分别记录。

### 午餐

- 组成类别：{{lunch_categories}}（默认：肉菜 + 素菜）
- 每餐：肉菜 {{lunch_meat_count}} 道 / 素菜 {{lunch_veg_count}} 道
- 是否上主食：{{lunch_staple}}
- 是否上汤：{{lunch_soup}}
- 烹饪时间预算：{{lunch_time_budget}} 分钟以内

### 晚餐

- 组成类别：{{dinner_categories}}
- 每餐：肉菜 {{dinner_meat_count}} 道 / 素菜 {{dinner_veg_count}} 道
- 是否上主食：{{dinner_staple}}
- 是否上汤：{{dinner_soup}}
- 烹饪时间预算：{{dinner_time_budget}} 分钟以内

## 6. 偏好

- 喜欢的蛋白质：{{like_protein}}
- 喜欢的蔬菜：{{like_veg}}
- 喜欢的水果：{{like_fruit}}
- 喜欢的主食：{{like_staple}}
- 喜欢的菜系/口味：{{like_cuisine}}
- 不喜欢但非硬性禁止：{{dislikes_soft}}

## 7. 厨房工具

- 可用工具：{{kitchen_tools}}（炒锅 / 蒸锅 / 烤箱 / 空气炸锅 / 电饭煲 / 破壁机 / 其他）
- 不可行做法：{{infeasible_methods}}（例如"没有烤箱，所以不安排烤制类菜品"）

## 8. 规划默认值（可被单次请求覆盖）

- 同一道菜一周最多出现：{{max_repeat_per_week}} 次（默认 2）
- 默认重复度：{{default_variety}}（高/中/低）
- 默认存放路径：当前 skill 文件夹，文件名 `meal-plan-YYYY-Www.md`

---

档案版本：{{version_date}}（YYYY-MM-DD）
