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
                  code_region = h10_reg7)

# 월급 변수 검토 및 전처리
class(welfare$income)
summary(welfare$income)

welfare$income <- ifelse(welfare$income %in% c(0, 9999), NA, welfare$income)
table(is.na(welfare$income))

# 지역 변수 검토 및 전처리
class(welfare$code_region)
table(welfare$code_region)
list_region <- data.frame(code_region = c(1:7),
                          region = c("서울",
                                     "수도권(인천/경기)",
                                     "부산/경남/울산",
                                     "대구/경북",
                                     "대전/충남",
                                     "강원/충북",
                                     "광주/전남/전북/제주도"))
list_region

welfare <- left_join(welfare, list_region, id = "code_region")
welfare %>% 
  select(code_region, region) %>% 
  head(20)

# 지역별 월급 평균표
region_income <- welfare %>% 
  filter(!is.na(income)) %>% 
  group_by(region) %>% 
  summarise(mean_income = mean(income)) %>% 
  arrange(desc(mean_income))
region_income

# 그래프
ggplot(data = region_income, aes(x = reorder(region, mean_income), y = mean_income)) +
  geom_col() +
  coord_flip()
