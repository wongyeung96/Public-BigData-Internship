--- [�ǽ� 2-1] ��ȯ�Լ�
-- ���� p.154
-- �ּ� ���ϱ�
select emp_name, to_char((current_timestamp-ent_date),'W') WEEKS
from cslee.tb_emp 
where org_cd = '10';

-- ���� p.156

-- to_char ����
select emp_name, ent_date,
	to_char(ent_date,'yyyy') �Ի��,
	to_char(ent_date,'MM') �Ի��,
	to_char(ent_date,'DD') �Ի���
from cslee.tb_emp
limit 10;

-- Extract ����
select emp_name, ent_date,
extract('year' from ent_date) �Ի��,
extract('month' from ent_date) �Ի��,
extract('day' from ent_date) �Ի���
from cslee.tb_emp
limit 10;

-- ��ȯ�Լ�(����� ������ ���� ��ȯ) to_date, to_number, to_timestamp, cast
select to_date('05 Dec 2000', 'DD Mon YYYY')

select to_number('12,454.8-','99G999D9S');

select to_timestamp('05 Dec 2000','DD Mon YYYY')

--- [�ǽ� 2-2] CASE
-- ��ȯ�Լ� ��ü (��) ���� p.158

select cast(123.4 as varchar(10)),
		cast('123.5' as numeric),
		cast(1234.5678 as dec(6,2)),
		cast(current_timestamp as date),
		to_char(current_timestamp, 'YYYY-MM-DD HH24:MI:SS'),
		to_char(1234.56, 'L9,999.99'),
		TO_NUMBER('$12,345', '$99,999'), 
		TO_DATE('2014/03/01 21:30:18','YYYY/MM/DD HH24:MI:SS'), 
		TO_TIMESTAMP('2014/03/01 21:30:18','YYYY/MM/DD HH24:MI:SS');

		
-- Case ǥ�� ����, ���� p.158
SELECT emp_name,
	case when salary > 50000000
	then salary
	else 50000000
	end as revised_salary
FROM cslee.tb_emp
limit 10;

-- ���� p.159 �ǽ�
select org_name,
	case org_name
	when '���� 1��' then '����'
	when '���� 2��' then '����'
	when '���� 3��' then '����'
	when '�濵������' then '����'
	else '����'
	end as AREA
	from cslee.tb_org;

-- ���� p.160
-- case ��
select emp_name,
	case when salary >= 90000000 then 'HIGH'
		 when salary >= 60000000 then 'MID'
		 else 'LOW'
	end as salary_grade
from cslee.tb_emp
limit 10;

-- ��ø case ��
select emp_name, salary,
	case when salary >= 50000000 then 20000000
	else (case when salary >= 20000000 then 10000000
			else salary *0.5 end)
	end as BONUS
from cslee.tb_emp
limit 10;

--- [�ǽ� 2-3] NULL ���� �Լ�
-- NULL ���� �Լ� p.162
-- coalesce �Լ�
select emp_name, position,
	-- nvl(position,'����') -- oracle null üũ�Լ�
	coalesce(position,'����') --null üũ�Լ�
from cslee.tb_emp
limit 10;

-- case �Լ�
select emp_name, position,
	case when position is null 
	then '����'
	else position 
	end as ��å
from cslee.tb_emp
limit 10;

-- NULL�� ������ p.163
select coalesce(salary, 0) SAL 
from cslee.tb_emp
where emp_name='������';

SELECT MAX(salary) SAL 
FROM cslee.tb_emp
WHERE emp_name='������';

SELECT coalesce(MAX(salary), 9999) SAL 
FROM cslee.tb_emp
WHERE emp_name='������';
		