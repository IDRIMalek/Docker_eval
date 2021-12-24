import uvicorn
import json
import secrets

from fastapi import Depends, FastAPI, HTTPException, status
from fastapi.security import HTTPBasic, HTTPBasicCredentials
from fastapi.responses import JSONResponse
import pandas as pd
from typing import Optional
from pydantic import BaseModel
import joblib
from sklearn.preprocessing import StandardScaler
import numpy  as np
#from imblearn.over_sampling import SMOTE
#from imblearn.under_sampling import RandomUnderSampler
#from imblearn.combine import SMOTEENN


app = FastAPI()

security = HTTPBasic()


class Feature(BaseModel):
    gender: str
    SeniorCitizen: int
    Partner: str
    Dependents: str
    tenure: int
    PhoneService: str
    MultipleLines: str
    InternetService: str
    OnlineSecurity: str
    OnlineBackup: str
    DeviceProtection: str
    TechSupport: str
    StreamingTV: str
    StreamingMovies: str
    Contract: str
    PaperlessBilling: str
    PaymentMethod: str
    MonthlyCharges: float
    TotalCharges:float


users_db = {
    "alice": "wonderland",
    "bob": "builder",
    "clementine": "mandarine"
}


def get_current_username(credentials: HTTPBasicCredentials = Depends(security)):
    correct_username = True if credentials.username in users_db else False
    print("username", credentials.username)
    print("password", credentials.password)
    print("correct_username", correct_username)
    correct_password = False
    if (correct_username):
        correct_password = secrets.compare_digest(credentials.password, users_db[credentials.username])
        print("correct_password", correct_password)
    if not (correct_username and correct_password):
        raise HTTPException(
            status_code=status.HTTP_401_UNAUTHORIZED,
            detail="Incorrect email or password",
            headers={"WWW-Authenticate": "Basic"},
        )
    return credentials.username


def log_admin(credentials: HTTPBasicCredentials = Depends(security)):
    correct_username = secrets.compare_digest(credentials.username, "admin")
    correct_password = secrets.compare_digest(credentials.password, "4dm1N")
    if not (correct_username and correct_password):
        raise HTTPException(
            status_code=status.HTTP_401_UNAUTHORIZED,
            detail="Incorrect email or password",
            headers={"WWW-Authenticate": "Basic"},
        )
    return credentials.username


@app.get('/')
def get_index():
    return {'data': 'hello world'}


@app.get('/status')
def get_status():
    return {
        'status': 'ready'
    }

@app.get("/users/me")
def read_current_user(username: str = Depends(get_current_username)):
    return {"username": username}


@app.post('/models/{model:str}')
def post_(feature:Feature, model: str, username: str = Depends(get_current_username)):
    """
    Models \n
    **knn**: KNeighborsClassifier </br>
    **svm_clf**: SVM Model </br>
    **brf** : BalancedRandomForestClassifier </br>
    **brfsa** : BalancedRandomForestClassifier + réquilibrage (SMOTE & ADASYN) </br>
    **brfrus**: BalancedRandomForestClassifier + réquilibrage (RandomUnderSampler) </br>
    **brfsm** : BalancedRandomForestClassifier + réquilibrage (SMOTEENN) </br>
    
    Exemple: </br>
    
    { </br>
        "gender": "Female", </br>
        "SeniorCitizen": 0, </br>
        "Partner": "No", </br>
        "Dependents": "No", </br>
        "tenure": 44, </br>
        "PhoneService": "Yes", </br>
        "MultipleLines": "No", </br>
        "InternetService": "Fiber optic", </br>
        "OnlineSecurity": "No", </br>
        "OnlineBackup": "Yes", </br>
        "DeviceProtection": "Yes", </br>
        "TechSupport": "No", </br>
        "StreamingTV": "Yes", </br>
        "StreamingMovies": "No", </br>
        "Contract": "Month-to-month", </br>
        "PaperlessBilling": "Yes", </br>
        "PaymentMethod": "Credit card (automatic)", </br>
        "MonthlyCharges": 88.15, </br>
        "TotalCharges": 3973.2 </br>
    } </br>
    
    This exemple should return "Churn = No"
    
    Exemple2: </br>
    
    {	</br>
        "gender": "Male",	</br>
        "SeniorCitizen":0, </br>
        "Partner": "Yes",	</br>
        "Dependents":"No",	</br>
        "tenure": 14,	</br>
        "PhoneService": "No",	</br>
        "MultipleLines": "No", </br>
        "InternetService":"phone service", </br>
        "InternetService":"DSL",	</br>
        "OnlineSecurity":"No",	</br>
        "OnlineBackup": "No",	</br>
        "DeviceProtection":"No"	,</br>
        "TechSupport":"No",	</br>
        "StreamingTV":"Yes"	,</br>
        "StreamingMovies":"Yes"	,</br>
        "Contract": "Month-to-month",	</br>
        "PaperlessBilling":"No" ,</br>
        "PaymentMethod": "Electronic check"	,</br>
        "MonthlyCharges": 46.35	,</br>
        "TotalCharges": 667.7	</br>
    }

    This exemple should return "Churn = Yes"
    """
    
    new_feature= {
        "gender": feature.gender,
        "SeniorCitizen": feature.SeniorCitizen,
        "Partner": feature.Partner,
        "Dependents": feature.Dependents,
        "tenure": feature.tenure,
        "PhoneService": feature.PhoneService,
        "MultipleLines": feature.MultipleLines,
        "InternetService": feature.InternetService,
        "OnlineSecurity": feature.OnlineSecurity,
        "OnlineBackup": feature.OnlineBackup,
        "DeviceProtection": feature.DeviceProtection,
        "TechSupport": feature.TechSupport,
        "StreamingTV": feature.StreamingTV,
        "StreamingMovies": feature.StreamingMovies,
        "Contract": feature.Contract,
        "PaperlessBilling": feature.PaperlessBilling,
        "PaymentMethod": feature.PaymentMethod,
        "MonthlyCharges": feature.MonthlyCharges,
        "TotalCharges": feature.TotalCharges
    } 
 
    df = pd.read_csv('datasets/churn.csv')
    
    indexfeature=df.shape[0]+1
    df=df.append(pd.DataFrame([new_feature], index=[indexfeature],columns=df.columns))
    df_clean = df.copy()
    df_clean=df_clean.drop(columns=['customerID'])

    df_clean.TotalCharges = pd.to_numeric(df_clean.TotalCharges, errors = 'coerce')
    df_clean['TotalCharges'] = df_clean['TotalCharges'].fillna(0)
    for key,col in enumerate(df_clean.loc[:, df_clean.dtypes == object]):
        df_clean[col].replace(df_clean[col].unique(),list(range(0,len(df_clean[col].unique()))),inplace=True)

    # Data separation for modelisation:
    X = df_clean.drop("Churn", axis = 1)

    # Data standardisation:
    scaler=StandardScaler()
    X_scaled=pd.DataFrame(scaler.fit(X).transform(X))

    #Chargement des models
    with open('models.bin', 'rb') as fichier:
         models= joblib.load(fichier)
         
    #Vérification de la présence du model souhaité
    if model in models.keys(): 
        X_new_feature=X_scaled.iloc[indexfeature-1]        
        X_new_feature=X_new_feature.values.reshape(1,-1)
        if models[model]["model"].predict(X_new_feature).tolist()[0]==1: 
            result='Churn = Yes '
        else :
            result='Churn = No '
        return result
    else: 
        return 'model introuvable'

if __name__ == "__main__":
    uvicorn.run("api:app", host="0.0.0.0", port=8000, reload=True, log_level="info")
