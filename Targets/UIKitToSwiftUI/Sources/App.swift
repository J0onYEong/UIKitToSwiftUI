

import SwiftUI
import MapkitToSwiftUI
import CoreLocation

@main
struct UIKitToSwiftUIApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

struct ContentView: View {
    @State private var currentLocation = CLLocation(latitude: 0, longitude: 0)
    
    let annotations: [AnnotationClassType] = [
        CIAnnotationWithSwiftUI(coordinate: CLLocationCoordinate2D(latitude: 37.58217, longitude: 127.001893), title: "혜하역",uiImage: UIImage(named: Bundle.main.provideFilePath(name: "dummyImage1", ext: "jpeg"))!),
        
        CIAnnotationWithSwiftUI(coordinate: CLLocationCoordinate2D(latitude: 37.5805009, longitude: 127.0028245), title: "마로니에 공원", uiImage: UIImage(named: Bundle.main.provideFilePath(name: "dummyImage2", ext: "jpeg"))!)
    ]
    
    var mapView: CJMapkitView {
        CJMapkitView(userLocation: currentLocation, annotations: annotations)
    }
    
    var body: some View {
        ZStack {
            mapView
                .ignoresSafeArea()
            
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Image(systemName: "person.circle.fill")
                        .resizable()
                        .scaledToFit()
                        .foregroundStyle(.orange)
                        .padding(3)
                        .background(
                            Circle()
                                .fill(.white)
                        )
                        .frame(width: 75, height: 75)
                        .onTapGesture {
                            CJLocationManager.shared.manager.requestLocation()
                        }
                        .padding([.trailing, .bottom], 10)
                    
                }
            }
        }
    }
}
