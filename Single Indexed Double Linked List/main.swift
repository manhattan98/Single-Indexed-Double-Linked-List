//
//  main.swift
//  Single Indexed Double Linked List
//
//  Created by Eremej Sumcenko on 14.04.2021.
//

import Foundation

// MARK: - DLNode test
print("DLNode test: ")

var node = DLNode(1)
var tail = DLNode(2)
node.linkNext(tail)
node.linkNext(3)
var four = DLNode(4)
node.linkNext(four)
node.linkNext(5)
four.linkPrevious(-1)
// 1 2 3 -1 4 5

printList(head: node)
printList(tail: tail)

// MARK: - MyLinkedList test
print("MyLinkedList test")

let list = CachedList()
list.addAtHead(7)
list.addAtHead(2)
list.addAtHead(1)
list.addAtIndex(3, 0)
list.addAtHead(9)
list.addAtHead(-1)
list.addAtHead(-2)
list.addAtTail(11)

/*list.addAtTail(1)
list.addAtTail(2)
list.addAtTail(7)
list.addAtTail(0)*/

/*printList(list)

list.deleteHead()

printList(list)

list.deleteTail()*/

printList(list: list)

print("list nodes: ")
printList(head: list.root.next!)

//print("index nodes: ")
//printList(head: list.indexRoot.next!)
//printList(tail: list.end)
