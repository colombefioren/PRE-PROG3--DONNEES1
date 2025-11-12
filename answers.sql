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

SELECT Leave.id, Leave.start_date, Leave.end_date, Employee.first_name, Employee.last_name, Team.name
FROM Leave
JOIN Employee
ON Leave.employee_id = Employee.id
JOIN Team
ON Employee.team_id = Team.id;

-- 4. Affichez par le nombre d’employés par contract_type, vous devez afficher le type de contrat, et le nombre d’employés associés.

SELECT contract_type, COUNT(*)
FROM Employee
GROUP BY contract_type;

-- 5. Afficher le nombre d’employés en congé aujourd'hui. La période de congé s'étend de start_date inclus jusqu’à end_date inclus.

SELECT COUNT(*)
FROM Leave
WHERE start_date <= CURRENT_DATE AND end_date >= CURRENT_DATE;

-- 6. Afficher l’id, le nom, le prénom de tous les employés + le nom de leur équipe qui sont en congé aujourd’hui. Pour rappel, la end_date est incluse dans le congé, l’employé ne revient que le lendemain. 

SELECT Employee.id, Employee.first_name, Employee.last_name, Team.name
FROM Leave
JOIN Employee
ON Leave.employee_id = Employee.id
JOIN Team
ON Employee.team_id = Team.id
WHERE start_date <= CURRENT_DATE AND end_date >= CURRENT_DATE;
