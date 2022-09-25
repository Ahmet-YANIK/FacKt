//
//  Constrains.swift
//  
//
//  Created by ahmet on 03.07.22.
//

import Foundation
import UIKit

class Constraints {
    var landscapeConstraints = [NSLayoutConstraint]()
   
    
    func newConstrains (_ sView:UIView,_ rView:UIView,_ bView:UIView,_ dView:UIView,_ sController:UISegmentedControl, _ button:UIButton,_ rFact:UILabel,_ rFactLabel:UILabel,_ dFact:UILabel,_ dFactLabel:UILabel,_ sA:UILayoutGuide) -> [NSLayoutConstraint] {
        
        sView.translatesAutoresizingMaskIntoConstraints = false
        rView.translatesAutoresizingMaskIntoConstraints = false
        bView.translatesAutoresizingMaskIntoConstraints = false
        dView.translatesAutoresizingMaskIntoConstraints = false
        sController.translatesAutoresizingMaskIntoConstraints = false
        button.translatesAutoresizingMaskIntoConstraints = false
        rFact.translatesAutoresizingMaskIntoConstraints = false
        rFactLabel.translatesAutoresizingMaskIntoConstraints = false
        dFact.translatesAutoresizingMaskIntoConstraints = false
        dFactLabel.translatesAutoresizingMaskIntoConstraints = false
        
        
        
        
        landscapeConstraints.append(sView.topAnchor.constraint(equalTo: sA.topAnchor))
        landscapeConstraints.append(sView.leadingAnchor.constraint(equalTo: sA.leadingAnchor))
        landscapeConstraints.append(sView.trailingAnchor.constraint(equalTo: sA.trailingAnchor))
        landscapeConstraints.append(sView.heightAnchor.constraint(equalToConstant: 50))
        
        landscapeConstraints.append(sController.topAnchor.constraint(equalTo: sView.topAnchor, constant: 10))
        landscapeConstraints.append(sController.leadingAnchor.constraint(equalTo: sView.leadingAnchor, constant: 50))
        landscapeConstraints.append(sController.bottomAnchor.constraint(equalTo: sView.bottomAnchor, constant: -10))
        landscapeConstraints.append(sController.trailingAnchor.constraint(equalTo: sView.trailingAnchor, constant: -50))

        
        landscapeConstraints.append(rView.topAnchor.constraint(equalTo: sView.bottomAnchor))
        landscapeConstraints.append(rView.leadingAnchor.constraint(equalTo: sA.leadingAnchor))
        landscapeConstraints.append(rView.bottomAnchor.constraint(equalTo: sA.bottomAnchor))
        landscapeConstraints.append(rView.trailingAnchor.constraint(equalTo: bView.leadingAnchor))
        
        landscapeConstraints.append(rFact.topAnchor.constraint(equalTo: rView.topAnchor))
        landscapeConstraints.append(rFact.leadingAnchor.constraint(equalTo: rView.leadingAnchor))
        landscapeConstraints.append(rFact.bottomAnchor.constraint(equalTo: rFactLabel.topAnchor))
        landscapeConstraints.append(rFact.trailingAnchor.constraint(equalTo: rView.trailingAnchor))
        
        landscapeConstraints.append(rFactLabel.heightAnchor.constraint(equalTo: rFact.heightAnchor, multiplier: 5))
        landscapeConstraints.append(rFactLabel.leadingAnchor.constraint(equalTo: rView.leadingAnchor))
        landscapeConstraints.append(rFactLabel.bottomAnchor.constraint(equalTo: rView.bottomAnchor))
        landscapeConstraints.append(rFactLabel.trailingAnchor.constraint(equalTo: rView.trailingAnchor))

        
        landscapeConstraints.append(bView.widthAnchor.constraint(equalToConstant: 104))
        landscapeConstraints.append(bView.topAnchor.constraint(equalTo: sView.bottomAnchor))
        landscapeConstraints.append(bView.leadingAnchor.constraint(equalTo: rView.trailingAnchor))
        landscapeConstraints.append(bView.bottomAnchor.constraint(equalTo: sA.bottomAnchor))
        landscapeConstraints.append(bView.trailingAnchor.constraint(equalTo: dView.leadingAnchor))
        landscapeConstraints.append(bView.centerXAnchor.constraint(equalTo: sA.centerXAnchor))
        
        landscapeConstraints.append(button.widthAnchor.constraint(equalToConstant: 100))
        landscapeConstraints.append(button.heightAnchor.constraint(equalToConstant: 50))
        landscapeConstraints.append(button.centerXAnchor.constraint(equalTo: bView.centerXAnchor))
        landscapeConstraints.append(button.centerYAnchor.constraint(equalTo: bView.centerYAnchor))
        
        
        landscapeConstraints.append(dView.topAnchor.constraint(equalTo: sView.bottomAnchor))
        landscapeConstraints.append(dView.leadingAnchor.constraint(equalTo: bView.trailingAnchor))
        landscapeConstraints.append(dView.bottomAnchor.constraint(equalTo: sA.bottomAnchor))
        landscapeConstraints.append(dView.trailingAnchor.constraint(equalTo: sA.trailingAnchor))
        
        landscapeConstraints.append(dFact.topAnchor.constraint(equalTo: dView.topAnchor))
        landscapeConstraints.append(dFact.leadingAnchor.constraint(equalTo: dView.leadingAnchor))
        landscapeConstraints.append(dFact.bottomAnchor.constraint(equalTo: dFactLabel.topAnchor))
        landscapeConstraints.append(dFact.trailingAnchor.constraint(equalTo: dView.trailingAnchor))
        
        landscapeConstraints.append(dFactLabel.heightAnchor.constraint(equalTo: dFact.heightAnchor, multiplier: 5))
        landscapeConstraints.append(dFactLabel.leadingAnchor.constraint(equalTo: dView.leadingAnchor))
        landscapeConstraints.append(dFactLabel.bottomAnchor.constraint(equalTo: dView.bottomAnchor))
        landscapeConstraints.append(dFactLabel.trailingAnchor.constraint(equalTo: dView.trailingAnchor))

        
        return landscapeConstraints
    }
    
}
