// import { JSON } from '@kit.ArkTS'

class GoodItem {
  id: number = 0
}

@Entry
@Component
struct NavigationCase02 {
  @Builder
  navDesBuilder(name: string) {
    if (name === 'one') {
      NavDestination() {
        Text('one')
        Button('去two')
          .onClick(() => {
            this.navPathStack.pushPath({
              name: 'two',
              param: {
                id: 1
              } as GoodItem
            })
          })
      }
    } else if (name === 'two') {
      NavDesChild()
    }
  }
  @Provide
  navPathStack: NavPathStack = new NavPathStack()
  // API11
  build() {
    // 维护一个路由站
    Navigation(this.navPathStack) {
      Scroll() {
        Column() {
          Button('下一页')
            .onClick(() => {
              this.navPathStack.pushPath({
                name: 'one',
              })
            })
          Image($r('app.media.b'))
          Image($r('app.media.b'))
          Image($r('app.media.b'))
          Image($r('app.media.b'))
          Image($r('app.media.b'))
          Image($r('app.media.b'))
        }
      }
    }
    .title('吴彦祖')
    .titleMode(NavigationTitleMode.Free)
    .navDestination(this.navDesBuilder)
  }
}

@Component
struct NavDesChild {
  @Consume
  navPathStack: NavPathStack
  aboutToAppear(): void {
    AlertDialog.show({
      message: JSON.stringify(this.navPathStack.getParamByName('two'))
    })
  }
  build() {
    NavDestination() {
      Text('Two')
      Button('去three')
        .onClick(() => {
          this.navPathStack.pushPath({
            name: 'three'
          })
        })
    }.title('返回')
  }
}