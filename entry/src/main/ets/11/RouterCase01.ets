import { promptAction, router } from '@kit.ArkUI';

class OrderId {
  id: number = 0
}

@Entry
@Component
struct RouterCase01 {
  @State message: string = 'RouterCase01';
  aboutToAppear(): void {
    router.showAlertBeforeBackPage({
      message: '确定离开吗？'
    })
    if (router.getParams()) {
      promptAction.showToast({
        message: `
      当前栈数量：${router.getLength()}
      当前页面参数: ${JSON.stringify(router.getParams())}
      当前订单号：${(router.getParams() as OrderId).id}
      当前页面状态：${JSON.stringify(router.getState())}
      `
      })
    }
  }
  build() {
    RelativeContainer() {
      Column() {
        Text(this.message)
          .id('RouterCase01HelloWorld')
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
          .alignRules({
            center: { anchor: '__container__', align: VerticalAlign.Center },
            middle: { anchor: '__container__', align: HorizontalAlign.Center }
          })
        Button('PUSH Url')
          .onClick(() => {
            router.pushUrl({
              url: '11/RouterCase02'
            })
          })
        Button('带参数跳转')
          .onClick(() => {
            router.replaceUrl({
              url: '11/RouterCase02',
              params: {
                id: 123
              }
            })
          })
      }
    }
    .height('100%')
    .width('100%')
  }
}