@Entry
@Component
struct PropPage {
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
      PropChild({
        money: this.money
      })
    }
    .width('100%')
  }
}

@Component
struct PropChild {
  // @State // state修饰默认只生效一次
  // 以父组件为主，父组件改变会覆盖子组件的值
  @Prop // 单项传值，父传子 传入的值改变也会引起UI更新
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