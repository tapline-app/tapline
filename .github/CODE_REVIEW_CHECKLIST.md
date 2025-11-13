# Code Review Checklist

## ✅ Quick Review Checklist

### Functionality
- [ ] Code does what it's supposed to do
- [ ] Edge cases are handled
- [ ] Error handling is present

### Code Quality
- [ ] Code is readable and clear
- [ ] No code duplication
- [ ] Functions are small and focused
- [ ] Good variable/function names

### Testing
- [ ] Tests are included
- [ ] Tests cover main scenarios
- [ ] All tests pass

### Security
- [ ] No hardcoded secrets or passwords
- [ ] User input is validated
- [ ] SQL injection prevention
- [ ] XSS prevention

### Documentation
- [ ] Complex code has comments
- [ ] README updated if needed
- [ ] API changes documented

### Performance
- [ ] No obvious performance issues
- [ ] Database queries are efficient
- [ ] No N+1 query problems

---

## 💬 How to Give Good Review Comments

### ✅ Good Examples:
- "Consider extracting this logic into a separate function for reusability"
- "This might cause an N+1 problem. Consider using populate/JOIN"
- "Great work! One suggestion: add error logging here for debugging"

### ❌ Avoid:
- "This is wrong" (without explanation)
- "Rewrite this" (without specific guidance)
- "I don't like this" (be constructive)
