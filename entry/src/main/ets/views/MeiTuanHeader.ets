
@Preview
@Component
export default struct MeiTuanHeader {
  build() {
    Row() {
      Text('头部')
        .width('100%')
        .textAlign(TextAlign.Center)
        .height(60)
    }
    .backgroundColor(Color.Red)
  }
}

// export {MeiTuanHeader}