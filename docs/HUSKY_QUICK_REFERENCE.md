# 📋 Husky Quick Reference Card

## 🚀 Quick Start

```bash
# 1. Install dependencies
pnpm install

# 2. Setup is automatic! (runs "prepare" script)
# No additional steps needed

# 3. Test with a commit
git add .
git commit -m "feat(setup): test husky"
```

---

## ✅ Valid Commit Examples

```bash
# Feature
git commit -m "feat(mail): add email composition UI"

# Bug fix
git commit -m "fix(chat): resolve message duplication"

# Documentation
git commit -m "docs(readme): update setup instructions"

# Style/formatting
git commit -m "style(mail): format code with prettier"

# Refactoring
git commit -m "refactor(chat): extract message validation"

# Performance
git commit -m "perf(search): optimize query performance"

# Tests
git commit -m "test(mail): add email sender tests"

# Build/dependencies
git commit -m "build(docker): update node image to v20"
git commit -m "chore(deps): update dependencies"

# CI/CD
git commit -m "ci(github): add staging deployment workflow"

# Multi-line with body
git commit -m "feat(auth): implement JWT authentication

- Add JWT token generation
- Add token validation middleware
- Update user login endpoint

Closes #123"
```

---

## ❌ Invalid Commits (Will be Rejected)

```bash
git commit -m "fixed bug"                    # ❌ Missing type/scope
git commit -m "WIP"                          # ❌ Not descriptive
git commit -m "updated files"                # ❌ Too vague
git commit -m "FEAT(MAIL): ADD EMAIL"        # ❌ Wrong case
git commit -m "feat: add feature"            # ❌ Missing scope
git commit -m "feat(invalid): add feature"   # ❌ Invalid scope
```

---

## 🎯 Commit Format

```
<type>(<scope>): <subject>
│      │         │
│      │         └─> Summary (present tense, lowercase)
│      │
│      └─> Module: gateway|mail|chat|meet|calendar|ai|auth|frontend|shared|infra
│
└─> Type: feat|fix|docs|style|refactor|perf|test|build|ci|chore
```

---

## 📊 Types

| Type | When to Use | Example |
|------|-------------|---------|
| `feat` | New feature | `feat(mail): add templates` |
| `fix` | Bug fix | `fix(chat): message not sending` |
| `docs` | Documentation | `docs(api): update endpoints` |
| `style` | Formatting | `style: format with prettier` |
| `refactor` | Refactoring | `refactor(chat): extract logic` |
| `perf` | Performance | `perf(search): optimize query` |
| `test` | Tests | `test(mail): add unit tests` |
| `build` | Build system | `build: update webpack config` |
| `ci` | CI/CD | `ci: add deploy workflow` |
| `chore` | Maintenance | `chore: update dependencies` |

---

## 🏷️ Scopes

| Scope | Description |
|-------|-------------|
| `gateway` | API Gateway service |
| `mail` | Mail service |
| `chat` | Chat service |
| `meet` | Video meeting service |
| `calendar` | Calendar service |
| `ai` | AI service |
| `auth` | Authentication service |
| `notification` | Notification service |
| `storage` | File storage service |
| `frontend` | Web frontend |
| `shared` | Shared packages |
| `infra` | Infrastructure |
| `docs` | Documentation |
| `deps` | Dependencies |

---

## 🔧 Hooks

### pre-commit
**Runs:** Before `git commit`
**Does:**
- ✓ Formats JS/TS files with Prettier
- ✓ Checks Python files with Black
- ✓ Runs linters (if configured)

### commit-msg
**Runs:** After commit message entered
**Does:**
- ✓ Validates commit message format
- ✓ Checks type, scope, subject
- ✓ Enforces max length (100 chars)

---

## 🆘 Bypass Hooks (Emergency Only!)

```bash
# Skip ALL hooks
git commit -m "emergency fix" --no-verify

# Or use environment variable
HUSKY=0 git commit -m "skip hooks"
```

⚠️ **Only use in emergencies!** Always fix issues properly.

---

## 🐛 Troubleshooting

### Hook not running?
```bash
# Reinstall Husky
pnpm run prepare

# Check hooks exist
ls .husky/
```

### "husky.sh not found"?
```bash
# Reinstall dependencies
pnpm install
pnpm run prepare
```

### "commitlint not found"?
```bash
# Install commitlint
pnpm add -D @commitlint/cli @commitlint/config-conventional
```

### Python check fails?
```bash
# Install Poetry
# Windows: (Invoke-WebRequest -Uri https://install.python-poetry.org -UseBasicParsing).Content | py -

# Setup Python project
cd python
poetry install
poetry add --dev black
```

---

## 📚 Full Documentation

Read `docs/HUSKY_SETUP.md` for complete guide including:
- Detailed setup instructions
- Configuration options
- Advanced usage
- Troubleshooting guide

---

## 💡 Tips

1. **Commit often** - Small, focused commits are easier to review
2. **Be descriptive** - Future you will thank you
3. **Use body for complex changes** - Explain why, not just what
4. **Reference issues** - Use "Fixes #123" or "Closes #456"
5. **Keep it under 100 chars** - Subject line should be concise

---

## ✅ Checklist

After setup, verify:

- [ ] `pnpm install` completed
- [ ] `.husky/_/husky.sh` exists
- [ ] `.husky/commit-msg` exists
- [ ] `.husky/pre-commit` exists
- [ ] Bad commit is rejected
- [ ] Good commit is accepted
- [ ] Files are formatted before commit

---

**Keep this card handy!** 📌

Save it as a desktop shortcut or bookmark in your browser.
