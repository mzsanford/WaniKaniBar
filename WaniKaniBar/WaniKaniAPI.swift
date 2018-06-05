//
//  WaniKaniAPI.swift
//  WaniKaniBar
//
//  Created by Ben Griffith on 03/05/2018.
//  Copyright © 2018 Ben Griffith. All rights reserved.
//

import Foundation

struct StudyQueue {
  var availableLessons: Int
  var availableReviews: Int
  var nextReviewDate: TimeInterval
}


class WaniKaniAPI {
  let BASE_URL = "https://www.wanikani.com/api/user/"
  let resource = "study-queue"
  
  func fetchStudyQueue(_ apiKey: String, success: @escaping (StudyQueue) -> Void) {
    let session = URLSession.shared
    let url = URL(string: "https://www.wanikani.com/api/user/\(apiKey)/\(resource)")
    let task = session.dataTask(with: url!) { data, response, err in
      // first check for a hard error
      if let error = err {
        NSLog("WaniKani API error: \(error)")
      }
      
      // then check the response code
      if let httpResponse = response as? HTTPURLResponse {
        switch httpResponse.statusCode {
        case 200: // all good!
          if let studyQueue = self.studyQueueFromJSONData(data!) {
            success(studyQueue)
          }
        case 401: // unauthorized
          NSLog("WaniKani API returned an 'unauthorized' response. Did you set your API key?")
        default:
          NSLog("WaniKani API returned response: %d %@", httpResponse.statusCode, HTTPURLResponse.localizedString(forStatusCode: httpResponse.statusCode))
        }
      }
    }
    task.resume()
  }
  
  
//  var i = 0
  
  func studyQueueFromJSONData(_ data: Data) -> StudyQueue? {
    typealias JSONDict = [String:AnyObject]
    let json : JSONDict
    
//    i += 1
    
    do {
      json = try JSONSerialization.jsonObject(with: data, options: []) as! JSONDict
    } catch {
      NSLog("JSON parsing failed: \(error)")
      return nil
    }
    
    var mainDict = json["requested_information"] as! JSONDict
//     Add an offset to keep the site in sync - as it is currently behind the API response
//    let offset = 60
//    let nextReviewWithOffset = Int(mainDict["next_review_date"] as! Int + offset)
    
    let studyQueue = StudyQueue(
      availableLessons: mainDict["lessons_available"] as! Int,
      availableReviews: mainDict["reviews_available"] as! Int,
      nextReviewDate: mainDict["next_review_date"] as! TimeInterval
    )
    
//    var j = i > 1 ? 2 : 0
//
//    j = i > 4 ? 5 : j
//
//    j = i > 6 ? 0 : j
////
//    let foo = i == 1 ? 1525875668.16796 + 6000 : 1525875668.16796 + 3000
//
//    let studyQueue = StudyQueue(
//      availableLessons: 0,
//      availableReviews: 0,
//      nextReviewDate: foo /*NSDate().timeIntervalSince1970*/ /*1525875668.16796 + 160*/ /* (3600 * 25)*/
//    )
    
    return studyQueue
  }
}
