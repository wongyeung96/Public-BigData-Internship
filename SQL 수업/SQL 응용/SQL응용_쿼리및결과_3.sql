--- [�ǽ� 3-1] �����Լ�, GROUP BY
-- p.167

select count(*) "��ü �Ǽ�",
		count(position) "��å �Ǽ�",
		count(distinct position) "��å ����",
		max(salary) "�ִ�",
		min(salary) "�ּ�",
		avg(salary) "���"
from cslee.tb_emp;

-- Group by ��
-- p.169
select position "��å",
		count(*) "�ο���",
		min(salary) "�ּ�",
		max(salary) "�ִ�",
		avg(salary) "���"
from cslee.tb_emp
group by position;

--- [�ǽ� 3-2] Having ��
-- Having ��
select org_cd "�μ�",
		count(*) "�ο���",
		avg(salary) "���"
from cslee.tb_emp
group by org_cd
having count(*) >= 4;

select org_cd "�μ�",
		max(salary) "�ִ�"
from cslee.tb_emp
group by org_cd
having min(salary) <= 40000000;

select org_cd, position, avg(salary)
from cslee.tb_emp
where position in ('����','�븮','���')
group by org_cd, position;

--- [�ǽ� 3-3] ��� ��������
select org_cd "�μ�",
	avg(case position when '����' then salary end) "����",
	avg(case position when '�븮' then salary end) "�븮",
	avg(case position when '���' then salary end) "���"
from cslee.tb_emp
where position in ('����','�븮','���')
group by org_cd;

select org_cd "�μ�",
	sum(coalesce((case position when '����' then 1 else 0 end),0)) "����",
	sum(coalesce((case position when '����' then 1 else 0 end),0)) "����",
	sum(coalesce((case position when '�븮' then 1 else 0 end),0)) "�븮",
	sum(coalesce((case position when '���' then 1 else 0 end),0)) "���"
from cslee.tb_emp
group by org_cd;

select org_cd "�μ�",
	coalesce (sum(case position when '����' then 1 end),0) "����",
	coalesce (sum(case position when '����' then 1 end),0) "����",
	coalesce (sum(case position when '�븮' then 1 end),0) "�븮",
	coalesce (sum(case position when '���' then 1 end),0) "���"	
from cslee.tb_emp
group by org_cd;