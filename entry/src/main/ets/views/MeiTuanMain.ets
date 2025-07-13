
@Preview
@Component
struct MeiTuanMain {
  build() {
    Row() {
      Text('中部')
        .textAlign(TextAlign.Center)
        .width('100%')
    }
    .width('100%')
    .justifyContent(FlexAlign.Center)
  }
}

export { MeiTuanMain }