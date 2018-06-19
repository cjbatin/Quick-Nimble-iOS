//
//  WindViewModelSpecs.swift
//  WeatherForecastTests
//
//  Created by Christopher Batin on 19/06/2018.
//  Copyright © 2018 Batin. All rights reserved.
//

import Quick
import Nimble
@testable import WeatherForecast

class CurrentWeatherSpecs: QuickSpec {
    override func spec() {
        var sut: CurrentWeather!
        describe("The 'Current Weather'") {
            context("Can be created with valid JSON") {
                afterEach {
                    sut = nil
                }
                beforeEach {
                    if let path = Bundle(for: type(of: self)
                        ).path(forResource: "london_weather_correct", ofType: "json") {
                        do {
                            let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .alwaysMapped)
                            let decoder = JSONDecoder()
                            decoder.keyDecodingStrategy = .convertFromSnakeCase
                            sut = try decoder.decode(CurrentWeather.self, from: data)
                        } catch {
                            fail("Problem parsing JSON")
                        }
                    }
                }
                it("can parse the correct lat") {
                    expect(sut.coord.lat).to(equal(1))
                }
                it("can parse the correct date time ") {
                    expect(sut.dt).to(equal(0))
                }
            }
        }
    }
}

c
