import Foundation

class Event {
    var name: String
    var location: String
    var reviewClosed: Bool
    var time: Date
    
    init(name: String, location: String, reviewClosed: Bool, time: Date) {
        self.name = name
        self.location = location
        self.reviewClosed = reviewClosed
        self.time = time
    }
}
