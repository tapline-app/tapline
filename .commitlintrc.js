module.exports = {
  extends: ['@commitlint/config-conventional'],
  rules: {
    'type-enum': [
      2,
      'always',
      [
        'feat',     // New feature
        'fix',      // Bug fix
        'docs',     // Documentation
        'style',    // Formatting
        'refactor', // Code refactoring
        'perf',     // Performance
        'test',     // Tests
        'build',    // Build system
        'ci',       // CI/CD
        'chore',    // Maintenance
        'revert'    // Revert commit
      ]
    ],
    'scope-enum': [
      2,
      'always',
      [
        'gateway',      // API Gateway
        'mail',         // Mail service
        'chat',         // Chat service
        'meet',         // Meet service
        'calendar',     // Calendar service
        'ai',           // AI service
        'auth',         // Auth service
        'notification', // Notification service
        'storage',      // File storage
        'frontend',     // Web frontend
        'shared',       // Shared packages
        'infra',        // Infrastructure
        'docs',         // Documentation
        'deps'          // Dependencies
      ]
    ],
    'subject-case': [0],
    'header-max-length': [2, 'always', 100]
  }
};
