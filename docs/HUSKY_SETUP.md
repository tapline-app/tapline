# Tapline - Complete Husky Setup Guide

## ✅ What's Configured

Your Husky setup includes:
1. **commit-msg hook** - Validates commit messages follow conventional commits
2. **pre-commit hook** - Runs linters and formatters before commit

## 📁 Directory Structure

```
.husky/
├── _/
│   └── husky.sh          # Husky core script (auto-generated)
├── commit-msg            # Validates commit message format
└── pre-commit            # Runs before git commit
```

## 🔧 Setup Instructions

### 1. Install Dependencies

```bash
# Make sure you're in the project root
cd D:\web-dev\tapline

# Install Node.js dependencies
pnpm install

# This will automatically run "prepare" script which installs Husky
```

### 2. Verify Husky Installation

```bash
# Check if Husky is installed
ls .husky

# You should see:
# - _/husky.sh
# - commit-msg
# - pre-commit
```

### 3. Make Hooks Executable (Linux/Mac only)

```bash
# On Windows with Git Bash:
chmod +x .husky/commit-msg
chmod +x .husky/pre-commit
chmod +x .husky/_/husky.sh

# On Windows with PowerShell (not needed usually):
# Git for Windows handles this automatically
```

## 🧪 Test Your Setup

### Test 1: Commit Message Validation

```bash
# Try a bad commit message (should FAIL)
git add .
git commit -m "bad commit message"

# Expected output:
# ❌ subject may not be empty [subject-empty]
# ❌ type may not be empty [type-empty]

# Try a good commit message (should PASS)
git commit -m "feat(setup): add husky configuration"

# Expected output:
# ✅ Commit message validated
```

### Test 2: Pre-commit Hook

```bash
# Make a change to a JS file
echo "const test = 'hello'" > test.js

# Stage and commit
git add test.js
git commit -m "test(setup): testing pre-commit hook"

# Expected output:
# ✅ Running lint-staged...
# ✅ Formatting with Prettier...
# ✅ Pre-commit checks passed!
```

## 📝 Commit Message Format

### Valid Format

```
<type>(<scope>): <subject>

<body> (optional)

<footer> (optional)
```

### Examples

#### ✅ GOOD Commits

```bash
# Feature
git commit -m "feat(mail): add email composition UI"

# Bug fix
git commit -m "fix(chat): resolve message duplication issue"

# Documentation
git commit -m "docs(readme): update installation instructions"

# Multi-line commit
git commit -m "feat(auth): implement JWT authentication

- Add JWT token generation
- Add token validation middleware
- Update user login endpoint

Closes #123"
```

#### ❌ BAD Commits

```bash
git commit -m "fixed bug"                    # Missing type, scope, proper format
git commit -m "WIP"                          # Not descriptive
git commit -m "updated files"                # Too vague
git commit -m "FEAT(MAIL): ADD EMAIL"        # Wrong case (should be lowercase)
```

### Commit Types

| Type | Description | Example |
|------|-------------|---------|
| `feat` | New feature | `feat(mail): add email templates` |
| `fix` | Bug fix | `fix(chat): message not sending` |
| `docs` | Documentation | `docs(api): update endpoint docs` |
| `style` | Code formatting | `style(mail): format with prettier` |
| `refactor` | Code refactoring | `refactor(chat): extract message logic` |
| `perf` | Performance | `perf(search): optimize query` |
| `test` | Adding tests | `test(mail): add email sender tests` |
| `build` | Build system | `build(docker): update node image` |
| `ci` | CI/CD | `ci(github): add deploy workflow` |
| `chore` | Maintenance | `chore(deps): update dependencies` |
| `revert` | Revert commit | `revert: revert "feat(mail): add spam"` |

### Scopes

| Scope | Description |
|-------|-------------|
| `gateway` | API Gateway |
| `mail` | Mail service |
| `chat` | Chat service |
| `meet` | Meet service |
| `calendar` | Calendar service |
| `ai` | AI service |
| `auth` | Authentication |
| `notification` | Notifications |
| `storage` | File storage |
| `frontend` | Web frontend |
| `shared` | Shared packages |
| `infra` | Infrastructure |
| `docs` | Documentation |
| `deps` | Dependencies |

## 🐛 Troubleshooting

### Issue 1: "husky.sh not found"

**Error:**
```
.husky/commit-msg: line 2: .husky/_/husky.sh: No such file or directory
```

**Solution:**
```bash
# Reinstall Husky
pnpm install
npx husky install

# Or manually run prepare script
pnpm run prepare
```

### Issue 2: "commitlint not found"

**Error:**
```
'commitlint' is not recognized as an internal or external command
```

**Solution:**
```bash
# Install commitlint
pnpm add -D @commitlint/cli @commitlint/config-conventional

# Verify installation
npx commitlint --version
```

### Issue 3: "lint-staged not found"

**Error:**
```
'lint-staged' is not recognized
```

**Solution:**
```bash
# Install lint-staged
pnpm add -D lint-staged

# Verify installation
npx lint-staged --version
```

### Issue 4: Python Black Check Fails

**Error:**
```
poetry: command not found
```

**Solution:**
```bash
# Install Poetry (Python package manager)
# On Windows PowerShell:
(Invoke-WebRequest -Uri https://install.python-poetry.org -UseBasicParsing).Content | py -

# Add Poetry to PATH
# Add to your PATH: %APPDATA%\Python\Scripts

# Verify installation
poetry --version

# Initialize Poetry in python directory
cd python
poetry init
poetry add --dev black flake8 mypy pytest
```

### Issue 5: Hooks Not Running

