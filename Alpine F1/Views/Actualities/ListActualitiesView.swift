//
//  ListActualitiesView.swift
//  BWT Alpine F1 Team
//
//  Created by Florian DAVID on 28/12/2023.
//

import SwiftUI

struct ListActualitiesView: View {
    @StateObject var actuVM = ActualityViewModel(service: ActualityService())
    
    var body: some View {
        VStack {
            switch actuVM.state {
                case .loading:
                    ProgressView()
                case .success(let data):
                    if let actualities = data as? [Actuality] {
                        List {
                            ForEach(actualities, id: \.self) { actu in
                                NavigationLink(destination: ActuView(actuality: actu)) {
                                    HStack(spacing: 15) {
                                        AsyncImage(url: actu.image) { image in
                                            image
                                                .resizable()
                                                .scaledToFit()
                                                .frame(width: 100)
                                        } placeholder: {
                                            ProgressView()
                                        }
                                        
                                        VStack(alignment: .leading) {
                                            Text(actu.title)
                                                .semibold(size: 20)
                                                .frame(height: 50)
                                            
                                            Text(actu.date)
                                                .light(size: 16)
                                        }
                                    }
                                }
                            }
                        }
                        .listStyle(.plain)
                    }
                default:
                    Text("No actualities available")
                }
        }
        .task {
            await actuVM.fetchAllActus()
        }
    }
}

#Preview {
    ListActualitiesView()
}
