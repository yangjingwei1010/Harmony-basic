@Entry
@Component
struct BaiduCase {
  @State message: string = 'Hello World';

  build() {
    Row() {
      Column({space: 5}) {
        Row() {
          Image('https://www.baidu.com/img/PCtm_d9c8750bed0b3c7d089fa7d55720d6cf.png')
            .width(180)
        }
        .width('100%')
        .justifyContent(FlexAlign.Center)
        Row() {
          TextInput({placeholder: '请输入'})
            .layoutWeight(1)
            .border({
              width: 2,
              color: '#ff608be0'
            })
            // 自身位置移动
            .borderRadius({
              topLeft: 5,
              bottomLeft: 5
            })
          Button('百度一下')
            .type(ButtonType.Normal)
            .borderRadius({
              topRight: 5,
              bottomRight: 5
            })
            .height(43)
            .translate({
              x: -3
            })
        }
        .padding(16)
        .width('100%')
      }
      .width('100%')
    }
    .height('100%')
  }
}