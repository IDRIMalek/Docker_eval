import pandas as pd
import numpy as np
import joblib
from sklearn.model_selection import train_test_split
from sklearn.preprocessing import StandardScaler
from sklearn.metrics import classification_report,balanced_accuracy_score, f1_score
from sklearn.svm import SVC
from sklearn.neighbors import KNeighborsClassifier
from imblearn.ensemble import BalancedRandomForestClassifier
from imblearn.over_sampling import SMOTE
from imblearn.under_sampling import RandomUnderSampler
from imblearn.combine import SMOTEENN


output = '''
============================
    {model_name}
============================
request done at "/Model1"
Model result:
score : 
{score}
classification report : 
{classification_report}

'''

# Import data:
df = pd.read_csv('datasets/churn.csv')

#dictionnaire des models
models={}

# Data cleaning:
df_clean = df.copy()
df_clean=df_clean.drop(columns=['customerID'])
df_clean.TotalCharges = pd.to_numeric(df_clean.TotalCharges, errors = 'coerce')
df_clean['TotalCharges'] = df_clean['TotalCharges'].fillna(0)
for key,col in enumerate(df_clean.loc[:, df_clean.dtypes == object]):
    df_clean[col].replace(df_clean[col].unique(),list(range(0,len(df_clean[col].unique()))),inplace=True)

# Data separation for modelisation:
X = df_clean.drop("Churn", axis = 1)
y = df_clean.Churn


# Data standardisation:
scaler=StandardScaler()
X_scaled_=scaler.fit(X).transform(X)
X_scaled=pd.DataFrame(scaler.fit(X).transform(X))
X_scaled_unbalaleced, y_unbalaleced = X_scaled, y 

# Data splitting:
X_train, X_test, y_train, y_test = train_test_split(X_scaled, y, test_size = 0.2, random_state = 42,shuffle=True, stratify=y)

# KNeighborsClassifier Model:
model_name = "KNeighborsClassifier Model"
knn = KNeighborsClassifier()
knn.fit(X_train, y_train)
knn_predictions = knn.predict(X_test)
knn_score = knn.score(X_test, y_test)
knn_classification_report = classification_report(y_test, knn_predictions)
#knn_output = output.format(model = knn ,model_name = model_name,score = knn_score,classification_report=knn_classification_report)
models['knn']={"model": knn, "score":knn_score,"classification_report": knn_classification_report}

# SVM Model:
model_name = "SVM Model"
svm_clf = SVC()
svm_clf.fit(X_train, y_train)
svm_clf_predictions = svm_clf.predict(X_test)
svm_clf_score = svm_clf.score(X_test, y_test)
svm_clf_classification_report = classification_report(y_test, svm_clf_predictions)
#svm_output = output.format(model=svm_clf, model_name = model_name,score = svm_clf_score,classification_report=svm_clf_classification_report)
models['svm_clf']={"model": svm_clf, "score":svm_clf_score,"classification_report": svm_clf_classification_report}

# BalancedRandomForestClassifier Model
model_name = "BalancedRandomForestClassifier Model"
brf = BalancedRandomForestClassifier(n_estimators=100, random_state=42)
brf.fit(X_train, y_train)
predictions = brf.predict(X_test)
brf_accuracy = balanced_accuracy_score(y_test, predictions)
brf_class_report = classification_report(y_test, predictions)
#brf_output = output.format(model = brf, model_name = model_name,score = brf_accuracy,classification_report=brf_class_report)
models['brf']={"model": brf, "score":brf_accuracy,"classification_report": brf_class_report}


#SMOTE & ADASYN
model_name = "brf + SMOTE & ADASYN Model"
X_resampled, y_resampled = SMOTE(random_state=42).fit_resample(X_scaled_unbalaleced, y_unbalaleced)
X_train, X_test, y_train, y_test = train_test_split(X_resampled, y_resampled, test_size = 0.2, random_state = 42, shuffle=True, stratify=y_resampled)
##brf = BalancedRandomForestClassifier(n_estimators=100, random_state=42) 
brfsa = brf
brfsa.fit(X_train, y_train)
predictions = brf.predict(X_test)
smote_score = balanced_accuracy_score(y_test, predictions)
##pd.crosstab(y_test, predictions, rownames=['True'], colnames=['Predicted'])
smote_class_report = classification_report(y_test, predictions)
#smote_output = output.format(model= brfsa , model_name = model_name,score = smote_score,classification_report=smote_class_report)
models['brfsa']={"model": brfsa, "score":smote_score,"classification_report": smote_class_report}


#Sous-échantillonnage aléatoire
model_name = "RandomUnderSampler Model"
X_resampled_under, y_resampled_under = RandomUnderSampler(random_state=123).fit_resample(X_scaled_unbalaleced, y_unbalaleced)
X_train, X_test, y_train, y_test = train_test_split(X_resampled_under, y_resampled_under, test_size = 0.2, random_state = 42, shuffle=True, stratify=y_resampled_under)
##brf = BalancedRandomForestClassifier(n_estimators=100, random_state=42)
brfrus=brf
brfrus.fit(X_train, y_train)
predictions = brf.predict(X_test)
RUS_score = balanced_accuracy_score(y_test, predictions)
#pd.crosstab(y_test, predictions, rownames=['True'], colnames=['Predicted'])
RUS_class_report = classification_report(y_test, predictions)
#RUS_output = output.format(model=brfrus, model_name = model_name,score = RUS_score,classification_report=RUS_class_report)
models['brfrus']={"model": brfrus, "score":RUS_score,"classification_report": RUS_class_report}


#Suréchantillonnage suivi d'un sous-échantillonnage
model_name = "SMOTEENN Model"
X_resampled_smoteenn, y_resampled_smoteenn = SMOTEENN(random_state=123).fit_resample(X_scaled_unbalaleced, y_unbalaleced)
X_train, X_test, y_train, y_test = train_test_split(X_resampled_smoteenn, y_resampled_smoteenn, test_size = 0.2, random_state = 42, shuffle=True, stratify=y_resampled_smoteenn)
##brf = BalancedRandomForestClassifier(n_estimators=100, random_state=42)
brfsm=brf
brfsm.fit(X_train, y_train)
predictions = brf.predict(X_test)
smoteenn_score = balanced_accuracy_score(y_test, predictions)
#pd.crosstab(y_test, predictions, rownames=['True'], colnames=['Predicted'])
smoteenn_class_report = classification_report(y_test, predictions)
#smoteenn_output = output.format(model=brfsm,model_name = model_name,score = smoteenn_score,classification_report=smoteenn_class_report)
models['brfsm']={"model": brfsm, "score":smoteenn_score,"classification_report": smoteenn_class_report}

with open("models.bin", 'wb') as fichier:
    joblib.dump(models, fichier)