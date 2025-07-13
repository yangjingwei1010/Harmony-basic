import LoadingView from './components/LoadingView';

@Entry
@Component
struct LoadingPage {
  @State message: string = 'Hello World';
  @State isShow: boolean = true

  aboutToAppear(): void {
    setTimeout(() => {
      this.isShow = false
    }, 3 * 1000)
  }

  build() {
    Row() {
      Column() {
        if (this.isShow) {
          LoadingView()
        }
      }
      .width('100%')
    }
    .height('100%')
  }
}