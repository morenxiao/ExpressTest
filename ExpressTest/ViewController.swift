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
    (string: "Animal", x: 2, y: 0),
    (string: "Busy", x:4, y: 5),
    (string: "Computer", x: 1, y: 9)
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
      let row = indexPath.item / 9
      let column = indexPath.item % 9
      
      if (row == word.y &&
        column >= word.x &&
        column < word.string.count + word.x) {
        
        let letterIndex = word.string.index(word.string.startIndex, offsetBy: column - word.x)
        let letterString = word.string[letterIndex]
        cell.letterLabel.text = String(letterString)
      }
    }
    
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    
    let screenRect = UIScreen.main.bounds
    let screenWidth = screenRect.size.width
    let cellWidth = screenWidth/CGFloat(numberOfColumns) - 1
    
    return CGSize(width: cellWidth, height: cellWidth)
  }
}
