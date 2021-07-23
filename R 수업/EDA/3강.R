### 3.1 백분위수와 사분위수
A_salary <- c(25,28,50,60,30,35,40,70,40,70,40,100,30,30)
B_salary <- c(20,40,25,25,35,25,20,10,55,65,100,100,150,300)

## 백분위수 : 데이터를 정렬한 후, 특정 퍼센트 지점의 수
# 최소값 : 0% 지점의수
# 최대값 : 100% 지점의 수
# 중앙값 : 50% 지점의 수
## 백분위수 - quantile()로 상위 10% 해당되는 지점의 두 회사의 연봉이
궁금하다면 90% 지점의 백분위수 구하기

# 90% 백분위수
quantile(A_salary, 0.9)
quantile(B_salary, 0.9)

## 사분위수 : 백분위수 중 0%, 25%, 50%, 75%, 100% 지점의 수
# 사분위수
quantile(A_salary)
quantile(B_salary)

### 3.2 상자그림
## 상자그림 - boxplot(): A 기업과 B 기업의 연봉 데이터를 상자그림으로 비교
boxplot(A_salary, B_salary, names = c("A회사 salary","B회사 salary"))

### 3.3 히스토그램
## 히스토그램 : 구간별 값의 분포 시각화, 데이터가 연속형 수치 데이터인 경우 데이터의 분포를 시각화하기에 좋은 그래프
## hist() : breaks 매개인자의 숫자만큼 구간을 나누어 X축에 배치하고, 그 구간의 데이터 개수를 Y축의 막대 길이로 표현
## 막대그래프 : 이산형 수치데이터나 범주형 데이터 경우 사용
hist(A_salary, xlab= "A사 salary", ylab = "인원수", breaks = 5)
hist(B_salary, xlab= "B사 salary", ylab = "인원수", breaks = 5)

### 3.4 도수분포표
## 도수풉노표 : 수집된 변수의 데이터를 범주 또는 동일한 크기의 구간으로 분류하고 각 구간마다
## 몇 개의 데이터가 존재하는지를 정리한 표로 많은 데이터를 알기 쉽게 정리하는 통계적 방법 중 하나
## 수치 데이터 -> 도수분포표 생성시 cut() 함수
A_salary <- c(25,28,50,60,30,35,40,70,40,70,40,100,30,30)
cut_value <- cut(A_salary, breaks=5)
freq <- table(cut_value)

freq

## 범주형 데이터 -> table() 함수로 도수분포표 생성
A_gender <- as.factor(c("남","남","남","남","남","남","남","남","남","여","여","여","여","여"))
B_gender <- as.factor(c("남","남","남","남","여","여","여","여","여","여","여","남","여","여"))
A <- data.frame(gender <- A_gender, salary <- A_salary)
B <- data.frame(gender <- B_gender, salary <- B_salary)

# 도수 분포표를 생성
freqA <- table(A$gender)
freqB <- table(B$gender)
freqA
freqB

## 상대적 빈도표 - prob.table()

# A사의 남녀 도수분포표를 구해 저장한 freqA를 이용
prop.table(freqA)
# B사의 남녀 도수분포표를 구해 저장한 freqB를 이용
prop.table(freqB)

### 3.5 막대그래프
## 막대그래프 - barplot()
# A사
barplot(freqA, names= c("남","여"), col = c("skyblue","pink"), ylim=c(0,10))
title(main = "A사")
# B사
barplot(freqB, names= c("남","여"), col = c("skyblue","pink"), ylim=c(0,10))
title(main = "B사")

## 3.6 파이 그래프
## 파이그래프 - pie()
pie(x = freqA, col = c("skyblue","pink"),main="A사")
pie(x = freqB, col = c("skyblue","pink"),main="B사")

