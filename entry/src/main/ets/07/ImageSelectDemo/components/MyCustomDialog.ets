//
@CustomDialog
struct MyCustomDialog {
  controller: CustomDialogController
  @Prop
  selectList: ResourceStr[]
  @State
  activeIndex: number = 0

  build() {
    Column(){
      Swiper() {
        ForEach(this.selectList, (item: ResourceStr) => {
          Image(item)
            .width('100%')
        })
      }.index($$this.activeIndex)
      Text(`${this.activeIndex + 1} / ${this.selectList.length}`)
        .fontColor('#fff')
        .margin(5)
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
    .backgroundColor(Color.Black)
    .onClick(() => {
      this.controller.close()
    })
  }
}

export { MyCustomDialog }