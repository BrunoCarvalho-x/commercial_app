module.exports = {
  root: true,
  env: {
    browser: true,
    es2021: true,
    jquery: true,
  },
  extends: ['prettier'],
  plugins: ['prettier'],
  rules: {
    'prettier/prettier': 'error',
  },
};
