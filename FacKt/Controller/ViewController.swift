//
//  ViewController.swift
//  FacKt
//
//  Created by ahmet on 05.04.22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var dailyTitle: UILabel!
    @IBOutlet weak var randomTitle: UILabel!
    @IBOutlet weak var dailyFactLabel: UILabel!
    @IBOutlet weak var randomFactLabel: UILabel!
    @IBOutlet weak var segmentView: UIView!
    @IBOutlet weak var randomView: UIView!
    @IBOutlet weak var buttonView: UIView!
    @IBOutlet weak var dailyView: UIView!
    @IBOutlet var potraitConstraints: [NSLayoutConstraint]!
    @IBOutlet weak var segmentedController: UISegmentedControl!
    @IBOutlet weak var button: UIButton!
    
    var landscapeConstraints = [NSLayoutConstraint]()
    var constraints = Constraints()
    lazy var sA = view.safeAreaLayoutGuide
    var facktManager = FacKtManager()
    let typeRandom = "random"
    let typeToday = "today"
    var language = "en"
    var selectedSegmentIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let swipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(gestureFired))
        swipeGesture.direction = .down
        swipeGesture.numberOfTouchesRequired = 1
        view.addGestureRecognizer(swipeGesture)
        view.isUserInteractionEnabled = true
        
        landscapeConstraints = constraints.newConstrains(segmentView, randomView, buttonView, dailyView, segmentedController, button, randomTitle, randomFactLabel, dailyTitle, dailyFactLabel, sA)
        
        facktManager.delegate = self
        facktManager.getFact(language,typeRandom)
        facktManager.getFact(language, typeToday)
       
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.orientationChanged), name: UIDevice.orientationDidChangeNotification, object: nil)
    }
       
    @IBAction func languageChanged(_ sender: UISegmentedControl) {
        
        selectedSegmentIndex = sender.selectedSegmentIndex
        language = languagesArray[sender.selectedSegmentIndex].languageTitle
        dailyTitle.text = languagesArray[sender.selectedSegmentIndex].dailyTitle
        randomTitle.text = languagesArray[sender.selectedSegmentIndex].randomTitle

        facktManager.getFact(language, typeRandom)
        facktManager.getFact(language, typeToday)
        
    }
    
 
    @IBAction func refreshPressed(_ sender: UIButton) {
        facktManager.getFact(language, typeRandom)
        facktManager.getFact(language, typeToday)
        
    }
    
    @objc func gestureFired(){
        facktManager.getFact(language, typeRandom)
        facktManager.getFact(language, typeToday)
    }
    
    @objc func orientationChanged() {
        switch UIDevice.current.orientation {
    
    case .portrait:
        NSLayoutConstraint.deactivate(landscapeConstraints)
        NSLayoutConstraint.activate(potraitConstraints)
        print("Potrait")
    case .portraitUpsideDown:
        print("Portrait up side down")
        NSLayoutConstraint.deactivate(landscapeConstraints)
        NSLayoutConstraint.activate(potraitConstraints)
    case .landscapeLeft:
        NSLayoutConstraint.deactivate(potraitConstraints)
        NSLayoutConstraint.activate(landscapeConstraints)
        print("landscape left")
    case .landscapeRight:
        print("landscape right")
        NSLayoutConstraint.deactivate(potraitConstraints)
        NSLayoutConstraint.activate(landscapeConstraints)
    case .faceUp:
            print("Face up")
    default:
        NSLayoutConstraint.deactivate(landscapeConstraints)
        NSLayoutConstraint.activate(potraitConstraints)
        print("default")
    }
   }
    
    
}
//MARK: - Fact Manager Delegate

extension ViewController: FacktManagerDelegate {
    
    func didUpdateTodayFact(_ fact:ReturnedData) {
        DispatchQueue.main.async {
            self.dailyFactLabel.text = fact.factText
            
        }
    }
    
        func didUpdateFact(_ fact:ReturnedData) {
            DispatchQueue.main.async {
                self.randomFactLabel.text = fact.factText
                
            }
        }
    func alarm (_ language:String) {

        let title = languagesArray[selectedSegmentIndex].alarmTitle
        let message = languagesArray[selectedSegmentIndex].alarmMessage

        DispatchQueue.main.async {
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
                let ok = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
                alert.addAction(ok)
                self.present(alert, animated: true, completion: nil)
        }
    }

    
}

