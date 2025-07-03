class Solution {
    func kthCharacter(_ k: Int) -> Character {
        // Calculate how many times the character at position k was transformed
        // this is equal to the number of 1s in the binary representation of (k - 1)
        let shift = (k - 1).nonzeroBitCount

        // 'a' has ASCII 97, so add the shift to get the resulting character
        // If shift goes beyond 'z', it wraps around automatically (if needed)
        let asciiValue = Int(Character("a").asciiValue!) + shift

        // Convert the ASCII value to UnicodeScalar and then to Character
        return Character(UnicodeScalar(asciiValue)!)
    }
}
