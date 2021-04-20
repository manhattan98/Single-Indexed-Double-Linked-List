//
//  LinkedList.swift
//  Single Indexed Double Linked List
//
//  Created by Eremej Sumcenko on 15.04.2021.
//

import Foundation

protocol LinkedList {
    var count: Int { get }
    
    /** Get the value of the index-th node in the linked list. If the index is invalid, return -1. */
    func get(_ index: Int) -> Int
    
    /** Add a node of value val before the first element of the linked list. After the insertion, the new node will be the first node of the linked list. */
    func addAtHead(_ val: Int)
    
    /** Append a node of value val to the last element of the linked list. */
    func addAtTail(_ val: Int)
    
    /** Add a node of value val before the index-th node in the linked list. If index equals to the length of linked list, the node will be appended to the end of linked list. If index is greater than the length, the node will not be inserted. */
    func addAtIndex(_ index: Int, _ val: Int)
    
    /** Delete the index-th node in the linked list, if the index is valid. */
    func deleteAtIndex(_ index: Int)
}
