//
//  ViewController.swift
//  ExpressTest
//
//  Created by Calvin Mo on 16/07/2018.
//  Copyright © 2018 Calvin Mo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  let numberOfColumns = 9
  let numberOfRows = 11

  let words = [
    (string: "Animal", x: 2, y: 0, vertical: true),
    (string: "Busy", x:4, y: 5, vertical: true),
    (string: "Computer", x: 1, y: 9, vertical: false)
    ]
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return numberOfColumns * numberOfRows
  }

  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: LetterCellIdentifier, for: indexPath) as! LetterCell
    
    for word in words {
      var row = indexPath.item / 9
      var column = indexPath.item % 9
      var wordX = word.x
      var wordY = word.y

      if (word.vertical) {
        var tmp = row
        row = column
        column = tmp
        
        tmp = wordX
        wordX = wordY
        wordY = tmp
      }
      
      if (row == wordY &&
        column >= wordX &&
        column < word.string.count + wordX) {
        
        let letterIndex = word.string.index(word.string.startIndex, offsetBy: column - wordX)
        let letterString = word.string[letterIndex]
        cell.letterLabel.text = String(letterString)
      }
    }
    
    return cell
  }

  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    
    let screenRect = UIScreen.main.bounds
    let screenWidth = screenRect.size.width
    let cellWidth = screenWidth/CGFloat(numberOfColumns) - 1
    
    return CGSize(width: cellWidth, height: cellWidth)
  }
}

extension ViewController: UITextFieldDelegate {
  
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    view.endEditing(true)
    return true
  }
}
