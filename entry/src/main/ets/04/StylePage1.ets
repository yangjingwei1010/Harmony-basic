import { promptAction } from '@kit.ArkUI';

@Styles
function MyButtonStyle() {
  .width('80%')
  .backgroundColor(Color.Blue)
  .onClick(() => {
    promptAction.showToast({
      message: '支付宝支付成功'
    })
  })
}

@Entry
@Component
struct StylePage1 {
  @State message: string = 'Hello World';
  // 组件内声明, 只能在当前组件使用
  @Styles
  MyStyleFunction() {
    .width('80%')
    .backgroundColor('#FF00FF0F')
    .onClick(() => {
      promptAction.showToast({
        message: '微信支付成功'
      })
    })
  }

  build() {
    Row() {
      Column({space: 20}) {
        Button('微信支付')
          .MyStyleFunction()
        Button('微信支付')
          .MyStyleFunction()
        Button('支付宝支付')
          .MyButtonStyle()
        Button('支付宝支付')
          .MyButtonStyle()
      }
      .width('100%')
    }
    .height('100%')
  }
}