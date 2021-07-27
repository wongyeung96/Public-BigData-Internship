### [실습 1] 단순선형회귀 | 모델 생성
# 예제) Orange 데이터는 다음과 같이 각 나무의 종류(Tree)와 나무의 나이(age),나무 둘레(circumference)
# 변수의 관측값이 존재한다.
data(Orange)
head(Orange)

# Orange 데이터프레임의 나무 둘레를 나타내는 circumference 변수를 종속변수로,
# 나무의 나이를 나타내는 age 변수를 설명변수로 하는 단순선형회귀 모델 생성
# lm() 함수로 단순선형회귀 모델을 생성
model <- lm(circumference ~ age, Orange)
model

# coef() 함수를 이용해 회귀계수만 출력
# 회귀계수
coef(model)

### [실습 2] 단순선형회귀 | 잔차
# residuals() 함수로 잔차 확인
# 잔차
r <- residuals(model)
r[0:4]

# fitted() 함수로 model이 예측한 값 구하기
f <- fitted(model)

# residuals() 함수로 잔차 구하기
r <- residuals(model)

# 예측한 값에 잔차를 더하여 실제값과 동일한지 확인
# 예측한 값과 잔차 더하기
f[0:4] + r[0:4]

# 위의 값이 다음의 실제 데이터와 동일함을 확인
# 실제값
Orange[0:4,'circumference']

# 잔차 제곱합 구하기
deviance(model)

### [실습 3] 단순선형회귀 | 예측
# 예측
predict.lm(model, newdata = data.frame(age=100))

### [실습 4] 단순선형회귀 | 에측
# predict.lm()함수로 나이가 100인 나무의 둘레를 예측하기
summary(model)

cor(Orange$circumference,Orange$age)

cor(Orange$circumference,Orange$age) ^2
