#pragma once
#include <cassert>
#include <cmath>
#include <vector>
using namespace std;
template<typename T> class fenwick {
  vector<T> node;

public:
  fenwick(int size): node(size + 1) {}
  auto size() -> int { return node.size() - 1; }
  auto operate(int i, T x) -> void {
    assert(0 <= i);
    for (i++; i <= size(); i += i & -i) node[i] += x;
  }
  auto get(int i) -> T {
    T v = 0;
    for (; i > 0; i -= i & -i) v += node[i];
    return v;
  }
  template<typename F> auto max_right(F f) -> int {
    int n = size();
    int d = 1 << ((int)log2(n + 1) + 1);
    T v = 0;
    int i = 0;
    while (true) {
      d >>= 1;
      if (!d)
        return i;
      if (i + d > n)
        continue;
      auto nv = v + node[i + d];
      if (f(nv)) {
        i += d;
        v = nv;
      }
    }
  }
};
