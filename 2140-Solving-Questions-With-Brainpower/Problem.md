# 2140. Solving Questions With Brainpower

## Description

You are given a **0-indexed** 2D integer array `questions` where `questions[i] = [pointsi, brainpoweri]`.

The array describes the questions of an exam, where you have to process the questions **in order** (i.e., starting from question `0`) and make a decision whether to **solve** or **skip** each question. Solving question `i` will **earn** you `pointsi` points but you will be **unable** to solve each of the next `brainpoweri` questions. If you skip question `i`, you get to make the decision on the next question.

- For example, given q`uestions = [[3, 2], [4, 3], [4, 4], [2, 5]]`:
    - If question `0` is solved, you will earn `3` points but you will be unable to solve questions `1` and `2`.
    - If instead, question `0` is skipped and question `1` is solved, you will earn `4` points but you will be unable to solve questions `2` and `3`.
Return the maximum points you can earn for the exam.

## Example

**Input:**  
questions = [[3,2],[4,3],[4,4],[2,5]]
<br>
**Output:**
<br>
5
<br>
**Explanation:**
<br>
The maximum points can be earned by solving questions 0 and 3.
<br>
- Solve question 0: Earn 3 points, will be unable to solve the next 2 questions
- Unable to solve questions 1 and 2
- Solve question 3: Earn 2 points
Total points earned: 3 + 2 = 5. There is no other way to earn 5 or more points.

## Constraints

- `1 <= questions.length <= 10^5`
- `questions[i].length == 2`
- `1 <= pointsi, brainpoweri <= 10^5`
