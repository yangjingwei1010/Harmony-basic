@Component
struct BuildParamComponent {
  @State leftText: string = '默认内容'
  @BuilderParam
  rightContent?: ()=>void

  build() {
    Row() {
      Text(this.leftText)
      if (this.rightContent) {
        this.rightContent()
      }
    }
    .borderRadius(10)
    .width('100%')
    .padding(20)
    .backgroundColor('#ccc')
    .justifyContent(FlexAlign.SpaceBetween)
  }
}

export { BuildParamComponent }