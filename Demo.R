# Check for missing values in a vector
is.na(my_vector)

# Check for missing values in a data frame
is.na(my_dataframe)

# Create a new data frame with complete rows (no missing values)
complete_data <- my_dataframe[complete.cases(my_dataframe), ]

# Remove rows with missing values from a data frame
clean_data <- na.omit(my_dataframe)

install.packages("mice")
library(mice)

# Perform multiple imputation
imputed_data <- mice(my_dataframe, m = 5) 

# Extract the completed datasets (5 in this case)
completed_datasets <- complete(imputed_data)


  
