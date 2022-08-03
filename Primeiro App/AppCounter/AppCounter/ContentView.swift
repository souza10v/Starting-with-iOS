//
//  ContentView.swift
//  AppCounter
//
//  Created by Donizetti de Souza on 8/2/22.
//

import SwiftUI

class Counter: ObservableObject {
    
    @Published var days = 0
    @Published var hours = 0
    @Published var minutes = 0
    @Published var seconds = 0
    
    var selectedDate = Date()
    
    init(){
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
            let calendar = Calendar.current
            
            let components = calendar.dateComponents([.year, .day, .month, .hour, .minute, .second], from: Date())
            
            let currentDate = calendar.date(from: components)
            
            print(currentDate)
            
            let selectedComponents = calendar.dateComponents([.year, .day, .month, .hour, .minute, .second], from: self.selectedDate)
            
            let dateGoal = calendar.date(from: selectedComponents)
            
            print(dateGoal)
            
            var eventDateComponents = DateComponents()
            eventDateComponents.year = selectedComponents.year
            eventDateComponents.month = selectedComponents.year
            eventDateComponents.day = selectedComponents.day
            eventDateComponents.hour = selectedComponents.hour
            eventDateComponents.minute = selectedComponents.minute
            eventDateComponents.second = selectedComponents.second
            
            let eventDate = calendar.date(from: eventDateComponents)
            
            let timeLeft = calendar.dateComponents([.day, .hour, .minute, .second], from: currentDate!, to: dateGoal!)
            
            if (timeLeft.second! >= 0) {
                self.days = timeLeft.day ?? 0
                self.hours = timeLeft.hour ?? 0
                self.minutes = timeLeft.minute ?? 0
                self.seconds = timeLeft.second ?? 0
            }
            
        }
    }
}

struct ContentView: View {
    
    @StateObject var counter = Counter()
    
    var body: some View {
        VStack{
            
            DatePicker(selection: $counter.selectedDate, in: Date()..., displayedComponents: [.hourAndMinute, .date]) {
                Text("Seleciona a data: ")
            }
            
            HStack{
                Text("\(counter.days) dias")
                Text("\(counter.hours) horas")
                Text("\(counter.minutes) minutos")
                Text("\(counter.seconds) segundos")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
