//
//  ContentView.swift
//  WeatherApp
//
//  Created by Amirhossein Mirzaei on 6/1/25.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false
    
    
    var body: some View {
        ZStack {
            BackgroundView(isNight:  $isNight)
            VStack{
                CityTextView(cityName: "Cupertino, CA").padding(.bottom,10)
                
                MainViewStatusView(imageName: isNight ? "moon.stars.fill" : "cloud.sun.fill",temperature: 65)
        
                HStack(spacing:24){
                    WeatherDayView(dayOfWeak: "TUE",imageName: "cloud.sun.fill",temperature: 23)
                    WeatherDayView(dayOfWeak: "WED",imageName: "sun.max.fill",temperature: 32)
                    WeatherDayView(dayOfWeak: "THU",imageName: "wind.snow",temperature: 54)
                    WeatherDayView(dayOfWeak: "FRI",imageName: "sunset.fill",temperature: 31)
                    WeatherDayView(dayOfWeak: "SAT",imageName: "snow",temperature: 2)
                }
                Spacer()
                Button{
                    isNight.toggle()
                }label: {
                    WeatherButton(title: "Change Day Time", textColor: .blue,
                                  backgroundColor:.white)
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

struct BackgroundView: View {
   @Binding var isNight: Bool
 
    
    var body: some View {
        LinearGradient(
            gradient: Gradient(colors: [
                isNight ? .black : .blue,
                isNight ? .gray : Color("lightBlue")
            ]),
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
        .edgesIgnoringSafeArea(.all)
    }

}

struct CityTextView: View {
    
    var cityName:String
    
    var body: some View {
        Text(cityName)
            .font(.system(size: 32,weight: .medium,design: .default))
            .foregroundColor(.white)
            .padding()
    }
}


struct MainViewStatusView: View {
    var imageName:String
    var temperature:Int
    
    var body: some View {
        VStack(spacing:18){
            Image(systemName: imageName )
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                .frame(width: 190,height: 140)
            Text("\(temperature)°")
                .font(.system(size: 70,weight: .medium))
                .foregroundColor(.white)
        }
        .padding(.bottom,45)
    }
    
    
}


