@Entry
@Component
struct GetKeyboardCase {
  @State message: string = 'Hello World';

  build() {
    Column() {
      Column() {
        Text('顶部区域')
      }
      .padding(20)
      .width('100%')
      Column() {
        Text('中间内容')
      }
      .width('100%')
      .layoutWeight(1)
      .backgroundColor(Color.Green)
      .justifyContent(FlexAlign.Center)
      Row() {
        TextInput({placeholder: '请输入'})
      }
      .width('100%')
      .padding(10)
    }
    .width('100%')
    .height('100%')

  }
}