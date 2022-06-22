//
//  APIResponse.swift
//  PullToRefresh
//
//  Created by marco rodriguez on 22/06/22.
//

import Foundation

/*
 {
   "results": {
     "sunrise": "2022-06-22T04:57:56+00:00",
     "sunset": "2022-06-22T19:41:29+00:00",
     "solar_noon": "2022-06-22T12:19:42+00:00",
     "day_length": 53013,
     "civil_twilight_begin": "2022-06-22T04:28:46+00:00",
     "civil_twilight_end": "2022-06-22T20:10:39+00:00",
     "nautical_twilight_begin": "2022-06-22T03:50:30+00:00",
     "nautical_twilight_end": "2022-06-22T20:48:54+00:00",
     "astronomical_twilight_begin": "2022-06-22T03:07:36+00:00",
     "astronomical_twilight_end": "2022-06-22T21:31:49+00:00"
   },
   "status": "OK"
 }
 */

struct APIResponse: Codable {
    let results: APIResponseResults
    let status: String
}

struct APIResponseResults: Codable {
    let sunrise: String
    let sunset: String
    let solar_noon: String
    let day_length: Double
    let civil_twilight_begin: String
    let civil_twilight_end: String
    let nautical_twilight_begin: String
    let nautical_twilight_end: String
    let astronomical_twilight_begin: String
    let astronomical_twilight_end: String
}
