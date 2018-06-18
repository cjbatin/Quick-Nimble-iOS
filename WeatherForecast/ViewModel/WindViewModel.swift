//
//  WindViewModel.swift
//  WeatherForecast
//
//  Created by Christopher Batin on 01/06/2018.
//  Copyright © 2018 Batin. All rights reserved.
//

import Foundation

struct WindViewModel {

    let currentWeather: CurrentWeather
    private(set) var coordString = ""
    private(set) var windSpeedString = ""
    private(set) var windDegString = ""
    private(set) var locationString = ""

    init(currentWeather: CurrentWeather) {
        self.currentWeather = currentWeather
        updateProperties()
    }

    private mutating func updateProperties() {
        coordString = setCoordString(currentWeather: currentWeather)
        windSpeedString = setWindSpeedString(currentWeather: currentWeather)
        windDegString = setWindDirectionString(currentWeather: currentWeather)
        locationString = setLocationString(currentWeather: currentWeather)
    }

}

extension WindViewModel {

    private func setCoordString(currentWeather: CurrentWeather) -> String {
        return "Lat: \(currentWeather.coord.lat), Lon: \(currentWeather.coord.lon)"
    }

    private func setWindSpeedString(currentWeather: CurrentWeather) -> String {
        return "Wind Speed: \(currentWeather.wind.speed)"
    }

    private func setWindDirectionString(currentWeather: CurrentWeather) -> String {
        return "Wind Deg: \(currentWeather.wind.deg)"
    }

    private func setLocationString(currentWeather: CurrentWeather) -> String {
        return "Location: \(currentWeather.name)"
    }
}
