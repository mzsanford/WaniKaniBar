//
//  time.swift
//  WaniKaniBar
//
//  Created by Ben Griffith on 05/05/2018.
//  Copyright © 2018 Ben Griffith. All rights reserved.
//

import Foundation

struct Time {
  var days: Int
  var hours: Int
  var minutes: Int
}

func secondsToDaysHoursMinutes(seconds: Int) -> Time {
  var daysRemaining: Int
  var hoursRemaining: Int
  var minutesRemaining: Int
  var secondsRemaining: Int = seconds

  minutesRemaining = Int(floor(Double(secondsRemaining / 60)))
  secondsRemaining = secondsRemaining % 60
  hoursRemaining = Int(floor(Double(minutesRemaining / 60)))
  minutesRemaining = minutesRemaining % 60
  daysRemaining = Int(floor(Double(hoursRemaining / 24)))
  hoursRemaining = hoursRemaining % 24
  
  return Time(
    days: daysRemaining,
    hours: hoursRemaining,
    minutes: minutesRemaining
  )
}

func shouldRoundUpDays(_ time: Time) -> Bool {
  return time.hours > 12 || (time.hours == 12 && time.minutes > 30)
}

func shouldRoundUpHours(_ time: Time) -> Bool {
  return time.hours > 0 && time.minutes > 30
}

func getRoundedDays(_ time: Time) -> Int {
  return shouldRoundUpDays(time) ? time.days + 1 : time.days
}

func getRoundedHours(_ time: Time) -> Int {
  return shouldRoundUpHours(time) ? time.hours + 1 : time.hours
}

func getRoundedMinutes(_ time: Time) -> Int {
  return time.minutes == 0 ? 1 : time.minutes
}
