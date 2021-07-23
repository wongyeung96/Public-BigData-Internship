# 실습(2)

age <- 20 # age 변수에 20을 저장하기
age       # age 변수에 저장된 데이터를 불러오기

age <- 30 # 저장되어 있던 20이 30으로 수정됨
age       # age 변수에 저장된 데이터를 불러오기


# 숫자(Numeric) 타입
age <- 20 # age 변수에 20을 저장
class(age)# 데이터 타입 확인

age <- 20L # L을 붙이면 정수(소수점 제외)
class(age)

# 문자(character) 타입
name <- "LJI"# 또는 name <- 'LJI'
class(name)  # 데이터  타입 확인

# 논리(logical) 타입
is_effective <- TRUE  # is_effective <- T와 동일
is_effective

is_effective <- FALSE # is_effective <- F와 동일
is_effective

class(is_effective) # 데이터 타입 확인

# 펙터(factor) 타입
# ("서울","부산","제주")의 전체 범주(factor) 중 "서울" 저장
sido <- factor("서울",c("서울","부산","제주"))
sido

class(sido) # 데이터 타입 확인

levels(sido) # 전체 범주(category) 확인 

# NULL과  NA
a <- NULL
jumsu <- c(NA, 90,100) # 첫 번째 값에 NA 저장

# Inf(무한대 실수 의미 상수)와 NaN(Not a Number의미 상수)
10/0 #Inf
0/0  #NaN
