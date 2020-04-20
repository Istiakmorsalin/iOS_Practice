
import UIKit

class FlickerPhotosViewController: UICollectionViewController {
  
  private let reuseIdentifier = "FlickrCell"
  private let sectionInsets = UIEdgeInsets(top: 50.0, left: 20.0, bottom: 50.0, right: 20.0)
  private var searches: [FlickrSearchResults] = []
  private let flicker = Flickr()
  private let itemsPerRow: CGFloat = 3

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

private extension FlickerPhotosViewController {
  func photo (for indexPath: IndexPath) -> FlickrPhoto {
    return searches[indexPath.section].searchResults[indexPath.row]
  }
}

// MARK: - Text Field Delegate
extension FlickerPhotosViewController : UITextFieldDelegate {
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    // 1
    let activityIndicator = UIActivityIndicatorView(style: .gray)
    textField.addSubview(activityIndicator)
    activityIndicator.frame = textField.bounds
    activityIndicator.startAnimating()
    
    flicker.searchFlickr(for: textField.text!) { searchResults in
      activityIndicator.removeFromSuperview()
      
      switch searchResults {
      case .error(let error) :
        // 2
        print("Error Searching: \(error)")
      case .results(let results):
        // 3
        print("Found \(results.searchResults.count) matching \(results.searchTerm)")
        self.searches.insert(results, at: 0)
        // 4
        self.collectionView?.reloadData()
      }
    }
    
    textField.text = nil
    textField.resignFirstResponder()
    return true
  }
}

// MARK: - UICollectionViewDataSource
extension FlickerPhotosViewController {
  
  override func numberOfSections(in collectionView: UICollectionView) -> Int {
    return searches.count
  }
  
  override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return searches[section].searchResults.count
  }
  
  override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    //1
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier,
                                                  for: indexPath) as! FlickerPhotoCell
    //2
    let flickrPhoto = photo(for: indexPath)
    cell.backgroundColor = .white
    //3
    
    cell.imageView.image = flickrPhoto.thumbnail
    
    return cell
  }
  
}

// MARK: - Collection View Flow Layout Delegate
extension FlickerPhotosViewController : UICollectionViewDelegateFlowLayout {
  //1
  func collectionView(_ collectionView: UICollectionView,
                      layout collectionViewLayout: UICollectionViewLayout,
                      sizeForItemAt indexPath: IndexPath) -> CGSize {
    //2
    let paddingSpace = sectionInsets.left * (itemsPerRow + 1)
    let availableWidth = view.frame.width - paddingSpace
    let widthPerItem = availableWidth / itemsPerRow
    
    return CGSize(width: widthPerItem, height: widthPerItem)
  }
  
  //3
  func collectionView(_ collectionView: UICollectionView,
                      layout collectionViewLayout: UICollectionViewLayout,
                      insetForSectionAt section: Int) -> UIEdgeInsets {
    return sectionInsets
  }
  
  // 4
  func collectionView(_ collectionView: UICollectionView,
                      layout collectionViewLayout: UICollectionViewLayout,
                      minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    return sectionInsets.left
  }
}


