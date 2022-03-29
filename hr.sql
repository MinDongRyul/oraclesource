-- hr(오라클 연습용 계정)
-- scott가 가지고 있는 정보의 원본

-- [문제1] employess 테이블 전체 내용 조회
SELECT
    *
FROM
    employees;

-- [문제2] employess 테이블의 first_name, last_name, job_id
SELECT
    first_name,
    last_name,
    job_id
FROM
    employees;
    
-- [문제3] employees 테이블의 모든 열을 조회
-- employee_id : empno
-- manager_id : mgr
-- department_id : deptno
-- 위 세개의 열은 별칭을 붙여서 조회
-- 조회할 때 부서번호를 기준으로 내림차순으로 정렬하되 부서번호가 같다면
-- 사원이름(First_name)을 기준으로 오름차순 정렬
SELECT
    employee_id   AS empno,
    manager_id    AS mgr,
    department_id AS deptno,
    last_name,
    first_name,
    email,
    phone_number,
    hire_date,
    job_id,
    salary,
    commission_pct
FROM
    employees
ORDER BY
    department_id DESC,
    first_name ASC;
    
-- [문제4] 사원번호가 176인 사원의 LAST_NAME과 DEPTNO 조회
SELECT
    last_name,
    department_id
FROM
    employees
WHERE
    employee_id = 176;
-- [문제5] 연봉이 12,000 이상 되는 직원들의 LAST_NAME과 SALARY 조회
SELECT
    last_name,
    salary
FROM
    employees
WHERE
    salary >= 12000;
-- [문제6] 연봉이 5000 ~ 12000 범위 사이가 아닌 사원들 조회 
SELECT
    last_name,
    salary
FROM
    employees
WHERE
    salary < 5000
    OR salary > 12000;
    
-- [문제7] 20번 혹은 50번 부서에서 근무하는 모든 사원들의 last_name 및 department_id 조회
-- 후, last_name의 오름차순, department_id 의 오름차순으로 정렬
SELECT
    last_name,
    department_id
FROM
    employees
WHERE
    department_id IN ( 20, 50 )
ORDER BY
    last_name,
    department_id;

-- [문제8] 커미션을 받는 모든 사원들의 last_name, slalry, commission_pct를 조회
-- 연봉의 내림차순, commission_pct의 내림차순 정렬
SELECT
    last_name,
    salary,
    commission_pct
FROM
    employees
WHERE
    commission_pct > 0
ORDER BY
    salary DESC,
    commission_pct DESC;
-- [문제9] 연봉이 2500, 3500, 7000이 아니며, 직업이 sa_rep, st_clerk인 사원 조회
-- 전제 정보 조회
SELECT
    *
FROM
    employees
WHERE
    job_id IN ( 'SA_REP', 'ST_CLERK' )
    AND ( salary != 2500
          OR salary != 3500
          OR salary != 7000 );
-- [문제10] '2008-02-20' ~ '2008-05-01' 사이에 고용된 사원들의 last_name, employee_id, hire_date
-- 조회, hire_Date의 내림차순으로 정렬
SELECT
    last_name,
    employee_id,
    hire_date
FROM
    employees
WHERE
        hire_date >= '2008-02-20'
    AND hire_date <= '2008-05-01'
ORDER BY
    hire_date;

SELECT
    last_name,
    employee_id,
    hire_date
FROM
    employees
WHERE
    hire_date BETWEEN '2008-02-20' AND '2008-05-01'
ORDER BY
    hire_date; 
    
-- [문제11] '2004'년도에 고용된 모든 사람들의 last_name, hire_date를 조회하여
-- 입사일 기준으로 오름차순 정렬
SELECT
    last_name,
    hire_date
FROM
    employees
WHERE
        hire_date >= '2004-01-01'
    AND hire_date <= '2004-12-31'
ORDER BY
    hire_date ASC;

SELECT
    last_name,
    hire_date
FROM
    employees
WHERE
    hire_date BETWEEN '2004-01-01' AND '2004-12-31'
ORDER BY
    hire_date; 
    
-- LIKE 와 와일드카드 사용  
    
-- [문제12] '2004'년도에 고용된 모든 사람들의 last_name, hire_date를 조회하여
-- 입사일 기준으로 오름차순 정렬
SELECT
    last_name,
    hire_date
FROM
    employees
WHERE
    hire_date LIKE '04%'
ORDER BY
    hire_date;
-- [문제13] last_name 에 u가 포함되는 사원들의 사번 및 last_name 조회
SELECT
    employee_id,
    last_name
FROM
    employees
WHERE
    last_name LIKE '%u%';
-- [문제14] last_name 의 네번째 글자가 a인 사원들의 사번 및 last_name 조회
SELECT
    employee_id,
    last_name
FROM
    employees
WHERE
    last_name LIKE '___a%';
-- [문제15] last_name에 a혹은 e가 들어있는 사원들의 사번 및 last_name 조회 후
-- last_name 오름차순 출력
SELECT
    employee_id,
    last_name
FROM
    employees
