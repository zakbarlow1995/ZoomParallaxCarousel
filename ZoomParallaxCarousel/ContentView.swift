//
//  ContentView.swift
//  ZoomParallaxCarousel
//
//  Created by Zak Barlow on 30/06/2021.
//

import SwiftUI

struct ContentView: View {
    
    private func getScale(for proxy: GeometryProxy) -> CGFloat {
        var scale: CGFloat = 1.0
        
        let x = proxy.frame(in: .global).minX
        
        let diff = abs(x - 32)
        
        if diff < 100 {
            scale = 1 + (100.0 - diff) / 500.0
        }
        
        return scale
    }
    
    var body: some View {
        NavigationView {
            ScrollView {
                ScrollView(.horizontal) {
                    HStack(spacing: 50) {
                        ForEach(Assets.all, id: \.id) { asset in
                            GeometryReader { proxy in
                                NavigationLink(
                                    destination: Image(asset.name)
                                        .resizable()
                                        .scaledToFill()
                                        .navigationTitle(asset.description),
                                    label: {
                                        VStack {
                                            let scale = getScale(for: proxy)
                                            Image(asset.name)
                                                .resizable()
                                                .scaledToFill()
                                                .frame(width: 150)
                                                .overlay(
                                                    RoundedRectangle(cornerRadius: 5).stroke(lineWidth: 0.5)
                                                )
                                                .clipped()
                                                .cornerRadius(5)
                                                .shadow(radius: 4)
                                                .scaleEffect(CGSize(width: scale, height: scale))
                                                .animation(.easeOut(duration: 0.5))
                                            
                                            Text(asset.description)
                                                .padding(.top)
                                                .multilineTextAlignment(.center)
                                                .foregroundColor(Color(.label))
                                        }
                                    })
                            }
                            .frame(width: 125, height: 300)
                        }
                    }.padding(32)
                }
                
                
            }.navigationTitle("Movies Carousel")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
