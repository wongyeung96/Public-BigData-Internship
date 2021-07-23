# 실습 (4)

10 <= 10
10 >5
10 >= 5

n <- 20
n %in% (c(10,20,30))

n <- 10
n >= 0 & n <= 100

n <- 1000
n >= 0 | n <=100

!(10==10)

# 벡터와 스칼라의 연산
score <- c(10,20)
score +2 # score 벡터의 모든 데이터에 각각 2를 더하여 반환

score # score 벡터 자체는 변경되지 않아서 이전 값을 가지고 있음

# 연산 결과를 score 변수에 반영하려면 다음과 같이 score에 연산 결과 저장
score <- score +2 # score 벡터의 모든 데이터에 각각 2를 더하고
                  # 연산 결과를 score에 저장
score             # score가 변경된 것을 확인할 수 있음

# 벡터와 벡터의 연산산
score1 <- c(100,200)
score2 <- c(90,91)

sum_score <- score1 + score2
sum_score

diff <- score1- score2
diff

score1 <- c(100,200,300,400) # 벡터간 개수가 다를 경우
score2 <- c(90,91)           # 적은 곳이 반복

sum_score <- score1 + score2
sum_score


# 행렬과 스칼라 연산
m1 <- matrix(c(1,2,3,4,5,6),nrow=2)
m1 <- m1 * 10  # 행렬과 스칼라 곱하기 연산
m1

# 행렬과 행렬의 연산
m1 <- matrix(c(1:9),nrow=3)
m2 <- matrix(c(2,2,2,2,2,2,2,2,2),nrow=3)
m1
m2
m1+m2 #  행렬과 행렬간 더하기(+)연산


### 흐름제어문(조건문)
# if 문
score <- 95
if(score >= 80){ # 조건이 TRUE이므로 아래 문장들이 실행
    print("조건이 TRUE인 경우만 수행할 문장")
  }

# if ~else문
score <- 86
if(score >= 91){    # 이 조건의 결과는 FALSE
  print("A")        # 조건이 TRUE일 때 수행할 문장
} else {
  print("B or C or D") # 조건이 FALSE일 때 수행할 문장
}

# if ~ else if문
score <- 86
if (score >= 91) {
  print("A")
} else if (score >= 81) {  # score는 86이므로 이 조건이 TRUE
  print("B")
} else if (score >= 71) {
  print("C")
} else if (score >= 61) {
  print("D")
} else {print("F")}

# ifelse() 함수
score <- 85
ifelse(score >= 91, "A", "FALSE 일 때 수행")

# for 문
# 다음 for 문은 첫 수행 시 num에 1이 저장된다, 그 다음 1씩 증가된
# 값이 저장. num이 5가 될 때까지 { print(num) } 의 문장 반복 수행
for (num in (1:3)) {
  print(num)
}

# for 문 안에 if 문이나 다른 제어문을 중첩해서 사용할 수 있다.
for (num in (1:5)) {
  if (num %% 2 == 0)
    print(paste(num, "짝수"))
  else
    print(paste(num,"홀수"))
}



# 함수 생성
a <- function() { # a는 변수가 아닌 함수로 생성
  print("testa")
  print("testa")
}

# 함수 호출
a()

# 매개변수가 있는 함수
a <- function(num){
  print(num)
}

# num 매개변수에 20을 넘겨주고, 함수를 호출. 이때 20을 매개인자라고 부름
a(20)

# num 매개변수에 10을 넘겨주고, 함수를 호출. 이때 10을 매개인자라고 부름
a(10)

# 매개변수가 있는 함수
a <- function(num1,num2){ # 2 개의 매개변수
  print(paste(num1,'',num2))
}

a(10,20)
a(num1= 10, num2 =20)
a(num2= 20, num1 = 10)

# 리턴 데이터가 있는 함수
calculator <- function(num1, op, num2){
  result <- 0
  if (op == "+"){
    result <- num1 + num2
  } else if(op == "-"){
    result <- num1 - num2
  } else if(op == "*"){
    result <- num1 * num2
  } else if(op == "/"){
    result <- num1 / num2
  }
  return (result)
}

n <- calculator(1,"+",2) # n은 calculator()로부터 반환받은 3을 저장
print(n)

n <- calculator(1,"-",2) # n은 calculator()로부터 반환받은 3을 저장
print(n)
