# 실습(3)
## 벡터(Vector)

# 하나 이상의 데이터를 저장할 수 있는 1차원 저장 구조(1차원 배열)
students_age <- c(11,12,13,20,15,21)
students_age

class(students_age)
length(students_age)

# 인덱싱(R 인덱스는 1부터 시작)
students_age[1] # 1번 인덱스의 데이터 추출하기
students_age[3] # 3번 인덱스의 데이터 추출하기
students_age[-1] # 1번 인덱스의 데이터만 제외하고 추출하기

# 슬라이싱
students_age[1:3] # 1번부터 3번 인덱스까지의 데이터 추출하기
students_age[4:6] # 4번부터 6번 인덱스까지의 데이터 추출하기

# 벡터에 데이터 추가, 갱신
score <- c(1,2,3)
score[1] <- 10 # 1인덱스에 저장하고 있던 데이터가 10으로 갱신
score[4] <- 4 # 4인덱스에 데이터가 없으므로 신규로 데이터 4 추가
score

# 벡터의 데이터 타입
code <- c(1,12,"30") # 문자(character) 데이터 타입으로 모두 변경
class(code) # 데이터 타입 확인
code

# 순열 생성 (연속된 숫자를 생성)
data <- c(1:10) # 1부터 10까지 1씩 증가시켜 생성
data

data1 <- seq(1,10) # 1부터 10까지 1씩 증가시켜 생성
data1

data2 <- seq(1,10,by=2) # 1부터 10까지 2씩 증가시켜 생성
data2

data3 <- rep(1,times=5) # 1을 다섯 번 반복 생성
data3

data4 <- rep(1:3, each = 3) # 1부터 3을 각각 세번씩 반복 생성
data4

## 행렬(Matrix)
# 표 형태와 같은 2차원 데이터 저장 구조를 가진다.
var1 <- c(1,2,3,4,5,6)
# var1을 이용해서 2행 3열 행렬을 생성. 기본적으로 열 우선 값 채워짐
x1 <- matrix(var1, nrow=2, ncol=3)
x1

# var1을 이용해서 2열 행렬을 생성. 행의 개수는 자동 계산
x2 <- matrix(var1, ncol=2)
x2

x1[1,] # x1의 1행 모든 열
x1[,1] # x1의 모든 행 1열
x1[2,2] # x1의 2행 2열

# 행렬에 데이터 추가
# rbind()로 행 추가, cbind() 열 추가
x1
x1 <- rbind(x1,c(10,10,10)) # 행 추가
x1 <- cbind(x1,c(20,20,20)) # 열 추가
x1

## 데이터프레임(Dataframe)
no <- c(10,20,30,40,50,60,70)
age <- c(18,15,13,12,10,9,7)
gender <- c("M","M","M","M","M","F","M")

# 데이터프레임 생성 예
students <- data.frame(no,age,gender)
students

# 열의 이름과 행의 이름 확인
colnames(students) # 열 이름 확인
rownames(students) # 행 이름 확인

# 열 이름과 행 이름 수정
colnames(students) <- c("no","나이","성별") # 열이름 수정
rownames(students) <- c('A','B','C','D','E','F','G') # 행이름 수정
students

# 다시 원래의 영문 열 이름으로 수정
colnames(students) <- c("no","age","gender")
students

# 일부 데이터만 접근
# 데이터 프레임의 변수이름$열이름으로 특정 열 접근
students$no
students$age

# 대괄호 안에 열이름으로 특정 열에 접근하기
# 대괄호 안에 콤마(,)를 쓴 후 열 이름을 쓴다. 열 이름은 " " 또는 ''로 감쌈
students[,"no"]
students[,'age']

students[,1] # 첫번째 열 데이터가 모두 출력
students[,2] # 두번째 열 데이터가 모두 출력

students["A",] #A행 데이터 출력. 행 이름은 ""또는''로 감쌈
               # 행 이름 뒤에 콤마(,)를 반드시 써야함

students[2,]  # 두번째 행 데이터가 출력
              # 행 이름 뒤에 콤마(,)를 반드시 써야함

students[3,1] #  [행인덱스,열인덱스]
students["A","no"] # ["행이름", "열이름"]

# 열 데이터 추가
students$name<- c("이용","준희","이훈","서희","승희","하정","하준") # 열 추가
students

# 행 데이터 추가
students["H",] <- c(80,10,"M","홍길동") #행추가
students

## 배열(Array) : 다차원 데이터 저장 구조
var1 <- c(1:12) #벡터 생성
arr1 <- array(var1,dim=c(2,2,3)) # var1 벡터 이용 3차원 배열 생성
arr1

## 리스트(List) : 다차원 데이터 저장 구조
# 먼저 리스트에 저장할 다양한 데이터 구조를 생성
v_data <- c("02-111-2222","01022223333") # 벡터
m_data <- matrix(c(21:26),nrow=2) # 행렬
a_data <- array(c(31,36),dim=c(2,2,2)) # 배열
d_data <- data.frame(address = c("seoul","busan"), #  데이터 프레임
                     name = c("Lee","Kim"),stringsAsFactors = F)
# list(키1 = 값, 키2 = 값, ...)와 같이 키와 값 쌍으로 리스트생성
list_data <- list(name = "홍길동", # name 키에 "홍길동"값저장
                  tel = v_data,    # tel 키에 v_data
                  score1 = m_data, # score1키에 m_data
                  score2 = a_data, # score2키에 a_data
                  friends = d_data)# friends키에 d_data
list_data

list_data$name
list_data$tel
list_data[1]
