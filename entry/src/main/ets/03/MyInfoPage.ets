import { promptAction } from '@kit.ArkUI';

@Entry
@Component
struct MyInfoPage {
  @State name: string = '';
  @State age: string = '';
  @State gender: string = '';
  @State band: string = '';
  @State money: string = '';

  onButtonClick() {
    promptAction.showToast({
      message: this.name
    })
  }

  build() {
    Row() {
      Column() {
        Row() {
          Text('我的信息')
        }
        .width('100%')
        .justifyContent(FlexAlign.Center)
        .backgroundColor(Color.Pink)
        .height(60)
        Column({space: 20}) {
          Row() {
            Text('姓名:')
            TextInput({placeholder: '请输入姓名'})
              .layoutWeight(1)
              .onChange((value) => {
                this.name = value
              })
          }
          Row() {
            Text('年龄:')
            TextInput({placeholder: '请输入年龄'})
              .layoutWeight(1)
              .onChange((value) => {
                this.age = this.age
              })
          }
          Row() {
            Text('性别：')
            Select([{value: '男'}, {value: '女'}])
              .width('100%')
              .layoutWeight(1)
              .value($$this.gender)
          }
          Row() {
            Text('银行:')
            TextInput({placeholder: '请输入银行'})
              .layoutWeight(1)
              .onChange((value) => {
                this.band = value
              })
          }
          Row() {
            Text('余额:')
            TextInput({placeholder: '请输入余额'})
              .layoutWeight(1)
              .onChange((value) => {
                this.money = value
              })
          }
          Column() {
            Button('确认')
              .width('100%')
              .height(60)
              .margin({bottom: 20})
              .onClick(() => {
                this.onButtonClick()
              })
          }
          .layoutWeight(1)
          .justifyContent(FlexAlign.End)
        }
        .padding({left: 16, right: 16})
        .width('100%')
        .layoutWeight(1)
        Row() {
          Text('个人中心')
        }
        .width('100%')
        .justifyContent(FlexAlign.Center)
        .backgroundColor(Color.Pink)
        .height(60)
      }
      .width('100%')
    }
    .height('100%')
  }
}




