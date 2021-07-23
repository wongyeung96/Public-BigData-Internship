--- [실습 4-1] Equi Join 실습
-- Equi Join 실습

-- [예제] 사원 테이블과 조직 테이블의 조인 SQL
select tb_emp.emp_name,tb_emp.org_cd,
	tb_org.org_cd, tb_org.org_name
from cslee.tb_emp, cslee.tb_org
where cslee.tb_emp.org_cd = cslee.tb_org.org_cd;

-- [예제] 사원이름, 소속부서코드, 부서명(조직명), 직책을 출력하시오
select tb_emp.emp_no, tb_emp.emp_name, tb_emp.org_cd,
	tb_org.org_name, tb_emp.position
from cslee.tb_emp, cslee.tb_org
where cslee.tb_emp.org_cd = cslee.tb_org.org_cd; --조인컬럼

-- Alias 사용
select E.emp_no, E.emp_name, E.org_cd,O.org_name,E.position
from cslee.tb_emp as E, cslee.tb_org as O
where E.org_cd = O.org_cd -- 조인컬럼 지정
	and E.position = '팀장' -- 필터 조건
order by O.org_name;       -- 정렬

--- [실습 4-2] 3개 이상 테이블 조인
-- [예제] 계좌번호, 고객명, 상품명, 계약금액, 관리자명을 출력한다.
select A.accno, C.cust_name, P.prod_name,A.cont_amt,E.emp_name
from cslee.tb_accnt A, cslee.tb_cust C, cslee.tb_prod P, cslee.tb_emp E 
where A.cust_no = C.cust_no and A.prod_cd = P.prod_cd and A.manager = E.emp_no
limit 10;

-- [예제] 사원별 급여와 어느 등급에 속하는지 알고 싶다는 요구사항에 대한 Non EQUI JOIN
select E.emp_name 사원명, E.salary 연봉, S.grade 급여등급
from cslee.tb_emp E, cslee.tb_grade S
where E.salary between S.low_sal and S.high_sal
limit 10;

--- [실습 4-3] 표준조인
-- 표준 조인(ANSI 표현법, ANSI 표현법으로 익히는 것이 좋음)
-- Inner Join

-- [예제] 사원 번호와 사원 이름, 소속부서 코드와 소속부서 이름을 찾아본다.

-- (1) WHERE 절 JOIN 조건
select emp.emp_no, emp.emp_name, org.org_name
from cslee.tb_emp EMP, cslee.tb_org ORG
where EMP.org_cd = ORG.org_cd
limit 10;

-- (2) FROM 절 JOIN 조건
select EMP.emp_no, EMP.emp_name, ORG.org_name 
from cslee.tb_emp EMP 
inner join cslee.tb_org ORG
on EMP.org_cd = ORG.org_cd
limit 10;

-- (3) INNER 키워드 생략
select EMP.emp_no, EMP.emp_name, ORG.org_name
from cslee.tb_emp EMP
join cslee.tb_org ORG
on EMP.org_cd = ORG.org_cd
limit 10;

-- FROM 절 JOIN 조건
-- [예제] 계좌 테이블에서 계좌번호와 고객번호, 고객의 명을 고객테이블과 조인하여 찾아본다.
select ACC.accno, ACC.cust_no, CUST.cust_name 
from cslee.tb_accnt ACC
inner join cslee.tb_cust CUST
on (CUST.cust_no = ACC.cust_no)
limit 10;

-- FROM 절 JOIN 조건
-- [예제] 조직코드 10인 부서의 소속 사원 이름 및 소속 부서 코드, 부서 코드, 부서 이름을 찾아본다.
select E.emp_name,E.org_cd,O.org_cd,O.org_name
from cslee.tb_emp E
join cslee.tb_org O
on (E.org_cd = O.org_cd)
where E.org_cd = '10';

-- ON조건절- 다중조인
-- (1) WHERE 절 JOIN 조건
select A.accno 계좌번호, C.cust_name 고객명, P.prod_name 상품명, A.cont_amt 계약금액, E.emp_name 담당자명
from cslee.tb_accnt A, cslee.tb_cust C, cslee.tb_prod P, cslee.tb_emp E
where A.cust_no = C.cust_no
and A.prod_cd = P.prod_cd
and A.manager = E.emp_no
limit 10;

-- (2) ON 절 JOIN 조건
select A.accno 계좌번호, C.cust_name 고객명, P.prod_name 상품명, A.cont_amt 계약금액, E.emp_name 담당자명
from cslee.tb_accnt A 
inner join cslee.tb_cust C on A.cust_no = C.cust_no
inner join cslee.tb_prod P on A.prod_cd = P.prod_cd
inner join cslee.tb_emp E on A.manager = E.emp_no
limit 10;

-- CROSS 조인(몇개의 데이터가 나올지 미리 예측해보세요)
select count(emp_name) from cslee.tb_emp;

select count(org_name) from cslee.tb_org;

select E.emp_name, O.org_name
from cslee.tb_emp E cross join cslee.tb_org O
order by emp_name
limit 10;

select count(e.emp_name)
from cslee.tb_emp E cross join cslee.tb_org O;

-- Left Outer Join 조인(몇개의 데이터가 나올지 미리 예측해보세요)
-- [예제] 직원중에 아직 부서배정이 안된 사원도 있다. 사원(TB_EMP)과 조직(TB_ORG)을 JOIN하되 부서배정이 안된 사원의 정보도 같이 출력하도록 한다.

select E.emp_no 사번, E.emp_name 사원명, E.position 직책, O.org_name 부서명
from cslee.tb_emp E 
left outer join cslee.tb_org O
on E.org_cd = O.org_cd
where E.position = '사원';

-- Right Outer Join
--[예제] 이전 예제에서 LEFT JOIN을 OUTER JOIN으로 표현한다.

select E.emp_no 사번, E.emp_name 사원명, E.position 직책, O.org_name 부서명
from cslee.tb_org O 
right outer join cslee.tb_emp E
on E.org_cd = O.org_cd
where E.position ='사원';


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