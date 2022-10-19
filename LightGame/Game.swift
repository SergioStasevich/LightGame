
import Foundation

class Game {
    
    struct Item{
   var title: String
        var isFound: Bool = false
    }
    
    
    private let data = Array(1...99)
    
    var items: [Item] = []
    
    private var countItem:Int
    
    init (countItem:Int) {
        self.countItem = countItem
    }
    
    func setupGame() {
        var digit = data.shuffled()
        
        while items.count < countItem {
            let item = Item(title: String(digit.removeFirst()))
            items.append(item)
        }
        
    }
}
