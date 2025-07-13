@Entry
@Component
struct AnimationCase {
  @State message: string = 'Hello World';
  @State textSize: number = 50
  @State textColor: string = '#000'
  @State textOp: number = 1
  @State bgColor: string = '#fff'

  build() {
    Column() {
      Text(this.message)
        .fontSize(this.textSize)
        .fontWeight(FontWeight.Bold)
        .backgroundColor(this.bgColor)
        .animation({
          duration: 2000,
          // 动画执行次数
          iterations: 3,
          // 动画运动曲线
          curve: Curve.EaseInOut,
          //动画延迟时间
          // delay: 1000,
          // 播放模式
          playMode: PlayMode.Alternate
        })
      Button('变小')
        .onClick(() => {
          this.textSize = 12
          this.bgColor = '#ff00f0f0'
        })
    }
    .height('100%')
    .width('100%')
  }
}