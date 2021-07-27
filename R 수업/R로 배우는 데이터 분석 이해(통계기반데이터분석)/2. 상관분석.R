### [실습 1] 피어슨 상관계수 구하기
# 예제) Orange 데이터에서 나무의 둘레(circumference)와 나무의 나이(age)와의 피어슨 상관계수 구하기
cor(Orange$circumference, Orange$age)

### [실습 1] 피어슨 상관계수 구하기(산점도 그리기)
plot(Orange$circumference,Orange$age,col="red",pch=19)

### [실습 2] 피어슨 상관계수 구하기
# 예제) 아이리스(iris)데이터의 Sepal.Length,Sepal.Width,Petal.Length,Petal.Width 변수 간 상관계수 구하기
cor(iris[,1:4])

### [실습 3] 상관계수 검정
# 예제) 아이리스(iris)데이터의 Petal.Length 변수와 Petal.Width 변수의 피어슨 상관계수 검정의
# 예 다. cor.test() 함수의 method 매개변수의 default 값은 "pearson"이다.(method 매개변수 생략 가능)
cor.test(iris$Petal.Length, iris$Petal.Width, method="pearson")
# cor.test(첫 번째 변수, 두 번째 변수,method="spearman") # 스피어만 상관계수 검정