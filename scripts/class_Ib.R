#Current Directory
getwd()
#Create Subfolder of raw_data, clean_data, scripts, results or Tasks, plots etc

dir.create("raw_data")
dir.create("clean_data")
dir.create("scripts")
dir.create("results")
dir.create("plots")

# ---------------------------------------------------------------------------
# load the dataset 
data<-read.csv(file.choose())
# Inspect the structure of the dataset 
str(data)
#Identify incorrect data types
# patient_id should be character/factor
# age should be numeric/integer
# gender should be factor
# diagnosis should be factor
# bmi should be numeric
# smoker should be factor
#  Convert variables to appropriate data types
data$patient_id <- as.factor(data$patient_id)  # or keep as character if unique IDs
data$age <- as.integer(data$age)
data$gender <- as.factor(data$gender)
data$diagnosis <- as.factor(data$diagnosis)
data$bmi <- as.numeric(data$bmi)
data$smoker <- as.factor(data$smoker)

# Create binary variable for smoker
data$smoker_binary <- ifelse(data$smoker == "Yes", 1, 0)

# Check final structure
str(data)

# ---------------------------------------------------------------------------
#Save cleaned dataset
write.csv(data, file = "clean_data/patient_info_clean.csv", row.names = FALSE)

