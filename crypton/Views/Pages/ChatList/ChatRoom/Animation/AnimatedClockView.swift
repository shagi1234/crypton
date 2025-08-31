//
//  AnimatedClockView.swift
//  crypton
//
//  Created by Meylis on 31.01.2025.
//

import SwiftUI

struct AnimatedClockView: View {
    @State private var secondHandRotation: Double = 0
    @State private var minuteHandRotation: Double = 0

    var body: some View {
        ZStack {
            // Фон часов
            Circle()
                .stroke(lineWidth: 2)
                .foregroundColor(.gray)
                .frame(width: 100, height: 100)

            // Часовая стрелка (вращается медленно)
            Rectangle()
                .fill(Color.black)
                .frame(width: 2, height: 30)
                .offset(y: -15)
                .rotationEffect(.degrees(minuteHandRotation)) // Вращение часовой стрелки
                .animation(.linear(duration: 60).repeatForever(autoreverses: false), value: minuteHandRotation)

            // Минутная стрелка (вращается быстро)
            Rectangle()
                .fill(Color.red)
                .frame(width: 2, height: 40)
                .offset(y: -20)
                .rotationEffect(.degrees(secondHandRotation)) // Вращение минутной стрелки
                .animation(.linear(duration: 1).repeatForever(autoreverses: false), value: secondHandRotation)
        }
        .onAppear {
            startClock()
        }
    }

    // Запуск часов
    func startClock() {
        // Инициализируем таймер, который обновляет стрелки каждую секунду
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            // Обновление положения секундной стрелки
            secondHandRotation += 6  // Вращение на 6 градусов каждую секунду
            // Обновление положения минутной стрелки
            if secondHandRotation == 360 {
                secondHandRotation = 0 // Сбрасываем секундную стрелку после полного оборота
                minuteHandRotation += 6 // Минутная стрелка вращается на 6 градусов
            }
        }
    }
}


struct ContentView2: View {
    var body: some View {
        AnimatedClockView()
    }
}

struct ContentView2_Previews: PreviewProvider {
    static var previews: some View {
        ContentView2()
    }
}
