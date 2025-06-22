//
// 3362. Zero Array Transformation III
// Problem: https://leetcode.com/problems/zero-array-transformation-iii/description/
// SwiftLeetCode
// Can't make this with Swift, made it with C++
//

class Solution {
public:
    int maxRemoval(vector<int>& nums, vector<vector<int>>& queries) {
        // Sort queries by index (the first element of each query) in ascending order. This ensures we process queries in the correct order.
        sort(queries.begin(), queries.end(),
             [](const vector<int>& a, const vector<int>& b) {
                 return a[0] < b[0];
             });

        // Use a max-heap (priority queue) to store query values. The largest values will be processed first.
        priority_queue<int> heap;
        // Delta array to track adjustments to the 'operations' count. It's used to efficiently update the operations count without repeatedly recalculating sums.
        vector<int> deltaArray(nums.size() + 1, 0);
        // Represents the total number of operations performed so far.
        int operations = 0;

        // Iterate through each element of the nums array.
        for (int i = 0, j = 0; i < nums.size(); ++i) {
            // Add the delta for the current index to the total operations.
            operations += deltaArray[i];
            // Process all queries that affect the current element (nums[i]).
            while (j < queries.size() && queries[j][0] == i) {
                // Add the query value to the heap.
                heap.push(queries[j][1]);
                // Move to the next query.
                ++j;
            }
            // Process queries from the heap while we have enough operations and the largest query value (heap.top()) is greater than or equal to the current index.
            while (operations < nums[i] && !heap.empty() && heap.top() >= i) {
                // Increment the operation count.
                operations += 1;
                // Decrement the delta array for the next index affected by this query, this will adjust the operation count for subsequent iterations.
                deltaArray[heap.top() + 1] -= 1;
                // Remove the largest query from the heap.
                heap.pop();
            }
            // Check for underflow. If the total operations are less than the current element's value, it means we've gone below zero.
            if (operations < nums[i]) {
                // Return -1 to indicate an underflow.
                return -1;
            }
        }
        // If no underflow occurred, the size of the heap represents the maximum number of queries successfully processed.
        return heap.size();
    }
};

/*
In Simple Terms:

The algorithm sorts queries by the index they affect. Then, it iterates through the `nums` array. For each element, it processes queries affecting that element, prioritizing larger reductions using the max-heap. The delta array efficiently updates the operation count. If at any point the operations become less than the element's value (underflow), it returns -1; otherwise, it returns the number of successfully processed queries. The efficiency stems from the use of the priority queue and delta array to avoid redundant calculations.
*/




