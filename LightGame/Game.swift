
import Foundation

class Game {
    
    struct Item{
   var title: String
        var isFound: Bool
    }
    
    
    private let data = Array(1...99)
    
    private var items: [Item] = []
    
    private var countItem:Int
    
    init (countItem:Int) {
        self.countItem = countItem
    }
}
