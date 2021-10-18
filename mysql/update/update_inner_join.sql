UPDATE 
    staffs INNER JOIN merits ON staffs.performance = merits.performance
SET
    salary = salary + salary * percentage