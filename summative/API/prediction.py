from fastapi import FastAPI
from joblib import load
from pydantic import BaseModel

class PredictionBody(BaseModel):
    PlaylistCount: float
    PlaylistReach: float
    ShazamCounts: float

app = FastAPI()

# loading my trained model
spotify_streams_model = load('spotify_streams_model.joblib')

@app.get("/")
async def hello():
    return {"Welcome to Music Insights!"}

@app.post("/predict")
async def predict(body: PredictionBody):
    input_data = [[body.PlaylistCount, body.PlaylistReach, body.ShazamCounts]]
    predicted_streams = spotify_streams_model.predict(input_data)[0]
    return {"predicted_streams": predicted_streams}