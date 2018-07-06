//
//  ViewControllerSpecs.swift
//  WeatherForecastTests
//
//  Created by Christopher Batin on 06/07/2018.
//  Copyright © 2018 Batin. All rights reserved.
//

import Quick
import Nimble
@testable import WeatherForecast

class ViewControllerSpecs: QuickSpec {
    override func spec() {
        var sut: ViewController!
        describe("The 'View Controller'") {
            context("Can show the correct labels text") {
                afterEach {
                    sut = nil
                }
                beforeEach {
                    let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
                    sut = storyboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
                    _ = sut.view
                    if let path = Bundle(for: type(of: self)
                        ).path(forResource: "london_weather_correct", ofType: "json") {
                        do {
                            let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .alwaysMapped)
                            let decoder = JSONDecoder()
                            decoder.keyDecodingStrategy = .convertFromSnakeCase
                            sut.searchResult = try decoder.decode(CurrentWeather.self, from: data)
                        } catch {
                            fail("Problem parsing JSON")
                        }
                    }
                }
                it("can show the correct text within the coord label") {
                    expect(sut.coordLabel.text).toEventually(equal("Lat: 51.51, Lon: -0.13"))
                }
                it("can show the correct location label") {
                    expect(sut.locationLabel.text).toEventually(equal("Location: London"))
                }
            }
        }
    }
}
