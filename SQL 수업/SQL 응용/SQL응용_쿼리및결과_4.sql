--- [�ǽ� 4-1] Equi Join �ǽ�
-- Equi Join �ǽ�

-- [����] ��� ���̺�� ���� ���̺��� ���� SQL
select tb_emp.emp_name,tb_emp.org_cd,
	tb_org.org_cd, tb_org.org_name
from cslee.tb_emp, cslee.tb_org
where cslee.tb_emp.org_cd = cslee.tb_org.org_cd;

-- [����] ����̸�, �ҼӺμ��ڵ�, �μ���(������), ��å�� ����Ͻÿ�
select tb_emp.emp_no, tb_emp.emp_name, tb_emp.org_cd,
	tb_org.org_name, tb_emp.position
from cslee.tb_emp, cslee.tb_org
where cslee.tb_emp.org_cd = cslee.tb_org.org_cd; --�����÷�

-- Alias ���
select E.emp_no, E.emp_name, E.org_cd,O.org_name,E.position
from cslee.tb_emp as E, cslee.tb_org as O
where E.org_cd = O.org_cd -- �����÷� ����
	and E.position = '����' -- ���� ����
order by O.org_name;       -- ����

--- [�ǽ� 4-2] 3�� �̻� ���̺� ����
-- [����] ���¹�ȣ, ����, ��ǰ��, ���ݾ�, �����ڸ��� ����Ѵ�.
select A.accno, C.cust_name, P.prod_name,A.cont_amt,E.emp_name
from cslee.tb_accnt A, cslee.tb_cust C, cslee.tb_prod P, cslee.tb_emp E 
where A.cust_no = C.cust_no and A.prod_cd = P.prod_cd and A.manager = E.emp_no
limit 10;

-- [����] ����� �޿��� ��� ��޿� ���ϴ��� �˰� �ʹٴ� �䱸���׿� ���� Non EQUI JOIN
select E.emp_name �����, E.salary ����, S.grade �޿����
from cslee.tb_emp E, cslee.tb_grade S
where E.salary between S.low_sal and S.high_sal
limit 10;

--- [�ǽ� 4-3] ǥ������
-- ǥ�� ����(ANSI ǥ����, ANSI ǥ�������� ������ ���� ����)
-- Inner Join

-- [����] ��� ��ȣ�� ��� �̸�, �ҼӺμ� �ڵ�� �ҼӺμ� �̸��� ã�ƺ���.

-- (1) WHERE �� JOIN ����
select emp.emp_no, emp.emp_name, org.org_name
from cslee.tb_emp EMP, cslee.tb_org ORG
where EMP.org_cd = ORG.org_cd
limit 10;

-- (2) FROM �� JOIN ����
select EMP.emp_no, EMP.emp_name, ORG.org_name 
from cslee.tb_emp EMP 
inner join cslee.tb_org ORG
on EMP.org_cd = ORG.org_cd
limit 10;

-- (3) INNER Ű���� ����
select EMP.emp_no, EMP.emp_name, ORG.org_name
from cslee.tb_emp EMP
join cslee.tb_org ORG
on EMP.org_cd = ORG.org_cd
limit 10;

-- FROM �� JOIN ����
-- [����] ���� ���̺��� ���¹�ȣ�� ����ȣ, ���� ���� �����̺�� �����Ͽ� ã�ƺ���.
select ACC.accno, ACC.cust_no, CUST.cust_name 
from cslee.tb_accnt ACC
inner join cslee.tb_cust CUST
on (CUST.cust_no = ACC.cust_no)
limit 10;

-- FROM �� JOIN ����
-- [����] �����ڵ� 10�� �μ��� �Ҽ� ��� �̸� �� �Ҽ� �μ� �ڵ�, �μ� �ڵ�, �μ� �̸��� ã�ƺ���.
select E.emp_name,E.org_cd,O.org_cd,O.org_name
from cslee.tb_emp E
join cslee.tb_org O
on (E.org_cd = O.org_cd)
where E.org_cd = '10';

-- ON������- ��������
-- (1) WHERE �� JOIN ����
select A.accno ���¹�ȣ, C.cust_name ����, P.prod_name ��ǰ��, A.cont_amt ���ݾ�, E.emp_name ����ڸ�
from cslee.tb_accnt A, cslee.tb_cust C, cslee.tb_prod P, cslee.tb_emp E
where A.cust_no = C.cust_no
and A.prod_cd = P.prod_cd
and A.manager = E.emp_no
limit 10;

-- (2) ON �� JOIN ����
select A.accno ���¹�ȣ, C.cust_name ����, P.prod_name ��ǰ��, A.cont_amt ���ݾ�, E.emp_name ����ڸ�
from cslee.tb_accnt A 
inner join cslee.tb_cust C on A.cust_no = C.cust_no
inner join cslee.tb_prod P on A.prod_cd = P.prod_cd
inner join cslee.tb_emp E on A.manager = E.emp_no
limit 10;

-- CROSS ����(��� �����Ͱ� ������ �̸� �����غ�����)
select count(emp_name) from cslee.tb_emp;

select count(org_name) from cslee.tb_org;

select E.emp_name, O.org_name
from cslee.tb_emp E cross join cslee.tb_org O
order by emp_name
limit 10;

select count(e.emp_name)
from cslee.tb_emp E cross join cslee.tb_org O;

-- Left Outer Join ����(��� �����Ͱ� ������ �̸� �����غ�����)
-- [����] �����߿� ���� �μ������� �ȵ� ����� �ִ�. ���(TB_EMP)�� ����(TB_ORG)�� JOIN�ϵ� �μ������� �ȵ� ����� ������ ���� ����ϵ��� �Ѵ�.

select E.emp_no ���, E.emp_name �����, E.position ��å, O.org_name �μ���
from cslee.tb_emp E 
left outer join cslee.tb_org O
on E.org_cd = O.org_cd
where E.position = '���';

-- Right Outer Join
--[����] ���� �������� LEFT JOIN�� OUTER JOIN���� ǥ���Ѵ�.

select E.emp_no ���, E.emp_name �����, E.position ��å, O.org_name �μ���
from cslee.tb_org O 
right outer join cslee.tb_emp E
on E.org_cd = O.org_cd
where E.position ='���';


--  Full Outer Join
select A.org_cd, A.org_name, B.org_cd, B.org_name
from cslee.tb_org A 
full outer join cslee.tb_org B
on A.org_cd = B.org_cd; 

select A.org_cd, A.org_name, B.org_cd, B.org_name
from cslee.tb_org A 
left outer join cslee.tb_org B
on A.org_cd = B.org_cd
union
select A.org_cd, A.org_name, B.org_cd, B.org_name
from cslee.tb_org A 
right outer join cslee.tb_org B
on A.org_cd = B.org_cd;