**Symptom:** Commits succeed without validation

**Solution:**
```bash
# Check if hooks are executable
ls -la .husky/

# Reinstall Husky
rm -rf .husky
pnpm run prepare

# Verify .git/hooks/
ls -la .git/hooks/
# Should see symlinks to .husky/ files
```

### Issue 6: "Permission Denied" on Windows

**Error:**
```
Permission denied: .husky/commit-msg
```

**Solution:**
```bash
# On Git Bash:
chmod +x .husky/commit-msg
chmod +x .husky/pre-commit

# Or use PowerShell:
git config core.fileMode false
```

## 🔄 Bypassing Hooks (Emergency Only)

### Skip All Hooks

```bash
git commit -m "emergency fix" --no-verify

# Or set environment variable
HUSKY=0 git commit -m "skip hooks"
```

### Skip Pre-commit Only

```bash
# Pre-commit will run, but commit-msg still validates
git commit -m "feat(chat): add feature" --no-verify
```

**⚠️ WARNING:** Only bypass hooks in emergencies. Always fix issues properly.

## 📊 What Each Hook Does

### commit-msg Hook

**Location:** `.husky/commit-msg`

**What it does:**
1. Reads your commit message
2. Validates format using commitlint
3. Checks type, scope, subject
4. Fails if format is wrong

**Example validation:**
```bash
# Input: "feat(mail): add email templates"
✅ Type: feat (valid)
✅ Scope: mail (valid)
✅ Subject: add email templates (valid)
✅ Max length: 100 characters (valid)
✅ Commit message passed!
```

### pre-commit Hook

**Location:** `.husky/pre-commit`

**What it does:**
1. Runs **lint-staged** on staged JavaScript/TypeScript files
   - Formats with Prettier
   - Runs ESLint (if configured)
2. Checks Python files with **Black formatter**
   - Only if `python/` directory exists and has files
3. Fails if any check fails

**Example flow:**
```bash
# You run: git commit -m "feat(mail): add feature"

1. Pre-commit hook runs:
   ✓ Formatting apps/mail-service/src/index.ts
   ✓ Formatting packages/shared-types/src/user.ts
   ✓ Checking Python files with Black
   ✓ All checks passed!

2. Commit-msg hook runs:
   ✓ Commit message validated!

3. Commit succeeds!
   [develop abc1234] feat(mail): add feature
   2 files changed, 20 insertions(+)
```

## 🎯 Best Practices

### 1. Commit Often

```bash
# Good: Small, focused commits
git commit -m "feat(mail): add email model"
git commit -m "feat(mail): add email controller"
git commit -m "test(mail): add email tests"

# Bad: One huge commit
git commit -m "feat(mail): implement entire email system"
```

### 2. Write Descriptive Messages

```bash
# Good: Clear what changed
git commit -m "fix(chat): resolve WebSocket disconnect on page refresh"

# Bad: Vague
git commit -m "fix(chat): fixed bug"
```

### 3. Use Body for Complex Changes

```bash
git commit -m "feat(auth): implement two-factor authentication

- Add TOTP generator using speakeasy library
- Create QR code generation endpoint
- Add verification endpoint
- Update user model with 2FA fields
- Add tests for all 2FA flows

Closes #456"
```

### 4. Reference Issues

```bash
# Link to issue
git commit -m "fix(mail): email not sending to external domains

Root cause: SMTP configuration was using wrong port.
Changed from port 25 to 587 (TLS).

Fixes #789"
```

## 📦 Full Package.json Scripts

```json
{
  "scripts": {
    "prepare": "husky install",
    "lint": "pnpm run --recursive lint",
    "format": "prettier --write \"**/*.{js,ts,tsx,json,md}\"",
    "format:check": "prettier --check \"**/*.{js,ts,tsx,json,md}\"",
    "commit": "git-cz"  // Optional: Use commitizen for guided commits
  }
}
```

## 🚀 Optional: Commitizen (Guided Commits)

For easier commit message formatting:

```bash
# Install commitizen
pnpm add -D commitizen cz-conventional-changelog

# Configure in package.json
"config": {
  "commitizen": {
    "path": "cz-conventional-changelog"
  }
}

# Use it
pnpm commit
# or
npx cz

# Interactive prompts:
? Select the type of change: (Use arrow keys)
❯ feat:     A new feature
  fix:      A bug fix
  docs:     Documentation only changes
  style:    Formatting changes
  refactor: A code change that neither fixes a bug nor adds a feature
  ...
```

## ✅ Verification Checklist

After setup, verify:

- [ ] `.husky/_/husky.sh` exists
- [ ] `.husky/commit-msg` exists and is executable
- [ ] `.husky/pre-commit` exists and is executable
- [ ] `pnpm install` runs without errors
- [ ] Bad commit message is rejected
- [ ] Good commit message is accepted
- [ ] Prettier formats files before commit
- [ ] Python Black check runs (if python/ has files)

## 📞 Need Help?

If you encounter issues:

1. Check the troubleshooting section above
2. Run `pnpm install` to ensure all dependencies are installed
3. Delete `.husky` and run `pnpm run prepare` to reinstall
4. Check Git version: `git --version` (should be 2.9.0+)
5. Check Node version: `node --version` (should be 20.0.0+)

---

## 🎓 Additional Resources

- [Husky Documentation](https://typicode.github.io/husky/)
- [Commitlint Documentation](https://commitlint.js.org/)
- [Conventional Commits](https://www.conventionalcommits.org/)
- [Lint-staged Documentation](https://github.com/okonet/lint-staged)
- [Prettier Documentation](https://prettier.io/docs/en/)
