UPDATE 
    staffs LEFT JOIN merits ON staffs.performance = merits.performance
SET
    salary = salary + salary * 0.015
WHERE
    merits.percentage IS NULL