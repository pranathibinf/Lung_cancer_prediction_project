# Lung Cancer Prediction Project
# Load necessary libraries
library(readr)
library(dplyr)
library(caret)
library(pROC)
library(MASS)
library(ROSE)
library(glmnet)

# Step 1: Data Loading
# Load the lung cancer dataset
data <- read.csv("<path_to_dataset>.csv")

# Step 2: Data Preprocessing
# Convert categorical variables to factors
data$GENDER <- as.factor(data$GENDER)
data$LUNG_CANCER <- as.factor(ifelse(data$LUNG_CANCER == "YES", 1, 0))
binary_columns <- colnames(data)[3:15]
data[binary_columns] <- lapply(data[binary_columns], factor, levels = c(1, 2))

# Step 3: Data Splitting
# Split data into training and testing sets
set.seed(123)
training_rows <- createDataPartition(data$LUNG_CANCER, p = 0.7, list = FALSE)
train_data <- data[training_rows, ]
test_data <- data[-training_rows, ]

# Step 4: Model Fitting
# Train a logistic regression model
logistic_model <- glm(LUNG_CANCER ~ ., data = train_data, family = "binomial")

# Step 5: Model Evaluation
# Evaluate the model on the test dataset
predictions <- predict(logistic_model, newdata = test_data, type = "response")
prediction_class <- ifelse(predictions > 0.5, 1, 0)
confusionMatrix(factor(prediction_class), test_data$LUNG_CANCER)
roc_curve <- roc(test_data$LUNG_CANCER, predictions)
auc(roc_curve)

# Step 6: Feature Selection
# Apply stepwise AIC for feature selection
stepwise_model <- stepAIC(logistic_model, direction = "both")
summary(stepwise_model)

# Step 7: Handling Class Imbalance
# Use ROSE for oversampling the minority class
data_balanced <- ovun.sample(LUNG_CANCER ~ ., data = train_data, method = "over", N = 2*sum(train_data$LUNG_CANCER == "1"), seed = 123)$data
logistic_model_balanced <- glm(LUNG_CANCER ~ ., data = data_balanced, family = "binomial")

# Step 8: Regularization
# Apply Lasso regularization
cv_model <- cv.glmnet(as.matrix(train_data[-ncol(train_data)]), train_data$LUNG_CANCER, family = "binomial")
lasso_model <- glmnet(as.matrix(train_data[-ncol(train_data)]), train_data$LUNG_CANCER, family = "binomial", lambda = cv_model$lambda.min)

# Step 9: Cross-Validation
# Perform 10-fold cross-validation
cv_results <- train(LUNG_CANCER ~ ., data = train_data, method = "glm", family = "binomial", trControl = trainControl(method = "cv", number = 10))
