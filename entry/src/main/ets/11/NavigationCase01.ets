@Entry
@Component
struct NavigationCase01 {

  // API9
  build() {
    Navigation() {
      // 1、页面内容
      Column() {
        Text('API9-Navigation')
      }.padding(20)
      // 2、跳转按钮
      NavRouter() {
        // 只能放置一个组件，多个会覆盖，不需要写跳转事件
        Button('下一页')
        Image($r('app.media.b'))
        // 3、下一个页面
        NavDestination() {
          Text('第二个页面')
            .fontSize(50)
          NavRouter() {
            Button('跳转下一个页面')
            NavDestination() {
              Text('第三个页面')
                .fontSize(50)
            }
          }
        }
      }
    }
  }
}