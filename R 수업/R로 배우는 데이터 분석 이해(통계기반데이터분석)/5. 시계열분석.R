### [실습 1] 차분
# diff() 함수로 간단히 차분
n <- head(Nile)
n

# 1차 차분
n.diff1 <- diff(n, differences = 1)
n.diff1

# 2차 차분
n.diff2 <- diff(n, differences = 2)
n.diff2

### [실습 2] 자기회귀 누적이동평균 모델
# forecast 패키지의 auto.arima() 함수를 사용하여 적절한 p,d,q인자 결정
# (1)forecast 패키지 설치
install.packages("forecast") # forecast 패키지 설치
library(forecast)

# (2)다음으로 auto.arima() 함수를 이용하여 Nile 시계열 데이터의 ARIMA 모델의 p,d,q 인자 추정
auto.arima(Nile)

# (3)arima() 함수의 첫 번째 매개인자에는 시계열 데이터인 Nile을, 두 번째 매개인자에는 앞서 
# 추정한 p = 1, d= 1, q= 1값을 order 매개변수의 값으로 전달하여 ARIMA(1,1,1)모델 생성
Nile.arima <- arima(Nile, order = c(1,1,1))
Nile.arima

# (4)마지막으로 앞서 생성한 모델로 미래 수치를 예측하는 예를 살펴본다. H = 5는 5개 년도를 예측한다는 의미
forecast(Nile.arima, h = 5)

plot(forecast(Nile.arima, h=5))


### [실습 3] 분해시계열
# Ideaths 데이터 분해하여 분석해보기
# (1) R에 내장되어 있는 ldeaths 데이터를 선그래프로 확인해보면 다음과 같다.
plot(ldeaths)

# (2) ldeaths 시계열 데이터를 decompose() 함수로 분해하여 그래프로 표현
ldeaths.decomp <- decompose(ldeaths)
plot(ldeaths.decomp)

# (3) 추세요인(trend)만 따로 확인
ldeaths.decomp.trend <- ldeaths.decomp$trend
plot(ldeaths.decomp.trend)

# (4) 계절성(seasonality)만 따로 확인
ldeaths.decomp.seasonal <- ldeaths.decomp$seasonal
plot(ldeaths.decomp.seasonal)