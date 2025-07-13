@Entry
@Component
struct PreferenceStoragePage2 {
  @State message: string = '已登录';

  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
      }
      .height('100%')
    }
    .width('100%')
  }
}