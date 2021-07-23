-- 4��. ������ ���Ѱ� ����
-- 1. Where�� ����

-- ����1: ������ �� ��
select EMP_NAME ����̸�, ORG_CD �Ҽ�, position ����, SALARY ����
from cslee.tb_emp
where position = '�븮';

-- ����2: ���� �� - ��µǴ� �Ǽ��� ���غ�����.
select count(*) from cslee.tb_emp;
select emp_name ����̸�, org_cd �Ҽ�, position ����, salary ����
from cslee.tb_emp;

select emp_name ����̸�, org_cd �Ҽ�, position ����, salary ����
from cslee.tb_emp te where salary >= 50000000;

-- ����3: ������ �켱����
select emp_name ����̸�, org_cd �Ҽ�, position ��å, salary ����
from cslee.tb_emp
where (org_cd = '08' or org_cd = '09' or org_cd = '10')
and position = '���'
and salary >= 40000000
and salary <= 50000000;

-- ����4: ������ �켱����(Between A and B ����)
select emp_name ����̸�, org_cd �Ҽ�, position ����, salary ����
from cslee.tb_emp
where org_cd in ('08','09','10')
and position = '���'
and salary between 40000000 and 50000000;

select emp_name ����̸�,salary ����
from cslee.tb_emp 
where salary between 40000000 and 50000000;

-- ����5: where ������ -in 
select emp_name, org_cd, position 
from cslee.tb_emp
where org_cd in ('06','07')
and position in ('����','����');

select emp_name, org_cd, position 
from cslee.tb_emp
where (org_cd,position) in (('06','����'),('07','����'));

-- ����6: Where���� - Like

-- "��"�� ���� ���� �������� ������ ��ȸ�ϴ� Where ���� �ۼ��Ѵ�.
 select emp_name ����̸�, org_cd ���ڵ�, position ��å, ent_date �Ի�����
 from cslee.tb_emp 
 where emp_name like '��%';

-- �̸��� �ι�°�� "��"�� �������� ������ ��ȸ�϶�
select emp_name ����̸�, org_cd ���ڵ�, position ��å, ent_date �Ի�����
from cslee.tb_emp 
where emp_name like '_��%';

-- ����7: Where ���� - IS NULL
select emp_name ����̸�, org_cd �Ҽ�, position ��å, gender ����
from cslee.tb_emp
where gender = null;  
-- ����� �ȳ���
select emp_name ����̸�, org_cd �Ҽ�, position ��å, gender ����
from cslee.tb_emp
where gender IS NULL;  
-- ����� �ȳ���

-- ����8: Where ���� - ����������
-- ���� 3��(10)�� ����߿��� '����'�� ������ ������ �������� �ڷḣ ã�´�.
select emp_name ����̸�, org_cd �Ҽ�, position ��å
from cslee.tb_emp
where org_cd = '10' and position != '����';

--�Ҽ��� NULL�� �ƴ� ������ �ڷḦ ����϶�
select emp_name ����̸�, org_cd �Ҽ�, position ��å
from cslee.tb_emp
where org_cd is not null;

-- 2. Order by ���� �����ϱ�
-- ����9
select org_cd �μ�, emp_name ����̸�, ent_date �Ի���
from cslee.tb_emp 
order by org_cd,ent_date desc;

select emp_name, emp_no, org_cd
from cslee.tb_emp
order by emp_name asc, emp_no asc, emp_no desc;

select emp_name ����̸�,emp_no �����ȣ, org_cd �μ��ڵ�
from cslee.tb_emp
order by ����̸�, �����ȣ, �μ��ڵ� desc;

select emp_name, emp_no, org_cd
from cslee.tb_emp
order by 1 asc, 2 asc, 3 desc;

select emp_name ����̸�, emp_no �����ȣ, org_cd �μ��ڵ�
from cslee.tb_emp 
order by emp_name, 2, �μ��ڵ� desc;