#include "iteration_macro.hpp"
#include <array>
#include <cassert>
#include <iostream>
using namespace std;
template<typename T, int n> struct matrix {
  using Self = matrix;
  array<array<T, n>, n> data;
  matrix() { rep(i, n) data[i].fill(0); }
  matrix(int x): matrix() {
    assert(x == 0 || x == 1);
    if (x) {
      rep(i, n) data[i][i] = 1;
    }
  }
  auto operator[](int i) -> array<T, n> & { return data[i]; }
  auto operator*(Self &rhs) -> Self {
    Self a;
    rep(i, n) rep(k, n) rep(j, n) a[i][j] += data[i][k] * rhs[k][j];
    return a;
  }
  auto operator*=(Self &rhs) { *this = *this * rhs; }
  auto operator+(Self &rhs) -> Self {
    Self a(*this);
    rep(i, n) rep(j, n) a[i][j] += rhs[i][j];
    return a;
  }
  auto operator+=(Self &rhs) { *this = *this + rhs; }
  auto debug() { rep(i, n) rep(j, n) cout << data[i][j] << " \n"[j == n - 1]; }
};
// bitwise xor and example
uint const one = (1l << 32) - 1;
struct R {
  uint v;
  R() = default;
  static auto init(uint x) -> R {
    R v;
    v.v = x;
    return v;
  }
  R(int x) {
    assert(x == 0 || x == 1);
    v = one * x;
  }
  auto operator*(R rhs) -> R { return R::init(v & rhs.v); }
  auto operator+(R rhs) -> R { return R::init(v ^ rhs.v); }
  auto operator+=(R rhs) { *this = *this + rhs; }
};
