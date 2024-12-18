
import Foundation
import SwiftUI

struct Fruit: Identifiable {
    
    var id: UUID = UUID()
    var name: String
    var Protein: String
    var Crabs: String
    var Fat: String
    var Fiber: String
    var Cal: String
    var VitA: String
    var VitC: String
    var Iron: String
    var VitD: String
    
}

@Observable
class LearnerViewModel {
      var fruit = [
        Fruit(name: "Apple", Protein: "0.5g", Crabs: "25g" ,Fat: "0.3g", Fiber: "4.4g", Cal: "11mg", VitA: "54IU", VitC: "8.4mg", Iron: "0.2mg" ,VitD: "0IU"),
        Fruit(name: "Orange", Protein: "0.5g", Crabs: "25g" ,Fat: "0.3g", Fiber: "4.4g", Cal: "11mg", VitA: "54IU", VitC: "8.4mg", Iron: "0.2mg" ,VitD: "0IU"),
        Fruit(name: "Kiwi", Protein: "0.8g", Crabs: "10g" ,Fat: "0.4g", Fiber: "2.1g", Cal: "23mg", VitA: "3IU", VitC: "64mg", Iron: "0.2mg" ,VitD: "0IU"),
        Fruit(name: "Avocado", Protein: "3g", Crabs: "12g" ,Fat: "22g", Fiber: "10g", Cal: "18mg", VitA: "146IU", VitC: "10mg", Iron: "0.8mg" ,VitD: "0IU")
        
   ]
       
   }

