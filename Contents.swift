//1. Class-ი სახელით Animal, with properties: name, species, age. ამ class აქვს:
//Designated init ამ properties ინიციალიზაციისთვის.
//Method makeSound() რომელიც დაგვი-print-ავს ცხოველის ხმას.
 
class Animal {
    var name: String
    var species: String
    var age: Int
    
    init(name: String, species: String, age: Int){
        self.name = name
        self.species = species
        self.age = age
    }
    
    required init() {
        fatalError("Animal class is abstract da it's not possible to creat directly!")
    }
    
    func makeSound() {
        print("Animal sound 🎵 📣")
    }
    
}

//Animal-ის child class სახელად Mammal (ძუძუმწოვრები).
//დამატებითი String property -> furColor.
//Override method makeSound() სადაც აღწერთ შესაბამის ხმას.
//Init-ი -> სახელით, ასაკით, ბეწვის ფერით.
//convenience init -> სახელით, ბეწვის ფერით.

class Mammal: Animal {
    var furColor: String
    
    init(furColor: String, name: String, age: Int) {
        self.furColor = furColor
        
        super.init(name: name, species: "mammal", age: age)
    }
    
    
    convenience init(name: String, furColor: String) {
        self.init(furColor: furColor, name: name, age: 2)
    }
    
    required init() {
        fatalError("Animal class is abstract da it's not possible to creat directly!")
    }
    
    
    override func makeSound() {
        print("Mammal sound: 🎵🔔")
    }
}

//Animal-ის child class: Bird.
//დამატებითი Bool property: canFly.
//Override method makeSound() სადაც ავღწერ შესაბამის ხმას.
//Init -> სახელით, ასაკით, შეუძლია თუ არა ფრენა.
//convenience init -> სახელით, შეუძლია თუ არა ფრენა.

class Bird: Animal {
    var canFly: Bool
    
    init(name: String, age: Int, canFly: Bool) {
        self.canFly = canFly
        
        super.init(name: name, species: "Bird", age: age)
    }
    
    convenience init(name: String, canFly: Bool) {
        self.init(name: name, age: 0, canFly: canFly)
    }
    
    required init() {
        fatalError("Animal class is abstract da it's not possible to creat directly!")
    }
    
    
    override func makeSound() {
        print("Bird sound  🐤🐦")
    }
}

//4. Animal-ის child class: Reptile.
//დამატებითი Bool property: isColdBlooded.
//Override method makeSound() სადაც ავღწერ შესაბამის ხმას.
//Failable Init თუ რეპტილიას ასაკი ნაკლებია 0-ზე ვაბრუნებთ nil-ს.

class Reptile: Animal {
    var isColdBlooded: Bool
    
    init?(name: String, age: Int, isColdBlooded: Bool){
        if age >= 0 {
            self.isColdBlooded = isColdBlooded
            super.init(name: name, species: "Reptile", age: age)
        } else {
            return nil
        }
    }
    
    required init() {
        fatalError("Animal class is abstract da it's not possible to creat directly!")
    }
    
    
    override func makeSound() {
        print("Reprile sound: 🦎🐊")
    }
}

//Mammal-ის child class: Lion.
//დამატებით String property: maneColor.
//Override მეთოდი makeSound() სადაც ავღწერ შესაბამის ხმას.

class Lion: Mammal {
    var maneColor: String
    
    init(maneColor: String, name: String) {
        self.maneColor = maneColor
        super.init(furColor: "Yello", name: name, age: 3)
    }
    
    required init() {
        fatalError("Animal class is abstract da it's not possible to creat directly!")
    }
    
    override func makeSound() {
        print("Lion sound: 🦁📣")
    }
}

//Bird-ის child class: Eagle.
//დამატებით Double property: wingspan.
//Override მეთოდი makeSound() სადაც ავღწერ შესაბამის ხმას.

class Eagle: Bird {
    var wingspan: Double
    
    init(wingspan: Double) {
        self.wingspan = wingspan
        super.init(name: "Eagle", age: 2, canFly: true)
    }
    
    required init() {
        fatalError("Animal class is abstract da it's not possible to creat directly!")
    }
    
    
    override func makeSound() {
        print("Eagle sound 🦅")
    }
}

//Reptil-ის child class: Snake.
//დამატებით Double property: length.
//Override მეთოდი makeSound() სადაც ავღწერ შესაბამის ხმას.

class Snake: Reptile {
    var length: Double
    
    init?(length: Double) {
        self.length = length
        super.init(name: "Snake", age: 2, isColdBlooded: true)
    }
    
    required init() {
        fatalError("Animal class is abstract da it's not possible to creat directly!")
    }
    
    
    override func makeSound() {
        print("Snake sound 🐍")
    }
}

//შევქმნათ ზოოპარკის ცხოველების Array, დავამატოთ მასში სხვადასხვა სახის ცხოველები: 2-2 Mammal, Bird, Reptile ასევე შევქმნათ 1-1 Lion, Eagle, Snake.

let zoo = [Mammal(name: "Elephant", furColor: "Grey"), Mammal(furColor: "Red", name: "Dog", age: 2),
          Bird(name: "Mockingbird", canFly: true), Bird(name: "Chicken", age: 1, canFly: true),
          Reptile(name: "Chameleon", age: 1, isColdBlooded: true), Reptile(name: "Lizard", age: 2, isColdBlooded: true),
          Eagle(wingspan: 2.0), Snake(length: 1.5), Lion(maneColor: "Red", name: "Lion")]

//10. დავბეჭდოთ ჩვენი Array-იდან, ყველა ცხოველის სახელი, სახეობა, ასაკი, და ასე გამოვიძახოთ makeSound მეთოდი.

for animal in zoo {
    print(animal?.name ?? "", animal?.species ?? "", animal?.age ?? 0)
    animal?.makeSound()
}




var dog = Mammal(furColor: "gogo", name: "ponchika", age: 4)
dog.makeSound()

var mySnake = Snake(length: 22)

var myEagle = Eagle(wingspan: 44)
myEagle.makeSound()

mySnake?.name
 
