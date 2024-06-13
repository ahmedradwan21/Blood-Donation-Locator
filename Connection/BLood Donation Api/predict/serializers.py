# pridict/serializers.py
from rest_framework import serializers

class PredictSerializer(serializers.Serializer):
    Blood_Pressure_Abnormality = serializers.IntegerField()
    Level_of_Hemoglobin = serializers.FloatField()
    Age = serializers.IntegerField()
    BMI = serializers.FloatField()
    Sex = serializers.IntegerField()
    Pregnancy = serializers.IntegerField()
    Smoking = serializers.IntegerField()
    Chronic_kidney_disease = serializers.IntegerField()
    Adrenal_and_thyroid_disorders = serializers.IntegerField()

