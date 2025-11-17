import Cocoa



//day 7 -- checkpoint

enum  sqrRootError: Error {
  case exceeds, no_root
}

func sqrRoot(of number: Double, tolerance: Double =  0.00001) throws -> Double {
    if number <= 0 {
        throw sqrRootError.no_root
    }
    if number > 1000000 {
        throw sqrRootError.exceeds
    }
    var x = number
    while true {
        let next = 0.5 * (x + number / x)
        if abs(x - next) < tolerance {
            return next
        }
        x = next
    }
}

do {
    try print(sqrRoot(of: 25))
}

catch sqrRootError.exceeds {
    print ("not valid")
}
catch sqrRootError.no_root {
    print ("no root")
} catch {
    print ("unknown error")
}



