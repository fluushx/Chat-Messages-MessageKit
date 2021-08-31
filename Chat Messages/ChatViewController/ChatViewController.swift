//
//  ChatViewController.swift
//  Chat Messages
//
//  Created by Felipe Ignacio Zapata Riffo on 31-08-21.
//

import UIKit
import MessageKit

struct Sender:SenderType {
    var senderId: String
    var displayName: String
}

struct Message:MessageType {
    var sender: SenderType
    var messageId: String
    var sentDate: Date
    var kind: MessageKind
}


class ChatViewController: MessagesViewController,MessagesDataSource,MessagesLayoutDelegate,MessagesDisplayDelegate {
    
    static let identifier = "cell"
    let currentUser = Sender(senderId: "First", displayName: "First Person")
    let anotherUser = Sender(senderId: "Second", displayName: "Second Person")
    var message = [MessageType]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        messagesCollectionView.messagesDataSource = self
        messagesCollectionView.messagesLayoutDelegate = self
        messagesCollectionView.messagesDisplayDelegate =  self
        setUpMessage()
         
    }
    
    func setUpMessage(){
        message.append(Message(sender: currentUser,
                               messageId: "1",
                               sentDate: Date().addingTimeInterval(-86400),
                               kind: .text("hello it's me, it's been a long time")))
        message.append(Message(sender: currentUser,
                               messageId: "1",
                               sentDate: Date().addingTimeInterval(-86400),
                               kind: .text("how are you ?")))
        message.append(Message(sender: anotherUser,
                               messageId: "3",
                               sentDate: Date().addingTimeInterval(-86400),
                               kind: .text("I'm fine thanks, I adopted a puppy a few weeks ago :)")))
        message.append(Message(sender: currentUser,
                               messageId: "4",
                               sentDate: Date().addingTimeInterval(-86400),
                               kind: .text("Really? Send me photos when you can haha")))
        message.append(Message(sender: anotherUser  ,
                               messageId: "5",
                               sentDate: Date().addingTimeInterval(-86400),
                               kind: .text("I'm at work now, but when I can, I'll go to a meeting now, we'll talk later bye! you have a good day!")))
        message.append(Message(sender: currentUser,
                               messageId: "6",
                               sentDate: Date().addingTimeInterval(-86400),
                               kind: .text("OKAY! we'll talk later, you too have a good day! bye Bye!")))
        
    }
    func currentSender() -> SenderType {
        return currentUser
    }
    
    func messageForItem(at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> MessageType {
        return message[indexPath.section]
    }
    
    func numberOfSections(in messagesCollectionView: MessagesCollectionView) -> Int {
        message.count
    }
    
}

