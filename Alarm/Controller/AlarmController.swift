//
//  AlarmController.swift
//  Alarm
//
//  Created by Jack Knight on 12/3/18.
//  Copyright © 2018 Jack Knight. All rights reserved.
//

import Foundation

class AlarmController {
    
    var alarms: [Alarm] = []
    
    init() {
        self.alarms = self.mockAlarms
    }
    
    var mockAlarms: [Alarm] {
        let alarm1 = Alarm(fireDate: Date(timeIntervalSinceNow: 10000), name: "Go work out", enabled: true)
        let alarm2 = Alarm(fireDate: Date(timeIntervalSinceNow: 5000), name: "Go to bed", enabled: true)
        return [alarm1, alarm2]
    }
    
//    Singleton
    static let shared = AlarmController()

//    Create
    func addAlarm(fireDate: Date, name: String, enabled: Bool) {
        
        let newAlarm = Alarm(fireDate: fireDate, name: name, enabled: enabled)
        alarms.append(newAlarm)
    }
//    Update
    func update(alarm: Alarm, fireDate: Date, name: String, enabled: Bool) {
        alarm.fireDate = fireDate
        alarm.name = name
        alarm.enabled = enabled
        }
//    Delete
    func delete(alarm: Alarm) {
        if let deleteAlarm = alarms.index(of: alarm) {
            alarms.remove(at: deleteAlarm)
         }
    }
    
//    toggle enabled
    
    func toggleEnabled(for alarm: Alarm) {
         alarm.enabled.toggle()
            
        }
    }

