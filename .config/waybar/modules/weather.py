#!/usr/bin/env python3
import requests
import json

CITY = "Assiut"

def get_weather(city):
    # Step 1: Get lat/lon from geocoding
    geo_url = f"https://geocoding-api.open-meteo.com/v1/search?name={city}&count=1"
    geo_data = requests.get(geo_url).json()
    if "results" not in geo_data:
        return {"text": "❌ city not found"}

    lat = geo_data["results"][0]["latitude"]
    lon = geo_data["results"][0]["longitude"]
    tz = geo_data["results"][0]["timezone"]

    # Step 2: Get current weather
    weather_url = (
        f"https://api.open-meteo.com/v1/forecast?"
        f"latitude={lat}&longitude={lon}&current_weather=true&timezone={tz}"
    )
    weather = requests.get(weather_url).json()

    if "current_weather" not in weather:
        return {"text": "❌ no data"}

    temp = weather["current_weather"]["temperature"]
    wind = weather["current_weather"]["windspeed"]

    return {
        "text": f"{temp:.0f}°C",
        "tooltip": f"City: {city}\nTemp: {temp}°C\nWind: {wind} km/h",
        "class": "weather"
    }

if __name__ == "__main__":
    data = get_weather(CITY)
    print(json.dumps(data))  # ✅ Proper JSON output
