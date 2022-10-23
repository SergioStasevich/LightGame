

import UIKit

class SettngsTableViewController: UITableViewController {
    @IBOutlet weak var switchTimer: UISwitch!
    
    @IBOutlet weak var timeGame: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadSettings()
    }

    
    @IBAction func resetSettings(_ sender: UIButton) {
        Settings.shared.resetSettings()
        loadSettings()
    }
    
    
    func loadSettings(){
        timeGame.text = "\(Settings.shared.currentSettings.timeForGame) sek"
        switchTimer.isOn = Settings.shared.currentSettings.timerState
    }
    
    @IBAction func switchTimerChange(_ sender: UISwitch) {
        Settings.shared.currentSettings.timerState = sender.isOn
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "selectTime":
            if let vc = segue.destination as? SelectViewController  {
                vc.data = [10, 20, 30, 40, 50 , 60, 70 , 80, 90, 100, 110, 120]
            }
        default:
            break
        }
    }
}
