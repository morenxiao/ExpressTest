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
    
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    
    let screenRect = UIScreen.main.bounds
    let screenWidth = screenRect.size.width
    let cellWidth = screenWidth/CGFloat(numberOfColumns) - 1
    
    return CGSize(width: cellWidth, height: cellWidth)
  }
}
