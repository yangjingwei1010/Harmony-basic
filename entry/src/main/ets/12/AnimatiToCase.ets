@Entry
@Component
struct AnimatiToCase {
  @State message: string = 'Hello World';
  @State textSize: number = 50
  @State textColor: string = '#000'
  @State textOp: number = 1
  @State positionX: number = 0
  @State positionY: number = 0

  build() {
      Column({space: 20}) {
        Text(this.message)
          .fontSize(this.textSize)
          .fontWeight(FontWeight.Bold)
          .fontColor(this.textColor)
          .opacity(this.textOp)
          .position({
            x: this.positionX,
            y: this. positionY
          })
        Button('隐藏')
          .onClick(() => {
            animateTo({
              duration: 2000
            }, () => {
              this.message = 'wolrd hello'
              this.textSize = 16
              this.textColor = '#ff00f0'
              this.textOp = 0
              this.positionX = 999
              this.positionY = 999
            })
          })
        Button('显示')
          .onClick(() => {
            animateTo({
              duration: 2000
            }, () => {
              this.message = 'hello wolrd'
              this.textSize = 50
              this.textColor = '#000'
              this.textOp = 1
              this.positionX = 0
              this.positionY = 0
            })
          })
      }
      .width('100%')
      .height('100%')
  }
}