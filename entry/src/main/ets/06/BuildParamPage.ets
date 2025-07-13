@Entry
@Component
struct BuildParamPage {
  @State message: string = 'Hello World';
  @Builder
  LeftBuilder() {
    Image($r('sys.media.ohos_ic_compnent_titlebar_back'))
      .width(20)
  }
  @Builder
  centerBuilder() {
    Text('最新推荐')
      .layoutWeight(1)
      .textAlign(TextAlign.Center)
  }
  @Builder
  rightBuilder() {
    Image($r('sys.media.ohos_ic_public_scan'))
      .width(20)
  }

  build() {
    Row() {
      Column() {
        // this.MyHeader()
        MyBuilderParam({
          leftContent: this.LeftBuilder,
          centerContent: this.centerBuilder,
          // 推荐使用箭头函数
          rightContent: () => {
            this.rightBuilder()
          }
        })
      }
      .width('100%')
    }
    .height('100%')
  }
}

@Component
struct MyBuilderParam {
  @Builder
  defaultParam() {
    Text('返回')
  }
  @Builder
  defaultCenterParam() {
    Text('首页')
      .layoutWeight(1)
      .textAlign(TextAlign.Center)
  }
  @Builder
  rightParam() {
    Text('返回')
  }
  @BuilderParam
  leftContent: ()=>void = this.defaultParam
  @BuilderParam
  centerContent: ()=>void = this.defaultCenterParam
  @BuilderParam
  rightContent: ()=>void = this.rightParam
  build() {
    Row() {
      // 左
      this.leftContent()
      // 中
      this.centerContent()
      // 右
      this.rightContent()
    }
    .backgroundColor(Color.Pink)
    .width('100%')
    .padding(20)
  }
}