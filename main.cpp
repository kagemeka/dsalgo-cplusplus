// #include "dsalgo/dsalgo.hpp"

#include <bits/stdc++.h>
#include <iostream>
#include <vector>
class UF {
public:
  virtual auto root(int u) -> int;
  virtual auto size() -> int;
};

// template<typename T>
// concept UnionFind = require(T uf)
// {};
template<typename T>
concept Hashable = requires(T a) {
  { std::hash<T>{}(a) } -> std::convertible_to<std::size_t>;
};

using namespace std;
template<class T> auto labels(UF uf) -> vector<int> {
  vector<int> labels;
  return labels;
}
auto main() -> int {}
