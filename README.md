# flatApply

This is a function that makes optionals in preconditions a little less painful:



    import UIKit

    extension Optional {
    /// Thanks to http://www.russbishop.net/improving-optionals for how to get
    the "Wrapped" type
        func flatApply(_ f: (Wrapped) -> Bool) -> Bool {
            if self == nil {return false}
            return self.flatMap(f)!
        }
     }

     var dict = ["hello":"there", "you":"people"]


     //
     // Use these to verify it's the same as the precondition with flatmap ?? false
     //

     var str:String? = dict["people"] //fails as nil
     //var str:String? = dict["you"]    //fails as non-there
     //var str:String? = dict["hello"]  //succeeds

     //precondition( str.flatMap{$0 == "there"} ?? false , "It's not there!")

     print("Normal vanilla")

     precondition( str.flatApply{ $0 == "there"}, "It's really not there!")

     print("naming left to you, I dislike flatApply and flatPred")


