import { webview } from '@kit.ArkWeb';

@Entry
@Component
struct WebviewCase02 {
  @State message: string = 'Hello World';
  webController: webview.WebviewController = new webview.WebviewController()
  aboutToAppear() {
    // 配置Web开启调试模式
    // .WebviewController.setWebDebuggingAccess(true);
    webview.WebviewController.setWebDebuggingAccess(true);
  }
  build() {
    Column() {
      Web({
        src: 'file://' + getContext().filesDir + '/toutiao/index.html',
        controller: this.webController
      })
        .domStorageAccess(true)
        .width('100%')
        .height('100%')
    }
    .height('100%')
    .width('100%')
  }
}