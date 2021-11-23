import UIKit

class CalculateViewController: UIViewController {
    
    var bmiValue = "0.0"

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
        
        bmiValue = String(format: "%.1f", bmi)
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.bmiValue = bmiValue
        }
    }
}

