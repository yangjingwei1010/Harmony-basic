import { router, Router } from '@kit.ArkUI';

@Entry
@Component
struct ShareAnimationCase01 {
  @State message: string = 'ShareAnimationCase01';

  build() {
    Column() {
      Text(this.message)
        .fontSize(50)
        .fontWeight(FontWeight.Bold)
      Image($r('app.media.b'))
        .width(200)
        .sharedTransition('imageShared')
      Button('跳转到02')
        .onClick(() => {
          router.pushUrl({
            url: '12/ShareAnimationCase02'
          })
        })
    }
    .height('100%')
    .width('100%')
  }
}