# pridict/urls.py
from django.urls import path
from .views import PredictView

urlpatterns = [
    path('', PredictView.as_view(), name='predict'),
    # path('predict-form/', predict_form, name='predict_form'),  # No need for as_view() here
]