WHERE
    last_name LIKE '%a%'
    OR last_name LIKE '%e%'
ORDER BY
    last_name;
-- [문제16] last_name에 a와 e가 들어있는 사원들의 사번 및 last_name 조회 후
-- last_name 오름차순 출력
SELECT
    employee_id,
    last_name
FROM
    employees
WHERE
    last_name LIKE '%a%e%'
    OR last_name LIKE '%e%a%'
ORDER BY
    last_name;
    
-- [문제] 매니저가 없는 사원들의 last_name, job_id 조회
SELECT
    last_name,
    job_id,
    managert_id
FROM
    employees
WHERE
    manager_id IS NULL;

-- [문제] ST_CLERK인 JOB_ID를 가진 사원이 없는 부서 ID조회
-- 단, 부서번호가 NULL인 값은 제외한다.
SELECT
    department_id
FROM
    employees
WHERE
        job_id != 'ST_CLERK'
    AND department_id IS NOT NULL;

-- [문제] commision_pct가 널이 아닌 사원들 중에서 commission = salary * commision_pct를
-- 구하여, employee_id, first_name, job_id와 함께 출력
SELECT
    salary * commission_pct AS commission,
    employee_id,
    first_name,
    job_id
FROM
    employees
WHERE
    commission_pct IS NOT NULL;

-- [문제] first_name이 Curtis인 사람의 first_name, last_name, phone_number, job_id 조회
-- 단, job_id의 결과는 소문자로 출력하기
SELECT
    first_name,
    last_name,
    phone_number,
    lower(job_id)
FROM
    employees
WHERE
    first_name = 'Curtis';

-- [문제] 부서번호가 60,70,80,90인 사원들의 employee_id, first_name, last_name, department_id
-- job_id 조회하기. 단, job_id가 IT_PROG인 사원의 경우 프로그래머로 변경하여 출력
SELECT
    employee_id,
    first_name,
    last_name,
    department_id,
    replace(job_id, 'IT_PROG', '프로그래머')
FROM
    employees
WHERE
    department_id IN ( 60, 70, 80, 90 );

-- [문제] JOB_ID가 AD_PRES, PU_CLERK인 사원들의 employee_id, first_name, last_name, department_id
-- job_id 조회하기, 단 사원명은 first_name과 last_name을 연결하여 출력
SELECT
    employee_id,
    concat(first_name,(' '
                       || last_name)) AS 사원명,
    department_id,
    job_id
FROM
    employees
WHERE
    job_id IN ( 'AD_PRES', 'PU_CLERK' );

SELECT
    employee_id,
    first_name
    || ' '
    || last_name AS 사원명,
    department_id,
    job_id
FROM
    employees
WHERE
    job_id IN ( 'AD_PRES', 'PU_CLERK' );

-- [문제] 부서 id가 80인 사원에 대해서 서로 다른 세율 적용
-- 2000미만 - 0%, 4000 미만 9%, 6000미만 20%
-- 8000미만 30%, 10000 미만 40%, 12000미만 42%
-- 14000미만 44%, 14000이상 45%
SELECT
    last_name,
    salary,
    decode(trunc(salary / 2000), 0, 0.00, 1, 0.09,
           2, 0.20, 3, 0.30, 4,
           0.40, 5, 0.42, 6, 0.44,
           0.45) AS tax_rate
FROM
    employees
WHERE
    department_id = 80;

SELECT
    last_name,
    salary,
    CASE
        WHEN salary >= 14000 THEN
            0.45
        WHEN salary < 13999
             AND salary >= 12000 THEN
            0.44
        WHEN salary < 11999
             AND salary >= 10000 THEN
            0.42
        WHEN salary < 9999
             AND salary >= 8000 THEN
            0.40
        WHEN salary < 7999
             AND salary >= 6000 THEN
            0.30
        WHEN salary < 5999
             AND salary >= 4000 THEN
            0.20
        WHEN salary < 3999
             AND salary >= 2000 THEN
            0.09
        ELSE
            0
    END AS tax_rate
FROM
    employees
WHERE
    department_id = 80;

-- [문제] 회사 내의 최대 연봉 및 최소 연봉 차 출력
SELECT
    MAX(salary) - MIN(salary)
FROM
    employees;

-- [문제] 매니저로 근무하는 사원들의 총 숫자 출력
SELECT
    COUNT(DISTINCT manager_id)
FROM
    employees;

-- [문제] 부서별 직원수를 구하여, 부서 번호의 오름차순으로 출력
SELECT
    department_id,
    COUNT(employee_id)
FROM
    employees
GROUP BY
    department_id
ORDER BY
    department_id;

-- [문제] 부서별 급여의 평균 연봉 출력(부서번호별 오름차순)
SELECT
    department_id,
    round(AVG(salary))
FROM
    employees
GROUP BY
    department_id
ORDER BY
    department_id; 
    
-- [문제] 동일한 직업을 가진 사원들의 수
SELECT
    job_id,
    COUNT(employee_id)
FROM
    employees
