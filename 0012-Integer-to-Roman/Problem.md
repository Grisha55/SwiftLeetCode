# 0012. Integer to Roman

## Description

Roman numerals are formed by appending the conversions of decimal place values from highest to lowest. Converting a decimal place value into a Roman numeral has the following rules:

- If the value does not start with 4 or 9, select the symbol of the maximal value that can be subtracted from the input, append that symbol to the result, subtract its value, and convert the remainder to a Roman numeral.
- If the value starts with 4 or 9 use the subtractive form representing one symbol subtracted from the following symbol, for example, 4 is 1 (`I`) less than 5 (`V`): `IV` and 9 is 1 (`I`) less than 10 (`X`): `IX`. Only the following subtractive forms are used: 4 (`IV`), 9 (`IX`), 40 (`XL`), 90 (`XC`), 400 (`CD`) and 900 (`CM`).
- Only powers of 10 (`I`, `X`, `C`, `M`) can be appended consecutively at most 3 times to represent multiples of 10. You cannot append 5 (`V`), 50 (`L`), or 500 (`D`) multiple times. If you need to append a symbol 4 times use the **subtractive form**.
Given an integer, convert it to a Roman numeral.

## Example

**Input:**  
3749
<br>
**Output:**
<br>
"MMMDCCXLIX"
<br>
**Explanation:**
<br>
3000 = MMM as 1000 (M) + 1000 (M) + 1000 (M)  
 700 = DCC as 500 (D) + 100 (C) + 100 (C)  
  40 = XL as 10 (X) less of 50 (L)  
   9 = IX as 1 (I) less of 10 (X)  
Note: 49 is not 1 (I) less of 50 (L) because the conversion is based on decimal places

## Constraints

- `1 <= num <= 3999` 
