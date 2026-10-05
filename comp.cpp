#include <cmath>
#include <format>
#include <iostream>
#include <stdio.h>
#include <vector>
using namespace std;

bool isPrime(int n) {
  if (n % 2 == 0) {
    return false;
  }
  double roof = sqrt(n);

  for (int j = 3; j < ceil(roof); ++j) {
    if ((n % j) == 0) {
      return false;
    }
  }
  return true;
}

int main() {
  int n = 1000;
  vector<int> v = {};
  int maxStreak = 0;
  int streak = 0;
  for (int i = 1; i < n; ++i) {
    if (!isPrime(i)) {
      ++streak;
      v.push_back(i);
      if (streak > maxStreak) {
        maxStreak = streak;
      }
    } else {
      v.clear();
      streak = 0;
    }
  }

  printf("Max Streak %d \n", maxStreak);
}
