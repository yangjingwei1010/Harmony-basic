import { window } from '@kit.ArkUI';

@Entry
@Component
struct SafeAreaPage {
  @State message: string = 'Hello World';
  @State topSafeHeight: number = 0
  @State bottomSageHeight: number = 0

  // 方法一：
  aboutToAppear(): void {
    // 2.指定页面开启安全区
    window.getLastWindow(getContext()).then((win) => {
      win.setWindowLayoutFullScreen(true)
      // 获取安全区高度
      this.topSafeHeight = px2vp(win.getWindowAvoidArea(window.AvoidAreaType.TYPE_SYSTEM).topRect.height)
      // 获取底部安全区
      this.bottomSageHeight = px2vp(win.getWindowAvoidArea(window.AvoidAreaType.TYPE_NAVIGATION_INDICATOR).bottomRect.height)
      AlertDialog.show({
        message: `
        上方安全区：${this.topSafeHeight}
        底部安全区：${this.bottomSageHeight}
        `
      })
    })
  }

  build() {
    Column() {
      Image($r('app.media.b'))
        // 方法二：
        .expandSafeArea([SafeAreaType.SYSTEM], [SafeAreaEdge.TOP])
    }
    .width('100%')
    .height('100%')
    .padding({
      top: this.topSafeHeight,
      bottom: this.bottomSageHeight
    })
    .backgroundColor(Color.Green)

  }
}