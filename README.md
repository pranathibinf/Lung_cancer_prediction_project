# Lung Cancer Prediction Project

# Project Overview
This project involves building a logistic regression model to predict lung cancer based on various clinical and demographic features. The dataset includes attributes like gender, age, smoking habits, and several other symptoms.

# Data Description
The dataset contains the following columns:
GENDER: Gender of the patient
AGE: Age of the patient
SMOKING, YELLOW_FINGERS, ANXIETY, PEER_PRESSURE, CHRONIC DISEASE, etc.: Various clinical and demographic features
LUNG_CANCER: Whether the patient has lung cancer (target variable)

# Methodology
The project follows these steps:
Data Loading and Preprocessing
Data Splitting into Training and Testing sets
Model Fitting using Logistic Regression
Model Evaluation
Feature Selection using Stepwise AIC
Class Imbalance Handling using ROSE
Regularization with Lasso
Cross-Validation

# Personal Observations and Further Exploration Suggestions for the Lung Cancer Prediction Project:
## Data Loading and Preprocessing
I successfully loaded the dataset and transformed categorical variables into factors. This step was crucial for the correct application of logistic regression. I ensured there were no missing or improperly formatted values, which could impact the model's performance.

## Data Splitting
I split the data into training and test sets, ensuring both sets were representative of the overall dataset. This division is vital for an unbiased evaluation of my model.

## Model Fitting
I fitted a logistic regression model to the training data. I made sure the model converged and the resulting coefficients were interpretable. However, I was cautious about potential overfitting.

## Model Evaluation
The initial model showed high accuracy but lower sensitivity. This indicated a potential issue in correctly identifying positive cases, which is critical in medical diagnostics. I then evaluated the model against standard medical performance thresholds.

## Feature Selection
Using stepwise AIC, I simplified the model by removing less significant features. While this improved model simplicity, I checked to ensure no clinically significant predictors were omitted.

## Class Imbalance Handling
I addressed class imbalance using oversampling. It was crucial to check that the synthetic samples did not introduce bias and that the model's sensitivity improved on this balanced dataset.

## Regularization and Cross-Validation
I attempted Lasso regularization but encountered warnings, indicating potential data issues. After resolving these, I re-applied regularization to improve model generalization. Additionally, I used 10-fold cross-validation to confirm the model's consistency and robustness.

## Further Steps one can take with this dataset:
Alternative Models and Ensemble Methods
Feature Engineering
External Validation
Longitudinal Analysis
Patient Stratification
Deep Learning Approaches
Integration with Clinical Decision Systems

This project has been a comprehensive exercise in applying machine learning to a critical healthcare domain. The potential to extend and enhance this work is vast, and it could significantly impact patient outcomes if developed and validated carefully.

# Dependencies
R and RStudio
Packages: dplyr, caret, pROC, MASS, ROSE, glmnet

# Instructions for Running the Code
1. Replace <path_to_dataset> with the actual path to your dataset in the code.
2. Ensure all required packages are installed and loaded.
3. Run the script in RStudio.
   
# Contact
Name: Pranathi Limmala
Email: pranathilimmala@gmail.com
