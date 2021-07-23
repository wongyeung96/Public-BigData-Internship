--- [실습 2-1] 변환함수
-- 교재 p.154
-- 주수 구하기
select emp_name, to_char((current_timestamp-ent_date),'W') WEEKS
from cslee.tb_emp 
where org_cd = '10';

-- 교재 p.156

-- to_char 구문
select emp_name, ent_date,
	to_char(ent_date,'yyyy') 입사년,
	to_char(ent_date,'MM') 입사월,
	to_char(ent_date,'DD') 입사일
from cslee.tb_emp
limit 10;

-- Extract 구문
select emp_name, ent_date,
extract('year' from ent_date) 입사년,
extract('month' from ent_date) 입사월,
extract('day' from ent_date) 입사일
from cslee.tb_emp
limit 10;

-- 변환함수(명시적 데이터 유형 변환) to_date, to_number, to_timestamp, cast
select to_date('05 Dec 2000', 'DD Mon YYYY')

select to_number('12,454.8-','99G999D9S');

select to_timestamp('05 Dec 2000','DD Mon YYYY')

--- [실습 2-2] CASE
-- 변환함수 전체 (예) 교재 p.158

select cast(123.4 as varchar(10)),
		cast('123.5' as numeric),
		cast(1234.5678 as dec(6,2)),
		cast(current_timestamp as date),
		to_char(current_timestamp, 'YYYY-MM-DD HH24:MI:SS'),
		to_char(1234.56, 'L9,999.99'),
		TO_NUMBER('$12,345', '$99,999'), 
		TO_DATE('2014/03/01 21:30:18','YYYY/MM/DD HH24:MI:SS'), 
		TO_TIMESTAMP('2014/03/01 21:30:18','YYYY/MM/DD HH24:MI:SS');

		
-- Case 표현 예제, 교재 p.158
SELECT emp_name,
	case when salary > 50000000
	then salary
	else 50000000
	end as revised_salary
FROM cslee.tb_emp
limit 10;

-- 교재 p.159 실습
select org_name,
	case org_name
	when '영업 1팀' then '지사'
	when '영업 2팀' then '지사'
	when '영업 3팀' then '지사'
	when '경영관리팀' then '본사'
	else '지점'
	end as AREA
	from cslee.tb_org;

-- 교재 p.160
-- case 문
select emp_name,
	case when salary >= 90000000 then 'HIGH'
		 when salary >= 60000000 then 'MID'
		 else 'LOW'
	end as salary_grade
from cslee.tb_emp
limit 10;

-- 중첩 case 문
select emp_name, salary,
	case when salary >= 50000000 then 20000000
	else (case when salary >= 20000000 then 10000000
			else salary *0.5 end)
	end as BONUS
from cslee.tb_emp
limit 10;

--- [실습 2-3] NULL 관련 함수
-- NULL 관련 함수 p.162
-- coalesce 함수
select emp_name, position,
	-- nvl(position,'없음') -- oracle null 체크함수
	coalesce(position,'없음') --null 체크함수
from cslee.tb_emp
limit 10;

-- case 함수
select emp_name, position,
	case when position is null 
	then '없음'
	else position 
	end as 직책
from cslee.tb_emp
limit 10;

-- NULL과 공집합 p.163
select coalesce(salary, 0) SAL 
from cslee.tb_emp
where emp_name='김태진';

SELECT MAX(salary) SAL 
FROM cslee.tb_emp
WHERE emp_name='김태진';

SELECT coalesce(MAX(salary), 9999) SAL 
FROM cslee.tb_emp
WHERE emp_name='김태진';
		