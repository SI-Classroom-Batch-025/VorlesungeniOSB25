//
//  Weather.swift
//  VorlesungeniOSB25
//
//  Created by Felix B on 23.04.25.
//



struct Weather: Codable {
    var lat: String
    var lon: String
    var current: CurrentWeather
}

struct CurrentWeather: Codable {
    var icon: String
    var temperature: Double
}

/*
 {
     "lat": "51.50853N",
     "lon": "0.12574W",
     "elevation": 25,
     "timezone": "UTC",
     "units": "metric",
     "current": {
         "icon": "sunny",
         "icon_num": 2,
         "summary": "Sunny",
         "temperature": 13.2,
         "wind": {
             "speed": 6.1,
             "angle": 87,
             "dir": "E"
         },
         "precipitation": {
             "total": 0,
             "type": "none"
         },
         "cloud_cover": 0
     },
     "hourly": {
         "data": [
             {
                 "date": "2025-04-01T13:00:00",
                 "weather": "sunny",
                 "icon": 2,
                 "summary": "Sunny",
                 "temperature": 13.2,
                 "wind": {
                     "speed": 6.1,
                     "dir": "E",
                     "angle": 87
                 },
                 "cloud_cover": {
                     "total": 0
                 },
                 "precipitation": {
                     "total": 0,
                     "type": "none"
                 }
             },
             {
                 "date": "2025-04-01T14:00:00",
                 "weather": "sunny",
                 "icon": 2,
                 "summary": "Sunny",
                 "temperature": 13.2,
                 "wind": {
                     "speed": 6.2,
                     "dir": "E",
                     "angle": 87
                 },
                 "cloud_cover": {
                     "total": 0
                 },
                 "precipitation": {
                     "total": 0,
                     "type": "none"
                 }
             }
         ]
     },
     "daily": {
         "data": [
             {
                 "day": "2025-04-01",
                 "weather": "mostly_sunny",
                 "icon": 3,
                 "summary": "Partly sunny, fewer clouds in the afternoon and evening. Temperature 5/13 °C. Wind from E in the afternoon.",
                 "all_day": {
                     "weather": "mostly_sunny",
                     "icon": 3,
                     "temperature": 8.8,
                     "temperature_min": 4.8,
                     "temperature_max": 13.2,
                     "wind": {
                         "speed": 4.6,
                         "dir": "E",
                         "angle": 82
                     },
                     "cloud_cover": {
                         "total": 16
                     },
                     "precipitation": {
                         "total": 0,
                         "type": "none"
                     }
                 },
                 "morning": null,
                 "afternoon": null,
                 "evening": null
             },
             {
                 "day": "2025-04-02",
                 "weather": "mostly_sunny",
                 "icon": 3,
                 "summary": "Partly sunny, fewer clouds in the afternoon and evening. Temperature 6/15 °C. Wind from NE.",
                 "all_day": {
                     "weather": "mostly_sunny",
                     "icon": 3,
                     "temperature": 10,
                     "temperature_min": 5.5,
                     "temperature_max": 14.8,
                     "wind": {
                         "speed": 5.6,
                         "dir": "ENE",
                         "angle": 73
                     },
                     "cloud_cover": {
                         "total": 10
                     },
                     "precipitation": {
                         "total": 0,
                         "type": "none"
                     }
                 },
                 "morning": null,
                 "afternoon": null,
                 "evening": null
             }
         ]
     }
 }
 */
