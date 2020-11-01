library("foreign")
library("dplyr")
library("ggplot2")

# 한국복지패널데이터 불러오기
raw_welfare <- read.spss(file = "data/Koweps_hpc10_2015_beta1.sav",
                         to.data.frame = T)
welfare <- raw_welfare

head(welfare)

# 변수명 바꾸기
welfare <- rename(welfare,
                  income = p1002_8aq1,
                  code_region7 = h10_reg7,
                  code_region5 = h10_reg5)

# 월급 변수 검토 및 전처리
class(welfare$income)
summary(welfare$income)

welfare$income <- ifelse(welfare$income %in% c(0, 9999), NA, welfare$income)
table(is.na(welfare$income))

# 지역 변수 검토 및 전처리
class(welfare$code_region7)
table(welfare$code_region7)
list_region7 <- data.frame(code_region7 = c(1:7),
                          region7 = c("서울",
                                     "수도권(인천/경기)",
                                     "부산/경남/울산",
                                     "대구/경북",
                                     "대전/충남",
                                     "강원/충북",
                                     "광주/전남/전북/제주도"))
list_region7

class(welfare$code_region5)
table(welfare$code_region5)
list_region5 <- data.frame(code_region5 = c(1:5),
                           region5 = c("서울",
                                      "광역시",
                                      "시",
                                      "군",
                                      "도농복합군"))
list_region5

welfare <- left_join(welfare, list_region7, id = "code_region7")
welfare <- left_join(welfare, list_region5, id = "code_region5")
welfare %>% 
  select(code_region7, region7) %>% 
  head(20)
welfare %>% 
  select(code_region5, region5) %>% 
  head(20)

# 지역별 월급 평균표
region7_income <- welfare %>% 
  filter(!is.na(income)) %>% 
  group_by(region7) %>% 
  summarise(mean_income = mean(income)) %>% 
  arrange(desc(mean_income))
region7_income

region5_income <- welfare %>% 
  filter(!is.na(income)) %>% 
  group_by(region5) %>% 
  summarise(mean_income = mean(income)) %>% 
  arrange(desc(mean_income))
region5_income

# 그래프
ggplot(data = region7_income, aes(x = reorder(region7, mean_income), y = mean_income)) +
  geom_col() +
  coord_flip()

ggplot(data = region5_income, aes(x = reorder(region5, mean_income), y = mean_income)) +
  geom_col()
