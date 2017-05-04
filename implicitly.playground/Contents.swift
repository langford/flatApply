//: Playground - noun: a place where people can play

import UIKit

extension Optional {
    /// Thanks to http://www.russbishop.net/improving-optionals for how to get the "Wrapped" type
    func flatPred(_ f: (Wrapped) -> Bool) -> Bool {
        return self.flatMap(f) ?? false
    }
}

var dict = ["hello":"there", "you":"🐨s"]


//
// Use these to verify it's the same as the precondition with flatmap ?? false
//

var str:String? = dict["🐨s"] //fails as nil
//var str:String? = dict["you"]    //fails as non-there
//var str:String? = dict["hello"]  //succeeds

//precondition( str.flatMap{$0 == "there"} ?? false , "It's not there!")

print("Normal vanilla")

precondition( str.flatPred{ $0 == "there"}, "It's really not there!")

print("naming left to you")

