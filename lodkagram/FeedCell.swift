//
//  FeedCell.swift
//  lodkagram
//
//  Created by Andrew  on 3/3/23.
//

import UIKit
import Firebase

class FeedCell: UITableViewCell {
    
    @IBOutlet weak var userEmailLabel: UILabel!
    
    @IBOutlet weak var commentLabel: UILabel!
    
    @IBOutlet weak var userImageView: UIImageView!
    
    @IBOutlet weak var likeLabel: UILabel!
    
    @IBOutlet weak var documentIdLabel: UILabel!
    
    var likesArrayStorage = [String]() // "user data"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    
    @IBAction func likeButtonClicked(_ sender: Any) {
        
        let fireStoreDatabase = Firestore.firestore()
        
        var currentUser = Auth.auth().currentUser!.email!
        
        if let likeCount = Int(likeLabel.text!) {
            
            if likesArrayStorage.count == 0 {
                likesArrayStorage.append(currentUser)
                let likeStore = ["likes" : likeCount + 1] as [String : Any]
                let userBase = ["likesFromUser" : likesArrayStorage]
                    
                fireStoreDatabase.collection("Posts").document(documentIdLabel.text!).setData(likeStore, merge: true)
                fireStoreDatabase.collection("Posts").document(documentIdLabel.text!).setData(userBase, merge: true)
                
                } else {
                    if likesArrayStorage.contains(where: {$0 == currentUser}) {
                        likesArrayStorage.removeAll(where: { $0 == currentUser })
                        
                        let likeStore = ["likes" : likeCount - 1] as [String : Any]
                        let userBase = ["likesFromUser" : likesArrayStorage]
                        
                        fireStoreDatabase.collection("Posts").document(documentIdLabel.text!).setData(likeStore, merge: true)
                        fireStoreDatabase.collection("Posts").document(documentIdLabel.text!).setData(userBase, merge: true)
                    } else {
                        likesArrayStorage.append(currentUser)
                        let likeStore = ["likes" : likeCount + 1] as [String : Any]
                        let userBase = ["likesFromUser" : likesArrayStorage]
                            
                        fireStoreDatabase.collection("Posts").document(documentIdLabel.text!).setData(likeStore, merge: true)
                        fireStoreDatabase.collection("Posts").document(documentIdLabel.text!).setData(userBase, merge: true)
                    }
            }
                
                
                
            
            
                
            
            
        }

    }
    
    

}
