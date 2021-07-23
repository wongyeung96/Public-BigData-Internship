#### 1. 데이터 대표값 탐색
### 1.1 평균과 중앙값
A_salary <- c(25,28,50,60,30,35,40,70,40,70,40,100,30,30)
B_salary <- c(20,40,25,25,35,25,20,10,55,65,100,100,150,300)


## 평균값 - mean()
mean(A_salary)
mean(B_salary)

# 결측값(NA)가 있는 경우 결측값을 제거하고 평균을 구할 때는 na.rm = T 인자 사용
mean(A_salary,na.rm=T)

## 중앙값 
median(A_salary)
median(B_salary)
# 결측값(NA)가 있는 경우 결측값을 제거하고 평균을 구할 때는 na.rm = T 인자 사용
median(A_salary,na.rm=T)

### 1.2 절사평균
## 이상값에 민감한 평균의 특징을 보완한 것
mean(A_salary,trim=0.1) # 양끝 10% 씩 값을 제외하고 평균을 구함

mean(B_salary,trim=0.1) # 양끝 10% 씩 값을 제외하고 평균을 구함

### 1.3 가중평균
## 여러 모집단의 샘플이 똑같이 수집되지 않는 경우가 많음
## 이를 보정하기 위한 방법 -> 데이터가 부족한 그룹에 더 높은 가중치를 적용

#### 2. 데이터 분산도 탐색
### 2.1 최소값, 최대값으로 범위 탐색
## 분산도(degree of dispersion): 관측된 데이터가 흩어져 있는 정도
## 범위(range) : 관측된 값들 중에서의 최대값과 최소값의 차이로 분산도를 측정하는 간단한 방법
range(A_salary) # 최소값 25 최대값 100
range(B_salary) # 최소값 10 최대값 300

### 2.2 분산과 표준편차
## 분산 - var(), 표준편차 - sd()
# 분산
var(A_salary)
var(B_salary)

# 표준편차
sd(A_salary)
sd(B_salary)