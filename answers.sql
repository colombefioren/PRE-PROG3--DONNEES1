-- 1. Afficher l’id, first_name, last_name des employés qui n’ont pas d’équipe.

SELECT id, first_name, last_name
FROM Employee
WHERE team_id IS NULL;

-- 2. Afficher l’id, first_name, last_name des employés qui n’ont jamais pris de congé de leur vie.

SELECT Employee.id, Employee.first_name, Employee.last_name
FROM Leave
RIGHT JOIN Employee
ON Employee.id = Leave.employee_id
WHERE Leave.id IS NULL;

-- 3. Afficher les congés de tel sorte qu’on voie l’id du congé, le début du congé, la fin du congé, le nom & prénom de l’employé qui prend congé et le nom de son équipe.

SELECT Leave.id, Leave.start_date, Leave.end_date, Employee.first_name, Employee.last_name, Team.last_name
FROM Leave
JOIN Employee
ON Leave.employee_id = Employee.id
JOIN Team
ON Employee.team_id = Team.id;