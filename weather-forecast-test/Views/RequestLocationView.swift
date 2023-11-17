//
//  RequestLocationView.swift
//  weather-forecast-test
//
//  Created by Darvin Segura diaz on 17/11/23.
//

import SwiftUI
import CoreLocationUI

struct RequestLocationView: View {
    
    @EnvironmentObject var locationManager: LocationManager
    
    var body: some View {
        VStack {
            VStack(spacing: 20) {
                Image("CobbleStoneLogo1")
                    .resizable(resizingMode: .stretch)
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 300, alignment: .center)
                                .foregroundStyle(.tint)
                                .padding()
                
                Text("Test Weather App")
                    .bold()
                    .font(.title)

                Text("Please share your current location to get the weather in your location")
                    .padding()
                
                LocationButton(.shareCurrentLocation) {
                    locationManager.requestLocation()
                        }
                        .cornerRadius(16)
                        .symbolVariant(.fill)
                        .foregroundColor(.white)
                        .padding(.all)
                
            }
            .multilineTextAlignment(.center)
            .padding()

        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct RequestLocationView_Previews: PreviewProvider {
    static var previews: some View {
        RequestLocationView()
    }
}
