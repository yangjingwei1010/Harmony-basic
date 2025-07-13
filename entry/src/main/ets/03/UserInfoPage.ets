// import { JSON } from '@kit.ArkTS'

// interface InfoType {
//   height: number
//   weight: number
//   bold: number
// }

interface PersonInfo {
  name: string
  age: string
  gender: '男' | '女'
  address: Address
}

interface Address {
  province: string
  city: string
  area: string
  house: House
}

interface House {
  ems: string
}

@Entry
@Component
struct UserInfoPage {
  @State message: string = 'Hello World';
  @State myInfo: PersonInfo = {
    name: '张',
    age: '20',
    gender: '女',
    address: {
      province: '广东',
      city: '广州',
      area: '天河',
      house: {
        ems: '12345'
      }
    }
  }

  build() {
    Row() {
      Column({space: 20}) {
        Text(JSON.stringify(this.myInfo))
          // .backgroundColor(Color.Gray)
        Row() {
          Text('姓名： ')
          TextInput({text: this.myInfo.name}).layoutWeight(1)
            .onChange((value) => {
              this.myInfo.name = value
            })
        }
        Row() {
          Text('年龄： ')
          TextInput({text: this.myInfo.age + ''}).layoutWeight(1)
            .onChange((value) => {
              this.myInfo.age = value
            })
        }
        Row() {
          Text('性别： ')
          Select([{value: '男'}, {value: '女'}]).layoutWeight(1)
            .value(this.myInfo.gender)
            .onSelect((index: number, value: string) => {
              this.myInfo.gender = value as '男' | '女'
            })
        }
        Row() {
          Text('地址： ')
          TextInput({text:this.myInfo.address.province}).layoutWeight(1)
            .onChange((value) => {
              // this.myInfo.address = {
              //   province: value,
              //   city: this.myInfo.address.city,
              //   area: this.myInfo.address.area
              // }
              // this.myInfo = new PersonInfoModel({
              //   name: '张',
              //   age: '20',
              //   gender: '女',
              //   address: {
              //     province: value,
              //     city: '广州',
              //     area: '天河'
              //   }
              // })
              // this.myInfo.address = new AddressModel({
              //   province: value,
              //   city: '广州',
              //   area: '天河'
              // })
              this.myInfo.address.province = value
              this.myInfo.address = new AddressModel(this.myInfo.address)
            })
          TextInput({text:this.myInfo.address.city}).layoutWeight(1)
            .onChange((value) => {
              // this.myInfo.address = {
              //   province: this.myInfo.address.province,
              //   city: value,
              //   area: this.myInfo.address.area
              // }
              this.myInfo.address.city = value
              this.myInfo.address = new AddressModel(this.myInfo.address)
            })
          TextInput({text:this.myInfo.address.area}).layoutWeight(1)
            .onChange((value) => {
              // this.myInfo.address = {
              //   province: this.myInfo.address.province,
              //   city: this.myInfo.address.city,
              //   area: value
              // }
              this.myInfo.address.area = value
              this.myInfo.address = new AddressModel(this.myInfo.address)
            })
        }
        Row() {
          Text('邮编： ')
          TextInput({text:this.myInfo.address.house.ems}).layoutWeight(1)
            .onChange((value) => {
              this.myInfo.address.house.ems = value
              this.myInfo.address.house = new HouseModel(this.myInfo.address.house)
              this.myInfo.address = new AddressModel(this.myInfo.address)
            })
        }
      }
      .width('100%')
    }
    .height('100%')
  }
}
export class PersonInfoModel implements PersonInfo {
  name: string = ''
  age: string = ''
  gender: '男' | '女' = '男'
  address: Address = new AddressModel({} as Address)

  constructor(model: PersonInfo) {
    this.name = model.name
    this.age = model.age
    this.gender = model.gender
    this.address = model.address
  }
}
export class AddressModel implements Address {
  province: string = ''
  city: string = ''
  area: string = ''
  house: House = new HouseModel({} as House)

  constructor(model: Address) {
    this.province = model.province
    this.city = model.city
    this.area = model.area
    this.house = model.house
  }
}
export class HouseModel implements House {
  ems: string = ''

  constructor(model: House) {
    this.ems = model.ems
  }
}
