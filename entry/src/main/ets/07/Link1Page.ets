@Entry
@Component
struct Link1Page {
  @State
  money: number = 0

  build() {
    Column() {
      Text('爷爷：' + this.money)
      Button('+10')
        .onClick(() => {
          this.money += 10
        })
      Divider()
        .height(20)
      Link1Child({
        money: this.money
      })
    }
    .width('100%')
  }
}

@Component
struct Link1Child {
  @Link
  money: number

  build() {
    Column() {
      Text('儿子：' + this.money)
      Button('-10')
        .onClick(() => {
          this.money -= 10
        })
      Divider()
        .height(20)
      Link1ChildChild({
        money: this.money
      })
    }
    .width('100%')
  }
}

@Component
struct Link1ChildChild {
  @Link
  money: number

  build() {
    Column() {
      Text('孙子：' + this.money)
      Button('+10')
        .onClick(() => {
          this.money += 10
        })
    }
    .width('100%')
  }
}