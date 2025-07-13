import { promptAction, router } from '@kit.ArkUI';
import { JSON } from '@kit.ArkTS';

class OrderId {
  id: number = 0
}

@Entry
@Component
struct RouterCase02 {
  @State message: string = 'RouterCase02';
  aboutToAppear(): void {
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
          .id('RouterCase02HelloWorld')
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
          .alignRules({
            center: { anchor: '__container__', align: VerticalAlign.Center },
            middle: { anchor: '__container__', align: HorizontalAlign.Center }
          })
        Button('PUSH Url 到01')
          .onClick(() => {
            router.pushUrl({
              url: '11/RouterCase01'
            })
          })
        Button('返回到上一个页面')
          .onClick(() => {
            router.back()
          })
        Button('不记录栈数据-replace url')
          .onClick(() => {
            router.replaceUrl({
              url: '11/RouterCase02'
            })
          })
        Button('带参数跳转')
          .onClick(() => {
            router.replaceUrl({
              url: '11/RouterCase01',
              params: {
                id: 456
              }
            })
          })
        Button('单利模式跳转')
          .onClick(() => {
            router.pushUrl({
              url: '11/RouterCase01'
            },router.RouterMode.Single)
          })
      }

    }
    .height('100%')
    .width('100%')
  }
}