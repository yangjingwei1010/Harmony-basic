
interface Person {
  name: string
  age: string
  teacher: Teacher
}

interface Teacher {
  class: string
  school: string
  student: Student
}

interface Student {
  acount: string
  stage: string
}

@Entry
@Component
struct I2ModelPage {
  @State message: string = 'Hello World';

  build() {
    RelativeContainer() {
      Text(this.message)
        .id('I2ModelPageHelloWorld')
        .fontSize(50)
        .fontWeight(FontWeight.Bold)
        .alignRules({
          center: { anchor: '__container__', align: VerticalAlign.Center },
          middle: { anchor: '__container__', align: HorizontalAlign.Center }
        })
    }
    .height('100%')
    .width('100%')
  }
}
export class PersonModel implements Person {
  name: string = ''
  age: string = ''
  teacher: Teacher = new TeacherModel({} as Teacher)

  constructor(model: Person) {
    this.name = model.name
    this.age = model.age
    this.teacher = model.teacher
  }
}
export class TeacherModel implements Teacher {
  class: string = ''
  school: string = ''
  student: Student = new StudentModel({} as Student)

  constructor(model: Teacher) {
    this.class = model.class
    this.school = model.school
    this.student = model.student
  }
}
export class StudentModel implements Student {
  acount: string = ''
  stage: string = ''

  constructor(model: Student) {
    this.acount = model.acount
    this.stage = model.stage
  }
}
