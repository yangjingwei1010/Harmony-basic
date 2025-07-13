import { router } from '@kit.ArkUI';
import ('@ohos/test/src/main/ets/pages/Index')

@Entry
@Component
struct RouterBundleCase {
  @State message: string = 'Hello World';

  build() {
    Row() {
      Column({space: 20}) {
        Button('路径跳转到其他HSP包页面')
          .onClick(() => {
            router.pushUrl({
              // @包名/模块名/页面路径
              url: '@bundle:com.example.firsttest/library/ets/pages/Index'
            })
          })

        Button('name跳转到其他HSP包页面')
          .onClick(() => {
            router.pushNamedRoute({
              name: 'hsp-test'
            })
          })

        // Button('路径跳转到其他HAP包页面')
        //   .onClick(() => {
        //     router.pushUrl({
        //       // @包名/模块名/页面路径
        //       url: '@bundle:com.example.firsttest/feature/ets/pages/Index'
        //     })
        //   })
      }
      .width('100%')
    }
    .height('100%')
  }
}