# pridict/views.py
from rest_framework.generics import CreateAPIView
from rest_framework.response import Response
from rest_framework import status
from .serializers import PredictSerializer
import joblib
import numpy as np

class PredictView(CreateAPIView):
    serializer_class = PredictSerializer
    model_path = "svm_model.joblib"  

    def create(self, request, *args, **kwargs):
        logreg_model = joblib.load(self.model_path)

        serializer = self.get_serializer(data=request.data)
        serializer.is_valid(raise_exception=True)

        input_data = serializer.validated_data

        # input data for prediction
        features = [
            input_data['Blood_Pressure_Abnormality'],
            input_data['Level_of_Hemoglobin'],
            input_data['Age'],
            input_data['BMI'],
            input_data['Sex'],
            input_data['Pregnancy'],
            input_data['Smoking'],
            input_data['Chronic_kidney_disease'],
            input_data['Adrenal_and_thyroid_disorders']
        ]

        # prediction
        prediction = logreg_model.predict(np.array(features).reshape(1, -1))

        result = {'prediction': int(prediction[0])}

        return Response(result, status=status.HTTP_200_OK)
