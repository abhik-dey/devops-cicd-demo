// src/math.test.js
const { add, subtract, multiply } = require('./math');

describe('Math functions', () => {
  test('add: 2 + 3 should equal 5', () => {
    expect(add(2, 3)).toBe(5);
  });

  test('subtract: 10 - 4 should equal 6', () => {
    expect(subtract(10, 4)).toBe(6);
  });

  test('multiply: 3 × 3 should equal 9', () => {
    expect(multiply(3, 3)).toBe(9);
  });

  test('add: handles negative numbers', () => {
    expect(add(-1, -2)).toBe(-3);
  });
});