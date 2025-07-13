@Entry
@Component
struct PageAliveCase {
  @State message: string = 'Hello World';
  // 页面初始化
  aboutToAppear(): void {

  }
  // 页面销毁
  aboutToDisappear(): void {

  }
  // 组件不包含下面3个
  // 页面展示
  onPageShow(): void {

  }

  onPageHide(): void {

  }

  onBackPress(): boolean | void {
  }

  build() {
    Row() {
      Column() {

      }
      .width('100%')
    }
    .height('100%')
  }
}