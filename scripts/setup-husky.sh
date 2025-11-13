#!/bin/bash

# Tapline - Husky Setup Script
# This script sets up Husky git hooks for the project

echo "🚀 Setting up Husky for Tapline..."

# Check if we're in the right directory
if [ ! -f "package.json" ]; then
  echo "❌ Error: package.json not found. Please run this script from the project root."
  exit 1
fi

# Check if Node.js is installed
if ! command -v node &> /dev/null; then
  echo "❌ Error: Node.js is not installed. Please install Node.js 20+ first."
  exit 1
fi

# Check if pnpm is installed
if ! command -v pnpm &> /dev/null; then
  echo "❌ Error: pnpm is not installed."
  echo "Install it with: npm install -g pnpm"
  exit 1
fi

echo "✓ Node.js and pnpm are installed"

# Install dependencies
echo "📦 Installing dependencies..."
pnpm install

if [ $? -ne 0 ]; then
  echo "❌ Error: Failed to install dependencies"
  exit 1
fi

echo "✓ Dependencies installed"

# Initialize Husky
echo "🎣 Initializing Husky..."
pnpm run prepare

if [ $? -ne 0 ]; then
  echo "❌ Error: Failed to initialize Husky"
  exit 1
fi

echo "✓ Husky initialized"

# Make hooks executable (Linux/Mac)
if [[ "$OSTYPE" != "msys" && "$OSTYPE" != "win32" ]]; then
  echo "🔧 Making hooks executable..."
  chmod +x .husky/commit-msg
  chmod +x .husky/pre-commit
  chmod +x .husky/_/husky.sh
  echo "✓ Hooks are now executable"
fi

# Test commit message validation
echo ""
echo "🧪 Testing Husky setup..."
echo ""

# Create a temporary file to test
echo "// Test file" > .husky-test.js
git add .husky-test.js

# Try a bad commit (should fail)
echo "Testing bad commit message..."
git commit -m "bad commit" --no-verify 2>/dev/null
if [ $? -eq 0 ]; then
  echo "⚠️  Warning: Commit validation might not be working correctly"
else
  echo "✓ Commit validation is working (bad commit rejected)"
fi

# Clean up test file
git reset HEAD .husky-test.js 2>/dev/null
rm -f .husky-test.js

echo ""
echo "✅ Husky setup complete!"
echo ""
echo "📝 Next steps:"
echo "  1. Review docs/HUSKY_SETUP.md for usage guide"
echo "  2. Try a valid commit: git commit -m \"feat(setup): complete husky configuration\""
echo "  3. Check .husky/ directory for hook files"
echo ""
echo "💡 Commit message format:"
echo "   <type>(<scope>): <subject>"
echo ""
echo "   Example: feat(mail): add email composition UI"
echo ""
