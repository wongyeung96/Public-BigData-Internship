### [실습] 주성분분석 : princomp()
# princomp() 함수로 간단히 주성분분석 수행
# cor = TRUE : 상관행렬
# cor = FALSE : 공분산행렬(디폴트)

# 아이리스 데이터 중 꽃받침 길이(Sepal.Length),꽃받침 폭(Sepal.Width), 
# 꽃잎 길이(Petal.Length), 꽃잎 폭(Petal.Width)변수의 데이터로 주성분분석을 수행한다.
fit <- princomp(iris[,1:4],cor=TRUE) # 상관행렬 이용한 주성분분석 수행
# 결과를 fit에 저장

### [실습] 주성분분석 : summary()
summary(fit) # 주성분분석 결과 요약 출력

# summary() 함수는 각 주성분의 표준편차, 분산 비율(Proportion of Variance),
# 누적기여율/비율(Cumulative Proportion)을 보여준다.

### [실습] 주성분분석 : loading()
# loadings() 함수로 각 주성분의 로딩 벡터를 구하는 예
loadings(fit)

### [실습] 주성분 개수 선택법 - 스크리 그래프
## 스크리그래프(Scree Plot): 주성분의 상대적인 중요도 시각화
## 고유값(eigenvalue)이 수평을 유지하기 전단계로 주성분의 수를 결정 가능
screeplot(fit,type="lines",main="scree plot")
