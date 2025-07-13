//
// 2410. Maximum Matching of Players With Trainers
// SwiftLeetCode
//

class Solution {
    func matchPlayersAndTrainers(_ players: [Int], _ trainers: [Int]) -> Int {
        // Sort both arrays to use the two-pointer technique
        let sortedPlayers = players.sorted()
        let sortedTrainers = trainers.sorted()

        var playerIndex = 0   // pointer for players
        var trainerIndex = 0  // pointer for trainers
        var matches = 0

        // We'll iterate through both arrays sumultaneously
        while playerIndex < sortedPlayers.count && trainerIndex < sortedTrainers.count {
            // If current player can be trained by current trainer
            if sortedPlayers[playerIndex] <= sortedTrainers[trainerIndex] {
                matches += 1       // we found a match
                playerIndex += 1   // move to next player
                trainerIndex += 1  // move to next trainer
            } else {
                // Current trainer can't train this player, try next trainer
                trainerIndex += 1
            }
        }

        return matches
    }
}

/*
Explanation:
1. Sorting the Arrays:
    - First, we sort both the players and trainers arrays. This allows us to use an efficient two-pointer technique.
    - Sorting helps us consider the smallest available players and trainers first, maximizing potential matches.
2. Two Pointers Technique:
    - We initialize two pointers (playerIndex and trainerIndex) at the start of each sorted array.
    - We also initialize a matches counter to keep track of successful pairings.
3. Matching Process:
    - We compare the current player's ability with the current trainer's capacity.
    - If the player's ability is ≤ the trainer's capacity, it's a valid match:
        - Increment the matches counter
        - Move both pointers forward (this player and trainer are now matched)
- If not valid, just move the trainer pointer forward (try next trainer for current player)

4. Termination:
    - The loop continues until we've processed all players or all trainers.
    - The final matches count represents the maximum possible pairings.
*/
