
"""
Given a 2-D String array of student-marks find the student with the highest average. 
If the average is in decimals, floor it down to the nearest integer.
Input: 
[["Bob", "87.5"],["Mike", "35"],["Bob","52"],["Jason","35"],["Mike", "55"],["Jessica", "99"]]
 Output: "Jessica"The function should return the student's name with the best average, 
 taking into consideration that a given student can have n number of test scores.
 """
import math
input = [["Bob", "87"],["Mike", "35"],["Bob","52"],["Jason","35"],["Mike", "55"],["Jessica", "99"]]

best_student = ""
best_score = 0

for item in input:
    score = math.floor(float(item[1]))
    if score > best_score:
        best_student = item[0]
        best_score = score
print(f"Nejlepší výsledek má student {best_student}, skóre {best_score}.")



