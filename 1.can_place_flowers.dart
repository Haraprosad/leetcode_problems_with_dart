/// Problem: Can Place Flowers (LeetCode 605)
///
/// You have a long flowerbed in which some plots are planted (1) and some are empty (0).
/// No two flowers can be planted in adjacent plots.
/// This program determines if n new flowers can be planted without violating this rule.

void main() {
  /// Determines if n new flowers can be planted in the flowerbed without violating
  /// the no-adjacent-flowers rule.
  ///
  /// Parameters:
  /// - [flowerbed]: An integer array where 0 represents empty plot and 1 represents
  ///   a plot with flower.
  /// - [n]: Number of new flowers to be planted.
  ///
  /// Returns:
  /// - [bool]: true if n flowers can be planted following the rules, false otherwise.
  bool canPlaceFlowers(List<int> flowerbed, int n) {
    // Iterate through each plot in the flowerbed
    for (int i = 0; i < flowerbed.length; i++) {
      if (flowerbed[i] == 0) {
        // Check if left and right adjacent plots are empty
        // For first plot, consider left as empty
        // For last plot, consider right as empty
        bool isLeftPlotEmpty = (i == 0 || flowerbed[i - 1] == 0);
        bool isRightPlotEmpty =
            (i == flowerbed.length - 1 || flowerbed[i + 1] == 0);

        // If both adjacent plots are empty, we can plant a flower
        if (isLeftPlotEmpty && isRightPlotEmpty) {
          n--; // Plant a flower by decreasing n
          if (n == 0) {
            return true; // All flowers are planted successfully
          }
        }
      }
    }

    return false; // Could not plant all n flowers
  }

  // Test cases to verify the solution
  print("1st test case - Output should true : ${canPlaceFlowers([1, 0, 0, 0, 1], 1)}");
  print("2nd test case - Output should false : ${canPlaceFlowers([1, 0, 0, 0, 1], 2)}");

  /// Time Complexity: O(n) where n is the length of the flowerbed.
  /// Space Complexity: O(1) as we only use constant extra space.
}
