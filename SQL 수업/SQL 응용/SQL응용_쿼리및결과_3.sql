--- [실습 3-1] 집계함수, GROUP BY
-- p.167

select count(*) "전체 건수",
		count(position) "직책 건수",
		count(distinct position) "직책 종류",
		max(salary) "최대",
		min(salary) "최소",
		avg(salary) "평균"
from cslee.tb_emp;

-- Group by 절
-- p.169
select position "직책",
		count(*) "인원수",
		min(salary) "최소",
		max(salary) "최대",
		avg(salary) "평균"
from cslee.tb_emp
group by position;

--- [실습 3-2] Having 절
-- Having 절
select org_cd "부서",
		count(*) "인원수",
		avg(salary) "평균"
from cslee.tb_emp
group by org_cd
having count(*) >= 4;

select org_cd "부서",
		max(salary) "최대"
from cslee.tb_emp
group by org_cd
having min(salary) <= 40000000;

select org_cd, position, avg(salary)
from cslee.tb_emp
where position in ('과장','대리','사원')
group by org_cd, position;

--- [실습 3-3] 고급 집계쿼리
select org_cd "부서",
	avg(case position when '과장' then salary end) "과장",
	avg(case position when '대리' then salary end) "대리",
	avg(case position when '사원' then salary end) "사원"
from cslee.tb_emp
where position in ('과장','대리','사원')
group by org_cd;

select org_cd "부서",
	sum(coalesce((case position when '팀장' then 1 else 0 end),0)) "팀장",
	sum(coalesce((case position when '과장' then 1 else 0 end),0)) "과장",
	sum(coalesce((case position when '대리' then 1 else 0 end),0)) "대리",
	sum(coalesce((case position when '사원' then 1 else 0 end),0)) "사원"
from cslee.tb_emp
group by org_cd;

select org_cd "부서",
	coalesce (sum(case position when '팀장' then 1 end),0) "팀장",
	coalesce (sum(case position when '과장' then 1 end),0) "과장",
	coalesce (sum(case position when '대리' then 1 end),0) "대리",
	coalesce (sum(case position when '사원' then 1 end),0) "사원"	
from cslee.tb_emp
group by org_cd;