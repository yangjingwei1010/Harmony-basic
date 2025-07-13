import { MyLayoutBuilder, StateText } from './builder/BuilderLayout';

@Entry
@Component
struct Builder1Page {
  @State message: string = 'Hello World';

  build() {
    Row() {
      Column({space: 10}) {
        MyLayoutBuilder({
          leftText: '异常时间',
          rightText: '05-14'
        })
        MyLayoutBuilder({
          leftText: '异常地点',
          rightText: '北京'
        })
        MyLayoutBuilder({
          leftText: '异常原因',
          rightText: '未知'
        })
      }
      .height('100%')
      .padding(20)
    }
    .width('100%')
  }
}

