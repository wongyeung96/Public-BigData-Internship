### 4.1 산점도 그래프
## 산점도 그래프(scatter plot): 변수와 변수 간의 관계 시각화에 유용한 그래프
A_salary <- c(25,28,50,60,30,35,40,70,40,70,40,100,30,30) 
B_salary <- c(20,40,25,25,35,25,20,10,55,65,100,100,150,300)

A_hireyears <- c(1,1,5,6,3,3,4,7,4,7,4,10,3,3)
A <- data.frame(salary <- A_salary, hireyears <- A_hireyears)

# 산점도 그래프
plot(A$hireyears,A$salary,xlab= "근무년수",ylab="연봉(백만원단위)")

# pairs()함수 : 여러 가지 변수의 산점도 그래프를 한눈에 볼 수 있도록 작성
pairs(iris[,1:4], main= "iris data")

### 4.2 상관계수
## 상관계수 : 변수 간의 관련성을 수치로 계산
# 가장 많이ㅡ사용하는 계산법 -> 피어슨 상관계수
## 상관계수 - cor()
cor(A$hireyears,A$salary)

### 4.3 상관행렬
## 상관행렬(Correlation Matrix Heatmap) : 여러 변수 간의 상관계수 값을오 생성한 행렬
# 상관행렬
cor(iris[,1:4])

### 4.4 상관행렬 히트맵
# 상관행렬 히트맵
heatmap(cor(iris[,1:4]))