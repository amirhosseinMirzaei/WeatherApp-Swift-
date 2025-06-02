//
//  ContentView.swift
//  WeatherApp
//
//  Created by Amirhossein Mirzaei on 6/1/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.blue,Color("lightBlue")]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            VStack{
                Text("Cupertino, CA")
                    .font(.system(size: 32,weight: .medium,design: .default))
                    .foregroundColor(.white)
                    .padding()
                VStack(spacing:17){
                    Image(systemName: "cloud.sun.fill")
                        .renderingMode(.original)
                        .resizable()
                        .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                        .frame(width: 190,height: 140)
                    Text("76°")
                        .font(.system(size: 70,weight: .medium))
                        .foregroundColor(.white)
                }
                .padding(.bottom,45)
        
                HStack(spacing:20){
                    WeatherDayView(dayOfWeak: "TUE",imageName: "cloud.sun.fill",temperature: 23)
                    WeatherDayView(dayOfWeak: "WED",imageName: "sun.max.fill",temperature: 32)
                    WeatherDayView(dayOfWeak: "THU",imageName: "wind.snow",temperature: 54)
                    WeatherDayView(dayOfWeak: "FRI",imageName: "sunset.fill",temperature: 31)
                    WeatherDayView(dayOfWeak: "SAT",imageName: "snow",temperature: 2)
                }
                Spacer()
                  
            }
            
        }
       
  
    }
}

#Preview {
    ContentView()
}

struct WeatherDayView: View {
    
    var dayOfWeak:String
    var imageName: String
    var temperature:Int
    
    var body: some View {
        VStack{
            Text(dayOfWeak)
                .font(.system(size: 16,weight: .medium, design: .default))
                .foregroundColor(.white)
            Image(systemName:imageName )
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                .frame(width:40 ,height: 40)
            Text("\(temperature)°")
                .font(.system(size: 28,weight: .medium))
                .foregroundColor(.white)
        }
    }
}
