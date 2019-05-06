import Foundation

class Event {
    var name: String
    var location: String
    var rating: Double
    var reviewClosed: Bool
    var time: Date
    
    init(name: String, location: String, rating: Double, reviewClosed: Bool, time: Date) {
        self.name = name
        self.location = location
        self.rating = rating
        self.reviewClosed = reviewClosed
        self.time = time
    }
}
