
import Foundation

class Game {
    
    struct Item{
   var title: String
        var isFound: Bool = false
    }
    
    
    private let data = Array(1...99)
    
    var items: [Item] = []
    
    var nextItem: Item?
    var status:StatusGame = .start
    
    private var countItem:Int
    
    init (countItem:Int) {
        self.countItem = countItem
        setupGame()
    }
    
    
    func check(index: Int) {
        if items[index].title == nextItem?.title{
            items[index].isFound = true
            nextItem = items.shuffled().first(where: { (item) -> Bool in
                item.isFound == false
            })
        }
        
        if nextItem == nil{
            status = .win
        
        }
            
    }
    
    
    func setupGame() {
        var digit = data.shuffled()
        
        while items.count < countItem {
            let item = Item(title: String(digit.removeFirst()))
            items.append(item)
        }
        nextItem = items.shuffled().first
    }
}
