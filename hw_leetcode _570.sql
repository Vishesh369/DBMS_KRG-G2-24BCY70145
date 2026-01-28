select b.name
from Employee a 
left join Employee b 
ON a.managerId = b.id
group by b.id
having count(b.id) >= 5
