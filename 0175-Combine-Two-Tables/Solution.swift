//
// 0175. Combine Two Tables
// Problem: https://leetcode.com/problems/combine-two-tables/
// SwiftLeetCode
//

import Foundation

# Write your MySQL query statement below

SELECT
    p.FirstName,
    p.LastName,
    a.City,
    a.State
FROM Person p
LEFT JOIN Address a
ON p.PersonId = a.PersonId;

/*
    1. We say to the database: “Give us back the first name, last name, city and state.”
    2. We start with the Person table. We give it an alias p to make it easier to refer to it.
    3. We are doing a LEFT JOIN - meaning:
        - Take ALL records from the Person table
        - And from the Address table, take only those records that have PersonId that matches PersonId from Person.
*/ 
