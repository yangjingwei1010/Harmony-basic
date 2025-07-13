import { promptAction } from '@kit.ArkUI';

@Extend(Button)
function MyButtonExrend(type: 'wechat' | 'alipay') {
  .type(ButtonType.Normal)
  .width('80%')
  .backgroundColor(type === 'wechat' ? Color.Green : Color.Blue)
  .onClick(() => {
    promptAction.showToast({
      message: type === 'wechat' ? '微信支付成功' : '支付宝支付成功'
    })
  })
}

@Entry
@Component
struct ExtendPage1 {
  @State message: string = 'Hello World';

  build() {
    Row() {
      Column({space: 20}) {
        Button('微信支付')
          .MyButtonExrend('wechat')
        Button('支付宝支付')
          .MyButtonExrend('alipay')
      }
      .width('100%')
    }
    .height('100%')
  }
}