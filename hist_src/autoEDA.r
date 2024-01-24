# Auto EDA 예제 코드 

#### 1. 환경 설정 #### 
sessionInfo()
.libPaths()

libpath <- "C:/Program Files/R/R-4.3.1/library"
.libPaths(libpath)

getwd()
setwd("D:/CBM")

.libPaths()

install.packages("reticulate")


# 데이터 불러오기
library(reticulate)
list.files()

# Load the pickle file
my_df <- py_load_object("combined_df.pkl", pickle = "pickle", convert = TRUE)

ls(search()[2])

# Convert the Python object to an R object
my_df <- py_to_r(my_df)

# Display the first few rows of the data frame
head(my_df)


##----------------------------------------------------------------------------##
library("reticulate")
py_install("pandas")
# On Windows 10 I was asked to install conda (package manager), which I did.

py_install("pickle") # Not sure this line is needed - pickle may be built-in

source_python("read_pickle.py")
df <- read_pickle_file("combined_df.pkl")

df




#### 2. AutoEDA package 활용 #### 

# Which libraries we can use?
# -  In R, we can use these libraries:
# 
#    "dataMaid"
#    "DataExplorer"
#    "SmartEDA"


#### 2.1 dataMaid package 활용 #### 
# install.packages("dataMaid")
library(dataMaid)

# html 형태로 아웃풋 파일 생성
makeDataReport(my_df, output = "html", replace = TRUE)


#### 2.2 DataExplorer package 활용 #### 
# install.packages("DataExplorer")
library(DataExplorer)

# 리포트 생성
create_report(df[ ,-c(2)])

head(subset(df, subset = `경찰서명` != "ETC"))


df_exp <- subset(df, subset = `경찰서명` != "ETC")

create_report(df_exp[,-c(2)],
              output_file = "report2.html")


df


#### 2.3 SmartEDA package 활용 #### 
# 라이브러리 설치 SmartEDA
# install.packages("SmartEDA")
library(SmartEDA) 

# use ExpReport
ExpReport(df, op_file = 'SmartEDA_df.html')







