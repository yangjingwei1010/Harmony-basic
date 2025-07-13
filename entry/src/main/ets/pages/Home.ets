import HeaderView from '../homeview/HeaderView'
import MainView from '../homeview/MainView'
import FooterView from '../homeview/FooterView'

@Entry
@Component
struct Home {
  @State message: string = 'Hello World';

  build() {
    Column() {
      HeaderView()
      MainView()
        .layoutWeight(1)
      FooterView()
    }
  }
}