GROUP BY
    job_id
ORDER BY
    job_id;

-- [실습] 자신의 담당 매니저의 고용일 보다 빠른 입사자 찾기(employees 셀프조인)
SELECT
    e1.employee_id,
    e1.first_name || e1.last_name AS name,
    e1.hire_date,
    e2.first_name || e1.last_name AS mgr_name,
    e2.hire_date                  AS mgr_hire_date
FROM
    employees e1,
    employees e2
WHERE
        e1.manager_id = e2.employee_id
    AND e1.hire_date < e2.hire_date;
    
-- 모범 답안
select e1.last_name, e1.hire_date as 내입사일, e1.manager_id, e2.hire_date as 매니저입사일
from employees e1 join employees e2 on e1.manager_id = e2.employee_id
where e1.hire_date < e2.hire_date;

-- [실습] 도시 이름이 T로 시작하는 지역에 사는 사원들의 사번, last_name, department_id, city
-- 출력(employees, departments, locations 테이블 조인)
SELECT
    e.employee_id,
    e.last_name,
    d.department_id,
    l.city
FROM
         departments d
    JOIN employees e ON d.department_id = e.department_id
    JOIN locations l ON d.location_id = l.location_id
WHERE
    l.city LIKE 'T%';

-- 모범 답안
select employee_id, last_name, d.department_id, city
from employees e join departments d on e.department_id = d.department_id
join locations l on d.location_id = l.location_id
where city like 'T%';

-- [실습] 위치 ID가 1700인 사원들의 employee_id, last_name, department_id, salary
-- 출력(employees, departments 조인)
SELECT
    e.employee_id,
    e.last_name,
    d.department_id,
    e.salary,
    d.location_id
FROM
    employees   e,
    departments d
WHERE
        e.department_id = d.department_id
    AND d.location_id = 1700;

-- 모범 답안
select employee_id, last_name, e.department_id, salary
from employees e join departments d on e.department_id = d.department_id
where d.location_id = 1700;

-- [실습] 각 부서별 평균 연봉(소수점 2자리까지), 사원 수 조회
-- departments, location_id, sal_avg, cnt 출력
-- (employees, departments 조인)
SELECT
    d.department_name,
    d.location_id,
    round(AVG(salary), 2) AS sal_avg,
    COUNT(employee_id)    AS cnt
FROM
    employees   e,
    departments d
WHERE
    e.department_id = d.department_id
GROUP BY
    d.department_name,
    d.location_id
ORDER BY
    location_id;
    
-- 모범 답안
select department_name, location_id, round(avg(salary),2) as sal_avg, count(employee_id) as cnt
from employees e join departments d on e.department_id = d.department_id
group by department_name, location_id
order by location_id;

-- [실습] Executive 부서에 근무하는 모든 사원들의 department_id, last_name, job_id 출력
-- (employees, departments 조인)
SELECT
    e.department_id,
    e.last_name,
    e.job_id
FROM
    employees   e,
    departments d
WHERE
        e.department_id = d.department_id
    AND d.department_name = 'Executive';
    
-- 모범 답안
select e.department_id, e.last_name, e.job_id
from employees e join departments d on e.department_id = d.department_id
where d.department_name = 'Executive';

-- [실습] 기존의 직업을 여전히 가지고 있는 사원들의 employee_id, job_id 출력
-- employees 셀프 조인, job_history 내부조인
SELECT
    e.employee_id,
    e.job_id,
    jh.job_id AS history_job_id
FROM
         employees e
    INNER JOIN job_history jh ON e.job_id = jh.job_id -- e.employee_id = jh.employee_id
-- where e.job_id = j.job_id
ORDER BY
    e.employee_id;
-- 모범 답안
select e.employee_id, e.job_id
from employees e inner join job_history j on e.employee_id = j.employee_id
where e.job_id = j.job_id;

-- [실습] 각 사원별 소속부서에서 자신보다 늦게 고용되었으나 보다 많은 연봉을 받는 사원의
-- department_id, last_name, salary, hire_date 출력 
-- (employees 셀프 조인)
SELECT
    DISTINCT e.employee_id,
    e.department_id,
    e.last_name,
    e.salary,
    e.hire_date
FROM
         employees e
    JOIN employees e2 ON e.department_id = e2.department_id
WHERE
        e.hire_date > e2.hire_date
    AND e.salary > e2.salary
--GROUP BY
--    e.employee_id,
--    e.department_id,
--    e.last_name,
--    e.salary,
--    e.hire_date
ORDER BY
    e.department_id;

-- 모범 답안
select DISTINCT e2.department_id, e2.last_name, e2.salary, e2.hire_date
from employees e1 join employees e2 on e1.department_id = e2.department_id
where e1.hire_date < e2.hire_date and e1.salary < e2.salary
ORDER by e2.department_id;

-- index 
create table indextbl as select distinct first_name, last_name, hire_date from employees;

select * from indextbl;

select * from indextbl where first_name = 'Jack';

create index idx_indextbl_firstname on indextbl(first_name);















