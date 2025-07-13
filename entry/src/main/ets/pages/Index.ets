
import MeiTuanHeader from '../views/MeiTuanHeader'
import {MeiTuanMain} from '../views/MeiTuanMain'
import MeiTuanFooter from '../views/MeiTuanFooter'

@Entry
@Component
struct Index {
  @State message: string = 'Hello World';

  build() {
  Column() {
      MeiTuanHeader()  // 60
      MeiTuanMain()
        .layoutWeight(1)
        .backgroundColor(Color.Green)
      MeiTuanFooter()  // 60
    }
    .margin({top: 0})
    .height('100%')
  }
}