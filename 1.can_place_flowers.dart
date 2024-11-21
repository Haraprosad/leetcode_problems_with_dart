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
  /// - [bool]:[1,0,0,0,0,1]ers can be planted following the rules, false otherwise.
bool canPlaceFlowers(List<int> flowerbed, int n) {
    // Track the number of flowers we can plant
    int count = 0;
    
    // Traverse through each plot in the flowerbed
    for(int i = 0; i < flowerbed.length; i++) {
        // Check three conditions:
        // 1. Current plot is empty (0)
        // 2. Either it's the first plot OR left plot is empty
        // 3. Either it's the last plot OR right plot is empty
        if(flowerbed[i] == 0 && 
           (i == 0 || flowerbed[i-1] == 0) && 
           (i == flowerbed.length-1 || flowerbed[i+1] == 0)) {
            
            count++;            // Increment possible flower placement count
            flowerbed[i] = 1;   // Mark current plot as planted
            i++;                // Skip next plot (since we can't plant adjacent)
            
            // If we've found enough spots to plant all flowers
            if(count == n) {
                return true;
            }
        }
    }

    // Return true if we found enough or more spots than needed
    return (count >= n);
  }

  // Test cases to verify the solution
  print("1st test case - Output should true : ${canPlaceFlowers([1, 0, 0, 0, 1], 1)}");
  print("2nd test case - Output should false : ${canPlaceFlowers([1, 0, 0, 0, 1], 2)}");

  /// Time Complexity: O(n) where n is the length of the flowerbed.
  /// Space Complexity: O(1) as we only use constant extra space.
  /// Runtime: <1ms
}
