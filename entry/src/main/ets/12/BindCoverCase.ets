@Entry
@Component
struct BindCoverCase {
  @State message: string = 'Hello World';
  @State showContent: boolean = false
  @Builder
  bindContent() {
    Column() {
      Text('模态弹框内容')
    }
    .width('100%')
    .height('100%')
    .backgroundColor(Color.Pink)
  }

  build() {
    Column() {
      Text(this.message)
        .fontSize(50)
        .fontWeight(FontWeight.Bold)

      Button('打开全屏模态')
        .onClick(() => {
          this.showContent = true
        })
    }
    .bindContentCover($$this.showContent, this.bindContent(), {
      modalTransition: ModalTransition.ALPHA
    })
    .height('100%')
    .width('100%')
  }
}