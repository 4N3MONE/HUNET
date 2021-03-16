library(data.table)
library(wordcloud2)
getwd()
setwd('C:\\tmp\\크롤링')



data1 <- read.csv("nouns_개발.csv")



data1 <- data1[,-1]
head(data1,5)

summary((data1))
wordcount <- table(data1)

head(sort(wordcount, decreasing=T),100)

sub1 <- c('개발','지원', '서비스', '제공', '업무', '운영', '기술', '성장', '휴가', '사용', '이상', '환경',  '관련', '이해',
          '기반', '플랫폼', '근무', '시간', '건강', '기업', '코드', '채용', '회사', '진행', '지급', '시스템', '문화', '교육', '경력',
          '테스트', '투자', '분석', '필요', '활용', '관리', '최고', '동료', '사람', '고객', '사내','경험', '개선', '문제',
          '설계', '제품', '검진', '시장','제도', '능력', '도서', '서류', '인터뷰', '해결', '업', '분야', '.ly', '구성원', '장비', '역량',
          '개인', '.com', '만원',  '본인', '면접', '직원', '직무', '이력서', '혁신', '가치', '보유', '스타트', '공유', '글로벌',
          '이용', '선정', '효율', '제출', '관심', '성과', '야근', '적극', '전형', '지식', '조직', '프로세스', '근속', '노력', '지속'
          , '선물', '제한', '출퇴근', '자율', '자유', '기능', '세계', '복지', '집중', '커피', '명절', '작성', '점심', '퇴근', '팀원',
          '목표', '공간', '국내', '세미나', '연차', '도전', '소통', '과정', '세상', '안정', '출근', '기간', '기본', '기획', '식사', '보험',
          '온라인', '인프라', '컨퍼런스', '고민', '실무', '원티드', '참여', '최신', '출시', '생각', '적용', '간식', '바탕', '언어', '워크',
          '유치', '학습', '소개', '오픈', '선택', '신규', '사무실', '자신', '생일', '한국' ,'결과', '대출', '품질', '누적', '수평', '용량',
          '처리', '주도', '과제', '연구', '포함', '각종', '결정', '규모', '머신','구현', '생활', '영어', '대표', '최종','시작', '구성',
          '리뷰', '사항', '연봉', '최대', '가족', '배포', '연결', '우대', '의사', '.kr', '입사', '기회', '도움', '수준','추구', '대한민국',
          '비용', '솔루션', '아래', '원활', '저녁', '전문', '확인', '경조사', '기준', '기타', '모두', '방식', '성능', '자녀', 
          '식대', '음료', '조금', '지향', '유지', '수행' , '인재', '합격', '활동', '상품권', '수습', '추천', '할인', '방법', '비즈니스', '유급',
          '절차', '수습', '단체', '리프', '해외', '구조', '종합', '설립', '이후', '도입')
i <- 1
cnt_txt <- length(sub1)
cnt_txt
data2 = data1
for ( i in 1:cnt_txt) {data2 <- gsub((sub1[i]), "", data2)}


data2 <- gsub('모바','모바일', data2)
data2 <- gsub('모바일일','모바일', data2)
data2 <- gsub('Web','웹', data2)
data2 <- gsub('러닝','머신러닝', data2)

data3 <- Filter(function(x) {nchar(x)>1}, data2)

wordcount2<- table(data3)
wordcloud <- head(sort(wordcount2, decreasing=T),50)

wordcloud2(data = wordcloud, fontFamily = '나눔바른고딕', color = "random-dark", shape = "circle")


