import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightSlider: UISlider!
    
    
    @IBAction func heightSliderChanged(_ sender: UISlider) {
        heightLabel.text = (String(format: "%.2f", sender.value) + "m")
    }
    
    
    @IBAction func weightSliderChange(_ sender: UISlider) {
        weightLabel.text = (String(format: "%.0f", sender.value) + "Kg")
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        
        let height = heightSlider.value
        let weight = weightSlider.value
        let bmi = weight / pow(height, 2)

        let secondVC = SecondViewController()
        
//        formatting float bmit to string bmit with 1 number after .
        secondVC.bmiValue = String(format: "%.1f", bmi)
        
        self.present(secondVC, animated: true, completion: nil)
    }

}

