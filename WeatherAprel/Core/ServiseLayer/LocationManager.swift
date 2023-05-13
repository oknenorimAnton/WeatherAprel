//
//  LocationManager.swift
//  WeatherAprel
//
//  Created by Антон on 11.05.2023.
//

import CoreLocation

protocol LocationManagable {
    func fetchLocation() async throws -> CLLocationCoordinate2D
}

final class LocationManager: NSObject {
    private let locationManager = CLLocationManager()
    private let defaultCoordinates = CLLocationCoordinate2D(latitude: Constants.defaultLatitude, longitude: Constants.defaultLongitude)
    private var checkedThrowingContinuation: CheckedContinuation<CLLocationCoordinate2D, Error>?
}

extension LocationManager: LocationManagable {
    func fetchLocation() async throws -> CLLocationCoordinate2D {
        return try await withCheckedThrowingContinuation{ [weak self] (continuation: CheckedContinuation<CLLocationCoordinate2D, Error>) in
            self?.locationManager.delegate = self
            self?.checkedThrowingContinuation = continuation
        }
    }
}

extension LocationManager: CLLocationManagerDelegate {
    func locationManager(
        _ manager: CLLocationManager,
        didChangeAuthorization status: CLAuthorizationStatus
    ) {
        switch status {
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .authorizedAlways,
             .authorizedWhenInUse,
             .authorized:
            locationManager.startUpdatingLocation()
        case .restricted,
             .denied:
            checkedThrowingContinuation?.resume(returning: defaultCoordinates)
        @unknown default:
            checkedThrowingContinuation?.resume(returning: defaultCoordinates)
        }
    }
    
    func locationManager(
        _ manager: CLLocationManager,
        didUpdateLocations locations: [CLLocation]
    ) {
        if let location = locations.first {
            locationManager.stopUpdatingLocation()
            checkedThrowingContinuation?.resume(returning: location.coordinate)
            checkedThrowingContinuation = nil
        } else {
            checkedThrowingContinuation?.resume(returning: defaultCoordinates)
        }
    }

    func locationManager(
        _ manager: CLLocationManager,
        didFailWithError error: Error
    ) {
        checkedThrowingContinuation?.resume(throwing: error)
        checkedThrowingContinuation = nil
    }
}
