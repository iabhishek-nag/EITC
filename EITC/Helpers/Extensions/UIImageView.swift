import UIKit
import AlamofireImage

extension UIImageView {
    func setImageWith(imageUrl: String?,
                      imageName: String? = nil,
                      placeHolder: UIImage? = UIImage(named: "placeholder-img")) {
        DispatchQueue.main.async {
            if let urlString = imageUrl, let url = URL(string: urlString) {
                self.af.setImage(withURL: url, placeholderImage: placeHolder)
            } else if let imageName = imageName, let image = UIImage(named: imageName) {
                self.image = image
            } else {
                self.image = placeHolder
            }
        }
    }

}
