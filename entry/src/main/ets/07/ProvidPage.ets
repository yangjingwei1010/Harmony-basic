@Entry
@Component
struct ProvidePage {
  @Provide
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
      ProvideChild()
    }
    .width('100%')
  }
}

@Component
struct ProvideChild {
  @Consume
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
      ProvideChildChild()
    }
    .width('100%')
  }
}

@Component
struct ProvideChildChild {
  @Consume
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