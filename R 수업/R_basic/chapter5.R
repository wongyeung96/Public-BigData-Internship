# 실습 (5)

# head() 함수
head(Orange)   # 첫번째 행부터 6번째 행까지 추출

head(Orange,3) # 첫번째~ 3번째 행 추출출

# tail() 함수
tail(Orange)
tail(Orange,3)

# str() 함수 : 데이터의 구조를 파악
str(Orange)

# summary() 함수 : 수치형 데이터의 각 컬럼 별 최소값, 1사분위수, 중앙값, 등을 구할 수 있따.
summary(Orange)
# 범주형 데이터의 경우는 각 범주별로 관측치 개수를 구할 수 있다.

# CSV 파일 불러오기
address ="C:/Users/user/Desktop/R/R_pjt/R_basic/R_basic(코드,데이터)/R_basic/data/"
nhis <- read.csv("C:/Users/user/Desktop/R/R_pjt/R_basic/R_basic(코드,데이터)/R_basic/data/NHIS_OPEN_GJ_EUC-KR.csv")
head(nhis)

# CSV 파일 불러오기
# 에러가 발생한다면, 문자의 인코딩 문제일 수 있다.
nhis <- read.csv("C:/Users/user/Desktop/R/R_pjt/R_basic/R_basic(코드,데이터)/R_basic/data/NHIS_OPEN_GJ_EUC-KR.csv",fileEncoding="EUC-KR")
nhis <- read.csv("C:/Users/user/Desktop/R/R_pjt/R_basic/R_basic(코드,데이터)/R_basic/data/NHIS_OPEN_GJ_UTF-8.csv",fileEncoding="UTF-8")

sample <- read.csv("C:/Users/user/Desktop/R/R_pjt/R_basic/R_basic(코드,데이터)/R_basic/data/sample.csv",header=F,fileEncoding="EUC-KR",stringsAsFactor = TRUE)
sample


# 엑셀 파일 불러오기
install.packages('openxlsx') # openxlsx 패키지 설치
library(openxlsx)

nhis_sheet1 = read.xlsx("C:/Users/user/Desktop/R/R_pjt/R_basic/R_basic(코드,데이터)/R_basic/data/NHIS_OPEN_GJ_EUC-KR.xlsx")
# 디폴트로 엑셀 파일의 첫번째 sheet를 읽음.

nhis_sheet2 = read.xlsx("C:/Users/user/Desktop/R/R_pjt/R_basic/R_basic(코드,데이터)/R_basic/data/NHIS_OPEN_GJ_EUC-KR.xlsx",sheet=2)

# 빅데이터 파일 불러오기
install.packages('data.table') # data.table 패키지 설치
library(data.table) # 패키지 불러오기

nhis_bigdata =fread("C:/Users/user/Desktop/R/R_pjt/R_basic/R_basic(코드,데이터)/R_basic/data/NHIS_OPEN_GJ_BIGDATA_UTF-8.csv",
                    encoding="UTF-8")
str(nhis_bigdata)

### 데이터 추출
# 행 제한
Orange[1,]  # 1행만 추출출
Orange[1:5,]
Orange[6:10,]
Orange[c(1,5),]
Orange[-c(1:29),]

# 데이터를 비교하여 행 제한
Orange[Orange$age == 118,] # age 컬럼의 데이터가 118인 행만 추출출
Orange[Orange$age %in% c(118,484),]
Orange[Orange$age >= 1372,]

# 열이름을 이용한 열 제한
Orange[, "circumference"]

Orange[1, c("Tree","circumference")]

# 열 인덱스를 이용한 열 제한
Orange[,1]
Orange[,c(1,3)]
Orange[,c(1:3)]
Orange[,-c(1,3)]

# 행과 열 제한
Orange[1:5, "circumference"]

# Tree 열이 3 또는 2인 행의 Tree 열과 circumference 열 추출
Orange[Orange$Tree %in% c(3,2), c("Tree","circumference")]

# 정렬 order()
OrangeT1 <- Orange[Orange$circumference < 50,]
OrangeT1[order(OrangeT1$circumference),]

# 내림차순 정렬은 order() 안에 마이너스(-) 기호 사용
OrangeT1[order(-OrangeT1$circumference),]

# 그룹별 집계
# Tree별 circumference 평균
aggregate(circumference ~ Tree, Orange, mean)

# 데이터 병합(merge(), cbind())
stu1 <- data.frame(no=c(1,2,3),midterm = c(100,90,80))
stu2 <- data.frame(no=c(1,2,3),finalterm = c(100,90,80))
stu3 <- data.frame(no=c(1,4,5),quiz = c(99,88,77))
stu4 <- data.frame(no=c(4,5,6),midterm = c(99,88,77))

# merge()는 병합 대상 데이터프레임들의 동일 컬럼명의 동일 데이터 행끼리
#병합한다.
merge(stu1,stu2)
merge(stu1,stu3) #동일하지 않은 행이 있으면 제외

merge(stu1,stu3,all=TRUE) # all=TRUE 옵션을 사용하면 동일 컬럼끼리 값이 일치하지 않는 행도 병합 결과에 포함된다.

# rbind()는 행을 합친다. 이때 두 데이터프레임의 컬럼명이 동일해야 한다.
rbind(stu1, stu4)

# cbind()는 단순히 컬럼을 합친다.
cbind(stu1,stu2)
