import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var backgroundView: UIView!
    
    @IBOutlet weak var auroraImageView: UIImageView!
    @IBOutlet weak var lvImageView: UIImageView!
    
    @IBOutlet weak var redLabel: UILabel!
    @IBOutlet weak var greenLabel: UILabel!
    @IBOutlet weak var blueLabel: UILabel!
    @IBOutlet weak var cornerLabel: UILabel!
    @IBOutlet weak var alphaLabel: UILabel!
    @IBOutlet weak var frameLabel: UILabel!
    @IBOutlet weak var shadowLabel: UILabel!
    
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    @IBOutlet weak var cornerSlider: UISlider!
    @IBOutlet weak var alphaSlider: UISlider!
    @IBOutlet weak var frameSlider: UISlider!
    @IBOutlet weak var shadowSlider: UISlider!
    
    @IBOutlet weak var redSwitch: UISwitch!
    @IBOutlet weak var greenSwitch: UISwitch!
    @IBOutlet weak var blueSwitch: UISwitch!
    @IBOutlet weak var dressSwitch: UISwitch!
    
    @IBOutlet weak var randomButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //先讓畫面載入後，預設都是關閉的
        redSlider.isEnabled = false
        greenSlider.isEnabled = false
        blueSlider.isEnabled = false
        lvImageView.isHidden = true
    }
    
    //判斷RGB開關，及符合隨機顏色條件
    @IBAction func changeSwitch(_ sender: UISwitch) {
        if redSwitch.isOn {
            redSlider.isEnabled = true
        }else{
            redSlider.isEnabled = false
        }
        
        if greenSwitch.isOn {
            greenSlider.isEnabled = true
        }else{
            greenSlider.isEnabled = false
        }
        
        if blueSwitch.isOn {
            blueSlider.isEnabled = true
        }else{
            blueSlider.isEnabled = false
        }
        
        //判斷是否開啟隨機顏色(需符合redSwitch.isOn && greenSwitch.isOn && blueSwitch.isOn)
        if redSwitch.isOn && greenSwitch.isOn && blueSwitch.isOn {
            randomButton.isEnabled = true
        }else{
            randomButton.isEnabled = false
        }
    }
    
    //RGB和alpha
    @IBAction func changeColor(_ sender: UISlider) {
        auroraImageView.backgroundColor = UIColor(cgColor: CGColor(red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: CGFloat(alphaSlider.value)))
        redLabel.text = String(format: "%.1f", redSlider.value)
        greenLabel.text = String(format: "%.1f", greenSlider.value)
        blueLabel.text = String(format: "%.1f", blueSlider.value)
        alphaLabel.text = String(format: "%.1f", alphaSlider.value)
    }
    
    //圓角
    @IBAction func changeCorner(_ sender: UISlider) {
        auroraImageView.layer.cornerRadius = CGFloat(cornerSlider.value * 50)
        lvImageView.layer.cornerRadius = CGFloat(cornerSlider.value * 50)
        backgroundView.layer.cornerRadius = CGFloat(cornerSlider.value * 50)
        cornerLabel.text = String(format: "%.1f", cornerSlider.value)
    }
    
    //邊框
    @IBAction func changeFrame(_ sender: UISlider) {
        auroraImageView.layer.borderColor = CGColor(red: 255/255, green: 192/255, blue: 203/255, alpha: 1)
        auroraImageView.layer.borderWidth = CGFloat(frameSlider.value * 15)
        frameLabel.text = String(format: "%.1f", frameSlider.value)
    }
    
    //陰影
    @IBAction func changeShadow(_ sender: UISlider) {
        backgroundView.layer.shadowColor = UIColor.blue.cgColor
        backgroundView.layer.shadowOpacity = shadowSlider.value
        shadowLabel.text = String(format: "%.1f", shadowSlider.value)
    }
    
    //隨機顏色RGB
    @IBAction func randomColor(_ sender: UIButton) {
        if redSwitch.isOn && greenSwitch.isOn && blueSwitch.isOn {
            //產生RGB亂數
            redSlider.value = Float.random(in: 0...1)
            greenSlider.value = Float.random(in: 0...1)
            blueSlider.value = Float.random(in: 0...1)
            
            if dressSwitch.isOn {
                auroraImageView.backgroundColor = UIColor(red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: 0.5)
            }else{
                auroraImageView.backgroundColor = UIColor(red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: 1)
            }
            redLabel.text = String(format: "%.1f", redSlider.value)
            greenLabel.text = String(format: "%.1f", greenSlider.value)
            blueLabel.text = String(format: "%.1f", blueSlider.value)
        }
    }
    
    @IBAction func switchDressOn(_ sender: UISwitch) {
        if dressSwitch.isOn {
            lvImageView.isHidden = false
        }else{
            lvImageView.isHidden = true
        }
    }
    
    @IBAction func randomOthers(_ sender: UIButton) {
        cornerSlider.value = Float.random(in: 0...1)
        frameSlider.value = Float.random(in: 0...1)
        shadowSlider.value = Float.random(in: 0...1)
        auroraImageView.layer.cornerRadius = CGFloat(cornerSlider.value * 50)
        lvImageView.layer.cornerRadius = CGFloat(cornerSlider.value * 50)
        backgroundView.layer.cornerRadius = CGFloat(cornerSlider.value * 50)
        auroraImageView.layer.borderColor = CGColor(red: CGFloat.random(in: 0...1), green: CGFloat.random(in: 0...1), blue: CGFloat.random(in: 0...1), alpha: 1)
        auroraImageView.layer.borderWidth = CGFloat(frameSlider.value * 15)
        backgroundView.layer.shadowColor = CGColor(red: CGFloat.random(in: 0...1), green: CGFloat.random(in: 0...1), blue: CGFloat.random(in: 0...1), alpha: 1)
        backgroundView.layer.shadowOpacity = shadowSlider.value
        cornerLabel.text = String(format: "%.1f", cornerSlider.value)
        frameLabel.text = String(format: "%.1f", frameSlider.value)
        shadowLabel.text = String(format: "%.1f", shadowSlider.value)
    }
    
    //重置
    @IBAction func reset(_ sender: UIButton) {
        lvImageView.isHidden = true
        auroraImageView.alpha = 1
        
        redSwitch.isOn = false
        greenSwitch.isOn = false
        blueSwitch.isOn = false
        dressSwitch.isOn = false
        
        redSlider.value = 0
        greenSlider.value = 0
        blueSlider.value = 0
        cornerSlider.value = 0
        alphaSlider.value = 0
        frameSlider.value = 0
        shadowSlider.value = 0
        
        redLabel.text = "0.0"
        greenLabel.text = "0.0"
        blueLabel.text = "0.0"
        cornerLabel.text = "0.0"
        alphaLabel.text = "0.0"
        frameLabel.text = "0.0"
        shadowLabel.text = "0.0"
        
        auroraImageView.backgroundColor = nil
        
        auroraImageView.layer.cornerRadius = 0
        lvImageView.layer.cornerRadius = 0
        backgroundView.layer.cornerRadius = 0
        
        auroraImageView.layer.borderWidth = 0
        auroraImageView.layer.borderColor = nil
        
        backgroundView.layer.shadowColor = nil
        backgroundView.layer.shadowOpacity = 0
    }
}

