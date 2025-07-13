import animator, { AnimatorOptions, AnimatorResult } from '@ohos.animator';

@Entry
@Component
struct AnimatorCase {
  @State rotateAngle: number = 0
  @State isPlay: boolean = false
  // 准备动画参数
  animateOption: AnimatorOptions = {
    duration: 10 * 1000,
    delay: 0,
    iterations: -1,
    easing: 'linear',
    fill: 'backwards',
    direction: 'normal',
    begin: 0,
    end: 360
  }
  // 获取动画结果
  animateResult: AnimatorResult = animator.create(this.animateOption)

  aboutToAppear(): void {
    // 监听动画更新函数
    this.animateResult.onFrame = (val) => {
      this.rotateAngle = val
    }
  }
  build() {
    Column({space: 20}) {
     Image($r('app.media.b'))
       .width(200)
       .height(200)
       .borderRadius(100)
       .rotate({
         angle: this.rotateAngle
       })

      Button('播放/暂停')
        .onClick(() => {
          this.isPlay ? this.animateResult.pause() : this.animateResult.play()
          this.isPlay = !this.isPlay
        })
    }
    .height('100%')
    .width('100%')
  }
}