--- 4��. ������ ���Ѱ� ����
-- 1. Where�� ����

-- ����1 : ������ �� ��
select emp_name ����̸�, org_cd �Ҽ�, position ����, salary ����
from cslee.tb_emp
where position = '�븮';

-- ���� �ð� ��ȸ�ϴ� ���
select now();

-- ���� �ð����� �Ϸ� �� ��¥ ���ϴ� ���
select now(), now()::date - '1 day' ::interval �Ϸ���;

-- ���� Ÿ���� ��ȸ�ϴ� ���
show timezone;

-- �ý��� ���ڸ� ��ȸ�ϴ� ���
select current_date, current_time, timeofday();

select now(), current_timestamp, timestamp 'now';

-- ��¥���� ������ �����ϴ� ���(date_part, extract, date_trunc ���� ����� ��� �ٸ��� ���غ�����)
select date_part('year',timestamp '2020-07-30 20:38:40');
select date_part('year', current_timestamp);

select extract('isoyear' from date '2006-01-01');
select extract('isoyear' from current_timestamp);

select date_trunc('year',timestamp '2020-07-30 20:38:40');
select date_trunc('year', current_timestamp);

-- ��¥���� ���� �����ϴ� ��� (date_part, extract, date_trunc ���� ����� ��� �ٸ��� ���غ�����.)
select date_part('month', timestamp '2020-07-30 20:38:40');
select date_part('month', current_timestamp);

select extract('month' from timestamp '2020-07-30 20:38:40');
select extract('month' from interval '2 years 3 months');
select extract('month' from interval '2 years 13 months');

select date_trunc('month', timestamp '2020-07-30 20:38:40'); -- �������� ������ �������� �ʱ�ȭ�� �´��� �����

-- ��¥���� ���� �����ϴ� ���
select date_part('day', timestamp '2020-07-30 20:38:40');
select date_trunc('day', timestamp '2020-07-30 20:38:40'); -- ���ڱ����� ������ �������� �ʱ�ȭ�� �´��� �����

-- �ð����� �ø� �����ϴ� ���
select date_part('hour', timestamp '2013-07-30 20:38:40');
select date_part('hour', interval '4 hours 3 minutes');
select date_trunc('hour', timestamp '2020-07-30 20:38:40');

-- �ð����� ���� �����ϴ� ���
select date_part('minute', timestamp '2020-07-30 20:38:40');
select date_trunc('minute', timestamp '2020-07-30 20:38:40');

-- �ð����� �ʸ� �����ϴ� ���
select date_part('second', timestamp '2013-07-30 20:38:40');
select extract('second' from time '17:12:28.5');
select date_trunc('second', timestamp '2013-07-30 20:38:40');
