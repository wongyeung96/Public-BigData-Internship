### [실습 1] 다중선형회귀 | 모델 생성
# 예제) 아들의 키를 종속변수로 아버지의 키와 어머니의 키를 독립변수로 하는 회귀 모델
height_father <- c(180,172,150,180,177,160,170,165,179,159) # 아버지의 키
height_mother <- c(160,164,166,188,160,160,171,158,169,159) # 어머니의 키
height_son <- c(180,173,163,184,165,165,175,168,179,160)    # 아들의 키
height <- data.frame(height_father,height_mother,height_son)
head(height)

model <- lm(height_son ~ height_father+ height_mother,data=height)
model

# 회귀계수
coef(model)

### [실습 2] 다중선형회귀 | 잔차
# 잔차
r <- residuals(model)
r[0:4]

# 잔차 제곱합
deviance(model)

### [실습 3] 다중선형회귀 | 예측
# 예제) 아버지 키 170, 어머니 키 160의 데이터로 아들의 키를 예측
# 점 추정
predict.lm(model, newdata = data.frame(height_father=170,height_mother=160))

# 구간추정
predict.lm(model, newdata = data.frame(height_father = 170, height_mother=160),
interval = "confidence")

### [실습 4] 다중선형회귀 | 결정계수와 수정된 결정계수
summary(model)


### [실습 5] 다중선형회귀 | 설명변수 선택
# R의 샘플 데이터인 mtcars와 step() 함수를 이용해 단계적 방법으로 설명변수를 선택
# mtcars의 연비 변수인 mpg를 종속변수, 나머지 변수를 설명변수로 하는 회귀 모델
model <- lm(mpg ~ ., data = mtcars)
# mpg~.는 종속벼수가 mpg이며 그 외 모든 변수가 설명변수임을 의미하는 포뮬러

# step()함수를 통해 model의 최적 설명 변수 추출
new_model <- step(model, direction = "both")
# AIC 값이 작을 수록좋은 모델


### [실습 6] 선형회귀 | 모델 진단 그래프
model <- lm(mpg ~ wt+qsec+am, data=mtcars)
plot(model)