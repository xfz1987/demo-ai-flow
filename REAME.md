## AI Flow

### 整体流程

          ┌───────────────┐
          │   Gemini CTO   │
          │  Review / 决策 │
          │  ❌ 不写代码   │
          └───────▲───────┘
                  │
      架构 / 方案 / 评审结论
                  │

┌─────────────────┴─────────────────┐
│ │
│ Claude (Plan Model) 远程 │
│ 主工程师 / 架构实现 │
│ │
│ Codex (Plan Model) 远程 │
│ 执行工程师 / 自动化 │
│ │
└───────────────┬───────────────────┘
│
远程主机 / Repo / CI

- Codex（执行工程师）：在 GitHub Actions 里实现任务 + 推分支 + 开 PR（Codex GitHub Action 就是干这个的）
  OpenAI 开发者
- Claude（主工程师）：Review PR（通过 GitHub MCP/Actions 监听 PR，或 @claude 触发）
- Gemini（CTO）：只做决策/放行（写 ADR/Decision），不提交 PR、不改代码、不直接执行（控制面）

### 项目结构

demo-ai-flow/
├─ README.md

├─ planlist（唯一执行入口（触发 Codex））
│ ├─ plan1.md
│ └─ plan2.md
│
├─ ai/
│ ├─ decision.md # Gemini CTO（只决策）
│ ├─ plan.md # Claude 主工程师（执行计划）
│ └─ execution.log # Codex（Actions 产物）
│
├─ src/
│ └─ app.js # 一个极简 JS 文件（被反复修改）
│
├─ .github/
│ └─ workflows/
│ ├─ codex_from_task.yml # task.md → Codex → PR
│ └─ claude_review.yml # PR → Claude Review
│
└─ .claude/
└─ settings.json #（可选）约束 Claude 不越权
