//
//  LetterCell.swift
//  ExpressTest
//
//  Created by Calvin Mo on 16/07/2018.
//  Copyright © 2018 Calvin Mo. All rights reserved.
//

import UIKit

let LetterCellIdentifier = "LetterCell"

class LetterCell: UICollectionViewCell, UITextFieldDelegate, Buzzable {
    
  @IBOutlet weak var letterLabel: UILabel!
  @IBOutlet weak var letterTextField: UITextField!
  
  override init(frame: CGRect) {
    super.init(frame:frame)

    letterTextField.delegate = self
  }
  
  required init?(coder aDecoder: NSCoder) {
     super.init(coder:aDecoder)
  }
  
  func hasMatched() -> Bool {
    if let toGuess = letterLabel.text, let typed = letterTextField.text {
      if typed == "" {
        return false
      }
        return toGuess.lowercased() == typed.lowercased()
    }
    return false
  }

  func limitToOneCharacter(textField: UITextField) {
    if let text = textField.text {
      if (text.count > 1) {
        textField.text = String(text.first!)
      }
    }
  }

  @IBAction func textFieldEditingChanged(_ sender: UITextField) {
    limitToOneCharacter(textField: sender)
    
    if !hasMatched() {
      sender.text = ""
      buzz()
    }
  }
}
