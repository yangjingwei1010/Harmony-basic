@Entry
@Component
struct LinkPage {
  @State money: number = 9999;

  build() {
    Column() {
      Text('father:' + this.money)
      Button('存100块')
        .onClick(() => {
          this.money += 100
        })
      Divider()
        .height(10)
      LinkChild({
        money: this.money
      })
    }
    .width('100%')
  }
}

@Component
struct LinkChild {

  // 和传入的值保持一致，不允许有默认值
  @Link
  money: number

  build() {
    Column() {
      Text('father:' + this.money)
      Button('花100块')
        .onClick(() => {
          this.money -= 100
        })
    }
    .padding(20)
    .backgroundColor(Color.Pink)
  }
}